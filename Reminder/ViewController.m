//
//  ViewController.m
//  Reminder
//
//  Created by Cynthia Whitlatch on 11/23/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnnotationViewController.h"
#import "ViewController.h"
#import <Parse/Parse.h>
#import "LocationController.h"
#import "DetailViewController.h"

@interface ViewController () <LocationControllerDelegate, MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController
@synthesize coordinate;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MKPointAnnotation *myAnnotation = [[MKPointAnnotation alloc]init];
    
    _mapView.delegate = self;
    
    self.mapView.showsUserLocation = YES;
    self.mapView.showsPointsOfInterest = YES;
    [self.mapView.layer setCornerRadius:20.0];
    
    PFObject *testObject = [PFObject objectWithClassName:@"Location"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];
    
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGesture:)];
    longPressGesture.minimumPressDuration = 1.0;
    [self.mapView addGestureRecognizer:longPressGesture];
    
    myAnnotation.coordinate = CLLocationCoordinate2DMake(47.606209, -122.332071);
    [self.mapView addAnnotation:myAnnotation];
}
- (IBAction)handleLongPressGesture:(UILongPressGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan)
        return;
    
    CGPoint point = [sender locationInView:self.mapView];
    CLLocationCoordinate2D coordinate = [self.mapView
                                          convertPoint:point
                                          toCoordinateFromView:self.mapView];
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc]init];
    annotation.coordinate = coordinate;
    annotation.title = @"Touch Location";
    annotation.subtitle = @"Get Pizza";
    
    [self.mapView removeAnnotation:annotation];
    [self.mapView addAnnotation:annotation];
    
}

#pragma mark - LocationControllerDelegate

- (void)locationControllerDidUpdateLocation:(CLLocation *)location {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location.coordinate, 500.0, 500.0);
    [self setRegion:region];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[LocationController sharedController]start];
    [[LocationController sharedController]setDelegate:self];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[LocationController sharedController]stop];

}

#pragma mark - MKMapViewDelegate
     
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {

    if ([annotation isKindOfClass:[MKUserLocation class]]) { return nil; }
    return nil;
    MKAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier: @"AnnotationView"];
    annotationView.annotation = annotation;
    
    if (!annotationView) {
        annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"AnnotationView"];
    }
    annotationView.canShowCallout = YES;
    UIButton *rightCallout = [UIButton buttonWithType: UIButtonTypeDetailDisclosure];
    annotationView.rightCalloutAccessoryView = rightCallout;
    [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    return annotationView;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id) sender {
    
    if ([segue.identifier isEqualToString:@"DetailViewController"]) {
        if ([sender isKindOfClass:[MKAnnotationView class]]) {
            MKAnnotationView *annotationView = (MKAnnotationView *)sender;
            DetailViewController *detailViewController = (DetailViewController *)segue.destinationViewController;
            detailViewController.annotationTitle = annotationView.annotation.title;
            detailViewController.coordinate = annotationView.annotation.coordinate;
        }
    }
}

            //CHANGE USER LOCATION AS USER MOVES
- (void)userLocation:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    mapView.centerCoordinate = userLocation.location.coordinate;
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = userLocation.coordinate;
    point.title = @"Where am I?";
    point.subtitle = @"I'm here!!!";
    
    [self.mapView addAnnotation:point];
}


        //ZOOMS TO USER LOCATION
- (void)mapView:(MKMapView *)aMapView didUpdateUserLocation:(MKUserLocation *)aUserLocation {
    
    NSLog(@"%@", aUserLocation);
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.005;
    span.longitudeDelta = 0.005;
    CLLocationCoordinate2D location;
    location.latitude = aUserLocation.coordinate.latitude;
    location.longitude = aUserLocation.coordinate.longitude;
    region.span = span;
    region.center = location;
    [aMapView setRegion:region animated:YES];
}

- (IBAction)goToSettings:(id)sender {
    NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    [[UIApplication sharedApplication]openURL:settingsURL];
}

- (void)setRegion:(MKCoordinateRegion)region {
    [self.mapView setRegion:region animated:YES];
    
}


- (IBAction)buttonPressed:(id)sender {
    if ([sender isKindOfClass:[UIButton class]]) {
        UIButton *button = (UIButton *)sender;
        NSString *buttonTitle = button.titleLabel.text;
        
        if ([buttonTitle isEqualToString: @"Location 1"]) {
            CLLocationCoordinate2D coordinates = CLLocationCoordinate2DMake(47.606209, -122.332071);
            MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinates, 500.0, 500.0);
            [self.mapView setRegion:region animated:YES];
        
        }
        
        if ([buttonTitle isEqualToString: @"Location 2"]) {
            CLLocationCoordinate2D coordinates = CLLocationCoordinate2DMake(47.593307, -122.332165);
            MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinates, 500.0, 500.0);
            [self.mapView setRegion:region animated:YES];
        }
        
        if ([buttonTitle isEqualToString: @"Location 3"]) {
            CLLocationCoordinate2D coordinates = CLLocationCoordinate2DMake(47.620423, -122.349355);
            MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinates, 500.0, 500.0);
            [self.mapView setRegion:region animated:YES];
        }
    }
}

//     - (void)locationManager:(CLLocationManager *)manager didUpdateLocation:(NSArray<CLLocation *> *)location {
//         MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location.coordinate, 500.0 ,500.0);
//         [self setRegionForCoordinate:region];
//     }

@end
        


//-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
//    {
//        // If it's the user location, just return nil.
//        if ([annotation isKindOfClass:[MKUserLocation class]])
//            return nil;
//
//        // Handle any custom annotations.
//        if ([annotation isKindOfClass:[MKPointAnnotation class]])
//        {
//            // Try to dequeue an existing pin view first.
//            MKAnnotationView *pinView = (MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
//            if (!pinView)
//            {
//                // If an existing pin view was not available, create one.
//                pinView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
//                //pinView.animatesDrop = YES;
//                pinView.canShowCallout = YES;
//                pinView.image = [UIImage imageNamed:@"prince.png"];
//                pinView.calloutOffset = CGPointMake(0, 32);
//            } else {
//                pinView.annotation = annotation;
//            }
//            return pinView;
//        }
//        return nil;
//    }



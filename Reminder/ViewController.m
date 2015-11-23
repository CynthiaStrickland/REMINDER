//
//  ViewController.m
//  Reminder
//
//  Created by Cynthia Whitlatch on 11/23/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController
@synthesize coordinate;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestPermissions];
    
    MKPointAnnotation *myAnnotation = [[MKPointAnnotation alloc]init];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    [self.locationManager requestWhenInUseAuthorization];
    
    [self.locationManager startUpdatingLocation];
    _mapView.delegate = self;
    
    self.mapView.showsUserLocation = YES;
    self.mapView.showsPointsOfInterest = YES;
    
    [self.mapView.layer setCornerRadius:20.0];
    [self.mapView setShowsUserLocation:YES];
    
    myAnnotation.coordinate = CLLocationCoordinate2DMake(47.606209, -122.332071);
    [self.mapView addAnnotation:myAnnotation];
    
    PFObject *testObject = [PFObject objectWithClassName:@"Location"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];
}
        //Changes user location as user moves
- (void)userLocation:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    mapView.centerCoordinate = userLocation.location.coordinate;
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

- (void)requestPermissions {
    [self setLocationManager:[[CLLocationManager alloc]init]];
    [self.locationManager requestAlwaysAuthorization];
    
}

- (IBAction)buttonPressed:(id)sender {
    if ([sender isKindOfClass:[UIButton class]]) {
        UIButton *button = (UIButton *)sender;
        NSString *buttonTitle = button.titleLabel.text;
        
        if ([buttonTitle isEqualToString: @"Location 1"]) {
            CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.606209, -122.332071);
            MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 500.0, 500.0);
            [self.mapView setRegion:region animated:YES];
        
        }
        
        if ([buttonTitle isEqualToString: @"Location 2"]) {
            CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.593307, -122.332165);
            MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 500.0, 500.0);
            [self.mapView setRegion:region animated:YES];
        }
        
        if ([buttonTitle isEqualToString: @"Location 3"]) {
            CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.620423, -122.349355);
            MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 500.0, 500.0);
            [self.mapView setRegion:region animated:YES];
        }
    }
}

@end
    

//
//  ViewController.m
//  Reminder
//
//  Created by Cynthia Whitlatch on 11/23/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//@property (weak, nonatomic) IBOutlet UIButton *locationOne;
//@property (weak, nonatomic) IBOutlet UIButton *locationTwo;
//@property (weak, nonatomic) IBOutlet UIButton *locationThree;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestPermissions];
    
    [self.mapView.layer setCornerRadius:20.0];
    [self.mapView setShowsUserLocation:YES];
    
}

- (void)setRegion:(MKCoordinateRegion)region {
    [self.mapView setRegion:region animated:YES];
    
}

- (void)requestPermissions{
    [self setLocationManager:[[CLLocationManager alloc]init]];
    [self.locationManager requestAlwaysAuthorization];
    
}

- (IBAction)locationButtonSelected:(id)sender {
    if ([sender isKindOfClass:[UIButton class]]) {
        NSString *button = (UIButton *)sender;
        NSString *buttonTitle = button.titleLabel.text;
        
        if ([buttonTitle isEqualToString: @"Location One"]) {
            CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.6566674, -122.251096);
            MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 500.0, 500.0);
        }
        
        if ([buttonTitle isEqualToString: @"Location Two"]) {
            NSLog(@"Locaiton two ...");
            
        }
        
        if ([buttonTitle isEqualToString: @"Location Three"]) {
            NSLog(@"Locaiton three ...");
            
        }
}

@end
    

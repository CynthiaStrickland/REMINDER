//
//  DetailViewController.m
//  Reminder
//
//  Created by Cynthia Whitlatch on 11/23/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

@import Parse;
@import ParseUI;
@import MapKit;

#import "DetailViewController.h"
#import "Reminder.h"
#import "LocationController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *radiusTextField;

- (IBAction)createReminderButtonSelected:(UIButton *)sender;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", self.annotationTitle);
    NSLog(@"%f %f", self.coordinate.latitude, self.coordinate.longitude);
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.nameTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)createReminderButtonSelected:(UIButton *)sender {
    
    Reminder *reminder = [[Reminder alloc]init];
    reminder.name = self.nameTextField.text;
    reminder.radius = [NSNumber numberWithFloat:self.radiusTextField.text.floatValue];
    reminder.location = [PFGeoPoint geoPointWithLatitude:self.coordinate.latitude longitude:self.coordinate.longitude];
    [reminder saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        NSLog(@"Reminder saved to Parse.");
        
        if (self.completion) {
            if ([CLLocationManager isMonitoringAvailableForClass:[CLCircularRegion class]]) {
                CLCircularRegion *region = [[CLCircularRegion alloc]initWithCenter:self.coordinate radius:self.radiusTextField.text.floatValue identifier:self.nameTextField.text];
                [[[LocationController sharedController]locationManager]startMonitoringForRegion:region];
                self.completion([MKCircle circleWithCenterCoordinate:self.coordinate radius:self.radiusTextField.text.floatValue]);
                [self.navigationController popViewControllerAnimated:YES];
            }
        }
    }];
}

@end

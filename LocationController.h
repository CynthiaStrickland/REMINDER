//
//  LocationController.h
//  Reminder
//
//  Created by Cynthia Whitlatch on 11/24/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

@import Foundation;
@import CoreLocation;

@protocol LocationControllerDelegate <NSObject>

@optional
- (void)locationControllerDidUpdateLocation:(CLLocation *)location;

@end

@interface LocationController: NSObject

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *location;

@property (weak, nonatomic) id delegate;

+ (LocationController *)sharedController;

- (void)start;
- (void)stop;



@end



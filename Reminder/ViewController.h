//
//  ViewController.h
//  Reminder
//
//  Created by Cynthia Whitlatch on 11/23/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "LocationController.h"

@import CoreLocation;
@import Parse;
@import ParseUI;
@import MapKit;

@interface ViewController : UIViewController<CLLocationManagerDelegate, MKMapViewDelegate, MKAnnotation, PFLogInViewControllerDelegate>

@end


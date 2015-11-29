//
//  ViewController.h
//  Reminder
//
//  Created by Cynthia Whitlatch on 11/23/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

@import UIKit;
@import CoreLocation;
@import Parse;
@import ParseUI;
@import MapKit;

#import "LocationController.h"


@interface ViewController : UIViewController<CLLocationManagerDelegate, MKMapViewDelegate, MKAnnotation, PFLogInViewControllerDelegate>

@end


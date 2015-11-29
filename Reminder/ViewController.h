//
//  ViewController.h
//  Reminder
//
//  Created by Cynthia Whitlatch on 11/23/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

@import UIKit;
@import MapKit;
@import CoreLocation;
#import "LocationController.h"

@interface ViewController : UIViewController<CLLocationManagerDelegate, MKMapViewDelegate, MKAnnotation>




@end


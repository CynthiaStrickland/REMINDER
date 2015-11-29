//
//  DetailViewController.h
//  Reminder
//
//  Created by Cynthia Whitlatch on 11/23/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

@import UIKit;
@import MapKit;
#import "ViewController.h"

@import CoreLocation;

@interface DetailViewController : UIViewController

@property (copy, nonatomic) NSString *annotationTitle;
@property (nonatomic) CLLocationCoordinate2D coordinate;

@end

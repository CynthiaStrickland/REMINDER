//
//  DetailViewController.h
//  Reminder
//
//  Created by Cynthia Whitlatch on 11/23/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

#import "ViewController.h"
@import MapKit;
@import UIKit;
@import CoreLocation;

@interface DetailViewController : UIViewController

@property (copy, nonatomic) NSString *annotationTitle;
@property (nonatomic) CLLocationCoordinate2D coordinate;

@end

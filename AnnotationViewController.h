//
//  AnnotationViewController.h
//  Reminder
//
//  Created by Cynthia Whitlatch on 11/23/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface AnnotationViewController : UIViewController<MKAnnotation>

-(id)initWithCoordinate:(CLLocationCoordinate2D)coordinate;

@end

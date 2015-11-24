//
//  AnnotationViewController.m
//  Reminder
//
//  Created by Cynthia Whitlatch on 11/23/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

#import "AnnotationViewController.h"


@implementation AnnotationViewController

@synthesize coordinate = _coordinate;

-(id)initWithCoordinate:(CLLocationCoordinate2D)coordinate {
    if ((self = [super init])) {
        _coordinate = coordinate;
    }
    return self;
}


@end

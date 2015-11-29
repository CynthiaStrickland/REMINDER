//
//  Reminder.m
//  Reminder
//
//  Created by Cynthia Whitlatch on 11/23/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

@import Foundation;
@import Parse;

@interface Reminder : PFObject <PFSubclassing>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSNumber *radius;

@property (strong, nonatomic) PFGeoPoint *location;


@end

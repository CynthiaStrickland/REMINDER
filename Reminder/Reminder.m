//
//  Reminder.m
//  Reminder
//
//  Created by Cynthia Whitlatch on 11/23/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

#import "Reminder.h"

@implementation Reminder

@dynamic name;
@dynamic location;
@dynamic radius;

+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return @"Reminder";
}

@end

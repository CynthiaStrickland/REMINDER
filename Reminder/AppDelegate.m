//
//  AppDelegate.m
//  Reminder
//
//  Created by Cynthia Whitlatch on 11/23/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

#import "AppDelegate.h"
@import Parse;
@import ParseUI;

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound) categories:nil];
        [application registerUserNotificationSettings:settings];
    }
    
    [Parse enableLocalDatastore];
    [Parse setApplicationId:@"lu3PXQ1vdExdyZCtsxkTJUDMP1M8zE4JyXPUA2pH" clientKey:@"jBdsobzNREaqo4ptNZ3WxxOXnHwXmZnApvpV1IaO"];
    
    return YES;
}

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    NSLog(@"local");
}

@end


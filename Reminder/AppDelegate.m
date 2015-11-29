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

    [self setupParse];
    
        [Parse enableLocalDatastore];
        [Parse setApplicationId:@"yB4G0zMrtDZTHJBvmOmWmKK9SW2IwqomKgp6gWe5" clientKey:@"avPsqatN5PUHbQtXJ3rskFQiFzmR6jLN19L8ZcmI"];
        
        [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    [self registerForNotifications];
    
    return YES;
}
    [[PFUser logInWithUsernameInBackground:@"myname" password:@"mypass" block:^(PFUser *user, NSError *error) {
            if (user) {
            } else {
};

- (void)registerForNotifications {
    
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:<#(UIUserNotificationType)#> categories:UIUserNotificationTypeAlert | UIUserNotificationBadge | 
                                            ]
    [[UIApplication sharedApplication]registerForRemoteNotificationsSettings:settings];
}

@end

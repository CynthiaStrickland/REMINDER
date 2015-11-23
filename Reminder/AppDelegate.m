//
//  AppDelegate.m
//  Reminder
//
//  Created by Cynthia Whitlatch on 11/23/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

        [Parse enableLocalDatastore];
        [Parse setApplicationId:@"yB4G0zMrtDZTHJBvmOmWmKK9SW2IwqomKgp6gWe5" clientKey:@"avPsqatN5PUHbQtXJ3rskFQiFzmR6jLN19L8ZcmI"];
        
        [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    return YES;
}

- (void)myMethod {
    PFUser *user = [PFUser user];
    user.username = @"my name";
    user.password = @"my pass";
    user.email = @"email@example.com";
    
    // other fields can be set just like with PFObject
    user[@"phone"] = @"415-392-0202";
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
        } else {   NSString *errorString = [error userInfo][@"error"];
    }
}];


    [PFUser logInWithUsernameInBackground:@"myname" password:@"mypass" block:^(PFUser *user, NSError *error) {
            if (user) {
            } else {
        }
    }];
};

@end

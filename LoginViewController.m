//
//  LoginViewController.m
//  Reminder
//
//  Created by Cynthia Whitlatch on 11/24/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController () <UITextFieldDelegate>

@property (retain, nonatomic) IBOutlet UITextField* passwordTextField;

@end


@implementation LoginViewController

- (IBAction)passwordTextField:(UITextField *)sender {
    NSString *passwordText = self.passwordTextField.text;
    
}

- (IBAction)usernameTextField:(UITextField *)sender {
    
}

// This method is called once we click inside the textField
-(void)textFieldDidBeginEditing:(UITextField *)passwordTextField {
    NSLog(@"Text field did begin editing");
}

// This method is called once we complete editing
-(void)textFieldDidEndEditing:(UITextField *)passwordTextField {
    NSLog(@"Text field ended editing");
}

// This method enables or disables the processing of return key
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [self.passwordTextField resignFirstResponder];
    return YES;
}

- (void)myMethod {
    PFUser *user = [PFUser user];
    self.passwordTextField.text = @"";
    user.password = @"my pass";
    user.email = @"email@example.com";
    
    // other fields can be set just like with PFObject
    user[@"phone"] = @"415-392-0202";
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
        } else {   NSString *errorString = [error userInfo][@"error"];
        }
    }];

NSDictionary

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView.delegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end

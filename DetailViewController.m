//
//  DetailViewController.m
//  Reminder
//
//  Created by Cynthia Whitlatch on 11/23/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *annotationLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.annotationTitle = @"Yo";
    self.annotationLabel.text = _annotationTitle;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

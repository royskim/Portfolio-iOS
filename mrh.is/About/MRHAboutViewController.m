//
//  MRHAboutViewController.m
//  mrh.is
//
//  Created by Michael on 10/17/12.
//  Copyright (c) 2012 Michael Helmbrecht. All rights reserved.
//

#import "MRHAboutViewController.h"

@interface MRHAboutViewController ()

@end

@implementation MRHAboutViewController

@synthesize navBar, mrhisLabel, aboutLabel, textView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [mrhisLabel setFont:[UIFont fontWithName:@"Edmondsans-Bold" size:30.0]];
    [aboutLabel setFont:[UIFont fontWithName:@"Edmondsans-Regular" size:30.0]];
    [textView setFont:[UIFont fontWithName:@"Edmondsans-Regular" size:18.0]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)close:(id)sender {
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

@end

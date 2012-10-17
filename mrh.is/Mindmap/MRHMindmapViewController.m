//
//  MRHMindmapViewController.m
//  mrh.is
//
//  Created by Michael on 10/16/12.
//  Copyright (c) 2012 Michael Helmbrecht. All rights reserved.
//

#import "MRHMindmapViewController.h"
#import "MRHMindmapController.h"

@interface MRHMindmapViewController ()

@end

@implementation MRHMindmapViewController

@synthesize scrollView, mindmapController;

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
    mindmapController = [[MRHMindmapController alloc] initWithNibName:nil bundle:nil];
    [scrollView setContentSize:mindmapController.view.frame.size];
    [scrollView setContentOffset:CGPointMake(mindmapController.view.frame.size.width/2-self.view.frame.size.width/2, mindmapController.view.frame.size.height/2-self.view.frame.size.height/2)];
    [scrollView addSubview:mindmapController.view];
    mindmapController.viewController = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Scroll view delegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)sv
{
    for (UIView *view in sv.subviews)
        if(![view isKindOfClass:[UIImageView class]])
            return view;
    return nil;
}

@end

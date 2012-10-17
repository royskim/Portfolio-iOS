//
//  MRHPageButton.m
//  mrh.is
//
//  Created by Michael on 10/16/12.
//  Copyright (c) 2012 Michael Helmbrecht. All rights reserved.
//

#import "MRHPageButton.h"
#import "MRHPage.h"
#import <QuartzCore/QuartzCore.h>
#import "MRHAppDelegate.h"

@implementation MRHPageButton

@synthesize page;

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self.titleLabel setFont:[UIFont fontWithName:@"Edmondsans-Regular" size:18.0]];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self.layer setCornerRadius:12.0];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)connectToPage:(MRHPage *)connectPage
{
    [connectPage setButton:self];
    [self setPage:connectPage];
    if (connectPage.isPage) {
        [self addTarget:((MRHAppDelegate *)[[UIApplication sharedApplication] delegate]) action:@selector(displayPageViewForPageFromButton:) forControlEvents: UIControlEventTouchUpInside];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    }
    else {
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

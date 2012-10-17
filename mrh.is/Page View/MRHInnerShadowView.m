//
//  MRHInnerShadowView.m
//  mrh.is
//
//  Created by Michael on 10/17/12.
//  Copyright (c) 2012 Michael Helmbrecht. All rights reserved.
//

#import "MRHInnerShadowView.h"
#import "UIView+InnerShadow.h"

@implementation MRHInnerShadowView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self drawInnerShadowInRect:rect radius:0.0 fillColor:[UIColor clearColor]];
}

@end

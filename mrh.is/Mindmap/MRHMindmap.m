//
//  MRHMindmap.m
//  mrh.is
//
//  Created by Michael on 10/17/12.
//  Copyright (c) 2012 Michael Helmbrecht. All rights reserved.
//

#import "MRHMindmap.h"

@implementation MRHMindmap

@synthesize linesToDraw;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        linesToDraw = [NSMutableArray array];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    linesToDraw = [NSMutableArray array];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context    = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
//    CGContextSetLineWidth(context, 1.0);

    for (NSDictionary *linedict in linesToDraw) {
        CGPoint startPoint, endPoint;
        [linedict[@"startPoint"] getValue:&startPoint];
        [linedict[@"endPoint"] getValue:&endPoint];
        CGContextMoveToPoint(context, startPoint.x, startPoint.y);
        CGContextAddLineToPoint(context, endPoint.x, endPoint.y);
        CGContextStrokePath(context);
    }
}

@end

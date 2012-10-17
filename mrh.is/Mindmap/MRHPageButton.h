//
//  MRHPageButton.h
//  mrh.is
//
//  Created by Michael on 10/16/12.
//  Copyright (c) 2012 Michael Helmbrecht. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MRHPage;

@interface MRHPageButton : UIButton

@property (weak, nonatomic) MRHPage *page;

- (void)connectToPage:(MRHPage *)connectPage;

@end

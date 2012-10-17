//
//  MRHMindmapViewController.h
//  mrh.is
//
//  Created by Michael on 10/16/12.
//  Copyright (c) 2012 Michael Helmbrecht. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MRHMindmapController;

@interface MRHMindmapViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) MRHMindmapController *mindmapController;

@end

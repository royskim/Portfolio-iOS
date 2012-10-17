//
//  MRHPageViewController.h
//  mrh.is
//
//  Created by Michael on 10/16/12.
//  Copyright (c) 2012 Michael Helmbrecht. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MRHPage;

@interface MRHPageViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) MRHPage *page;

@property (strong, nonatomic) IBOutlet UILabel *mrhisLabel;
@property (strong, nonatomic) IBOutlet UILabel *pathLabel;
@property (strong, nonatomic) IBOutlet UITableView *linkTable;
@property (strong, nonatomic) IBOutlet UITextView *contentTextView;

- initWithPage:(MRHPage *)initPage;

@end

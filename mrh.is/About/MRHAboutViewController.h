//
//  MRHAboutViewController.h
//  mrh.is
//
//  Created by Michael on 10/17/12.
//  Copyright (c) 2012 Michael Helmbrecht. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MRHAboutViewController : UIViewController

@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;
@property (strong, nonatomic) IBOutlet UILabel *mrhisLabel;
@property (strong, nonatomic) IBOutlet UILabel *aboutLabel;
@property (strong, nonatomic) IBOutlet UITextView *textView;

- (IBAction)close:(id)sender;

@end

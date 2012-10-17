//
//  MRHAppDelegate.h
//  mrh.is
//
//  Created by Michael on 10/16/12.
//  Copyright (c) 2012 Michael Helmbrecht. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MRHPage;

@interface MRHAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *viewController;

+ (MRHPage *)pageTree;
+ (MRHPage *)pageAtPath:(NSString *)fullPath;

- (void)displayPageViewForPageFromButton:(id)sender;

@end

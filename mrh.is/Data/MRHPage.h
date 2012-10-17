//
//  MRHPage.h
//  mrh.is
//
//  Created by Michael on 10/16/12.
//  Copyright (c) 2012 Michael Helmbrecht. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRHPage : NSObject

@property (strong, nonatomic) NSString *fullPath;
@property (strong, nonatomic) NSString *path;
@property (nonatomic) BOOL isPage;
@property (weak, nonatomic) MRHPage *parent;
@property (strong, nonatomic) NSMutableArray *children;
@property (strong, nonatomic) NSString *contentText;
@property (weak, nonatomic) UIButton *button;

+ (MRHPage *)pageWithPath:(NSString *)path parent:(MRHPage *)parent isPage:(BOOL)isPage;
+ (MRHPage *)pageWithFullPath:(NSString *)fullPath isPage:(BOOL)isPage contentText:(NSString *)contentText;

@end

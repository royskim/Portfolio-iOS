//
//  MRHPage.m
//  mrh.is
//
//  Created by Michael on 10/16/12.
//  Copyright (c) 2012 Michael Helmbrecht. All rights reserved.
//

#import "MRHPage.h"
#import "MRHAppDelegate.h"

@implementation MRHPage

@synthesize fullPath, path, isPage, parent, children, contentText, button;

+ (MRHPage *)pageWithPath:(NSString *)path parent:(MRHPage *)parentOrNil isPage:(BOOL)isPage
{
//    if (parentOrNil && [MRHAppDelegate pageAtPath:[NSString stringWithFormat:@"%@/%@",parentOrNil.fullPath,path]] != nil)
//        return nil;
//    if (!parentOrNil && [MRHAppDelegate pageTree])
//        return nil;
    MRHPage *page = [[MRHPage alloc] init];
    if (page) {
        page.path = path;
        page.isPage = isPage;
        page.parent = parentOrNil;
        if (parentOrNil) {
            page.fullPath = [NSString stringWithFormat:@"%@/%@", parentOrNil.fullPath, path];
            [parentOrNil.children addObject:page];
        }
        else {
            page.fullPath = path;
        }
        page.children = [NSMutableArray array];
    }
    return page;
}

+ (MRHPage *)pageWithFullPath:(NSString *)fullPath isPage:(BOOL)isPage contentText:(NSString *)contentText
{
//    if ([MRHAppDelegate pageAtPath:fullPath] != nil)
//        return nil;
    MRHPage *page = [[MRHPage alloc] init];
    if (page) {
        page.path = [fullPath lastPathComponent];
        page.fullPath = fullPath;
        if ([[fullPath stringByDeletingLastPathComponent] isEqualToString:@""]) {
            page.parent = nil;
        }
        else {
            page.parent = [MRHAppDelegate pageAtPath:[fullPath stringByDeletingLastPathComponent]];
            [page.parent.children addObject:page];
        }
        page.isPage = (BOOL)isPage;
        page.children = [NSMutableArray array];
        page.contentText = contentText;
    }
    return page;
}

- (NSString *)description
{
//    return [NSString stringWithFormat:@"%@\r%@",path,children];
    return [NSString stringWithFormat:@"%@ - %@\risPage: %i\rparent: %@\rchildren: %@\rcontentText: %@",path, fullPath, isPage, (parent ? parent.path : nil), children, contentText];
}

@end

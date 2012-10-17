//
//  MRHAppDelegate.m
//  mrh.is
//
//  Created by Michael on 10/16/12.
//  Copyright (c) 2012 Michael Helmbrecht. All rights reserved.
//

#import "MRHAppDelegate.h"
#import "MRHPageViewController.h"
#import "MRHMindmapViewController.h"
#import "MRHPage.h"
#import "MRHPageButton.h"

@implementation MRHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    MRHPageViewController *pageController = [[MRHPageViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:pageController];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"solid80gray.png"] forBarMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setTintColor:[UIColor colorWithWhite:0.6 alpha:1.0]];

    self.viewController = nav;
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];

    MRHMindmapViewController *mindmapView = [[MRHMindmapViewController alloc] initWithNibName:nil bundle:nil];
    [nav presentViewController:mindmapView animated:NO completion:nil];
    [MRHAppDelegate pageTree];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)showMindmap
{
    MRHMindmapViewController *mindmapView = [[MRHMindmapViewController alloc] initWithNibName:nil bundle:nil];
    [self.viewController presentViewController:mindmapView animated:YES completion:nil];
}

+ (MRHPage *)pageTree
{
    static MRHPage *page = nil;
    if (page == nil) {
        NSMutableArray *dictArray = [NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Pages" ofType:@"plist"]];
        NSDictionary *firstDict = [dictArray objectAtIndex:0];
        page = [MRHPage pageWithFullPath:firstDict[@"fullPath"] isPage:[firstDict[@"isPage"] boolValue] contentText:firstDict[@"contentText"]];
        [dictArray removeObjectAtIndex:0];
        for (NSDictionary *dict in dictArray) {
            [MRHPage pageWithFullPath:dict[@"fullPath"] isPage:[dict[@"isPage"] boolValue] contentText:dict[@"contentText"]];
        }
    }
    return page;
}

+ (MRHPage *)pageAtPath:(NSString *)fullPath
{
    MRHPage *page = [MRHAppDelegate searchPage:[MRHAppDelegate pageTree] forPageAtPath:fullPath];
    if (!page)
        NSLog(@"Search failed for path: %@", fullPath);
    return page;
}

+ (MRHPage *)searchPage:(MRHPage *)rootPage forPageAtPath:(NSString *)fullPath
{
    if ([rootPage.fullPath isEqualToString:fullPath])
        return rootPage;
    MRHPage *foundPage = nil;
    for (MRHPage *child in rootPage.children) {
        foundPage = [MRHAppDelegate searchPage:child forPageAtPath:fullPath];
        if (foundPage)
            break;
    }
    return foundPage;
}

- (void)displayPageViewForPageFromButton:(MRHPageButton *)sender
{
//    [((MRHPageViewController *)self.viewController.topViewController) setPage:sender.page];

    NSMutableArray *pageControllers = [NSMutableArray array];
    MRHPage *page = sender.page;
    while (page != nil) {
        if (!page.isPage) {
            page = page.parent;
            continue;
        }
        MRHPageViewController *pageController = [[MRHPageViewController alloc] initWithPage:page];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Up" style:UIBarButtonItemStyleBordered target:nil action:nil];
        [pageController.navigationItem setBackBarButtonItem:backButton];
        [pageControllers insertObject:pageController atIndex:0];
        page = page.parent;
    }
    [self.viewController setViewControllers:pageControllers animated:NO];
    [self.viewController dismissViewControllerAnimated:YES completion:nil];
}

@end

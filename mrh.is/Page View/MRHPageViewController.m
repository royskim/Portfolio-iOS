//
//  MRHPageViewController.m
//  mrh.is
//
//  Created by Michael on 10/16/12.
//  Copyright (c) 2012 Michael Helmbrecht. All rights reserved.
//

#import "MRHPageViewController.h"
#import "MRHPage.h"
#import "MRHAppDelegate.h"

@interface MRHPageViewController ()

@end

@implementation MRHPageViewController

@synthesize page;
@synthesize mrhisLabel, pathLabel, linkTable, contentTextView;

#pragma mark - View lifecycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithPage:(MRHPage *)initPage
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        page = initPage;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [mrhisLabel setFont:[UIFont fontWithName:@"Edmondsans-Bold" size:30.0]];
    [pathLabel setFont:[UIFont fontWithName:@"Edmondsans-Regular" size:30.0]];
    [contentTextView setFont:[UIFont fontWithName:@"Edmondsans-Regular" size:18.0]];
}

- (void)viewWillAppear:(BOOL)animated
{
    UIBarButtonItem *mindmapButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"web"] style:UIBarButtonItemStyleBordered target:((MRHAppDelegate *)[[UIApplication sharedApplication] delegate]) action:@selector(showMindmap)];
    self.navigationItem.rightBarButtonItem = mindmapButton;
    if (!page) {
        [pathLabel setTextColor:[UIColor redColor]];
        [pathLabel setText:@"having/some/issues"];
        [contentTextView setText:@"Something went wrong! The page you requested does not exist! Let Michael know so he can fix it."];
    }
    else {
        [pathLabel setTextColor:[UIColor blackColor]];
        if (page == [MRHAppDelegate pageTree])
            [pathLabel setText:@"..."];
        else
            [pathLabel setText:[page.fullPath stringByReplacingOccurrencesOfString:@"mrh.is/" withString:@""]];
        [contentTextView setText:[page.contentText stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"]];
    }
    [linkTable reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [page.children count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    MRHPage *child = [page.children objectAtIndex:section];
    if (!child.isPage)
        return [child.children count];
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }

    MRHPage *child = [page.children objectAtIndex:indexPath.section];
    if (!child.isPage) {
        [cell setIndentationLevel:2];
        MRHPage *grandchild = [child.children objectAtIndex:indexPath.row];
        [cell.textLabel setText:[NSString stringWithFormat:@"/%@", grandchild.path]];
        [cell.textLabel setFont:[UIFont fontWithName:@"Edmondsans-Regular" size:18.0]];
    }
    else {
        [cell setIndentationLevel:0];
        [cell.textLabel setText:[NSString stringWithFormat:@"/%@", child.path]];
        [cell.textLabel setFont:[UIFont fontWithName:@"Edmondsans-Medium" size:18.0]];
    }

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    MRHPage *child = [page.children objectAtIndex:section];
    if (!child.isPage)
        return 22.0;
    return 0.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    MRHPage *child = [page.children objectAtIndex:section];
    if (!child.isPage) {
        UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 22.0)];
        [header setBackgroundColor:[UIColor colorWithWhite:0.6 alpha:0.8]];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5.0, 0.0, 310.0, 22.0)];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setFont:[UIFont fontWithName:@"Edmondsans-Bold" size:18.0]];
        [label setTextColor:[UIColor colorWithWhite:1.0 alpha:0.9]];
        [label setText:[NSString stringWithFormat:@"/%@", child.path]];
        [header addSubview:label];
        return header;
    }
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    MRHPage *child = [page.children objectAtIndex:section];
    if (!child.isPage)
        return [NSString stringWithFormat:@"/%@", child.path];
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *pathToSelectedPage;
    MRHPage *child = [page.children objectAtIndex:indexPath.section];
    if (!child.isPage) {
        MRHPage *grandchild = [child.children objectAtIndex:indexPath.row];
        pathToSelectedPage = grandchild.fullPath;
    }
    else
        pathToSelectedPage = child.fullPath;
    MRHPage *selectedPage = [MRHAppDelegate pageAtPath:pathToSelectedPage];
    MRHPageViewController *pageController = [[MRHPageViewController alloc] initWithPage:selectedPage];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Up" style:UIBarButtonItemStyleBordered target:nil action:nil];
    [pageController.navigationItem setBackBarButtonItem:backButton];
    [self.navigationController pushViewController:pageController animated:YES];
}

@end

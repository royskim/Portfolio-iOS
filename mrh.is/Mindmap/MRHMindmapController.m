//
//  MRHMindmapController.m
//  mrh.is
//
//  Created by Michael on 10/16/12.
//  Copyright (c) 2012 Michael Helmbrecht. All rights reserved.
//

#import "MRHMindmapController.h"
#import "MRHPageButton.h"
#import "MRHPage.h"
#import "MRHAppDelegate.h"
#import "MRHMindmap.h"
#import "MRHAboutViewController.h"
#import "MRHMindmapViewController.h"

@interface MRHMindmapController ()

@end

@implementation MRHMindmapController

@synthesize viewController;
@synthesize rootButton, branchButtons, leafButtons, allButtons, aboutButton;
@synthesize mrhisLabel, aButton;
@synthesize studentButton, studentAtButton, msuStudentButton, cmuStudentButton;
@synthesize plannerButton, plannerForButton, zpfcSummerPicnicButton;
@synthesize designerButton, designerOnButton, sweatbadgesButton, zpfcEmployeeGuideButton;
@synthesize hackerButton, hackerOnButton, colorMeTimbersButton;
@synthesize coderButton, coderOnButton, clothespinButton;
@synthesize leaderButton, leaderOfButton, socialSigButton, blitzButton, tauBetaPiButton;
@synthesize productiveButton, productiveAtButton;
@synthesize schoolButton, schoolAtButton, cmuButton, cmuOnButton, clothespinCMUButton, msuButton, msuOnButton, researchButton, seniorDesignButton;
@synthesize workButton, workAtButton, saicButton, saicOnButton, mtsButton, cloudshieldButton, ecpButton, zpfcButton, zpfcOnButton, thisOrThatButton, blastButton, instarocketButton;
@synthesize onButton, theAppStoreButton, linkedInButton, twitterButton, theInternetButton;
@synthesize awesomeButton, awesomeAtButton, singingButton, speakingButton, spanishButton, makingFriendsButton, popCultureButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [rootButton.titleLabel setFont:[UIFont fontWithName:@"Edmondsans-Bold" size:32.0]];
    [mrhisLabel setFont:[UIFont fontWithName:@"Edmondsans-Bold" size:32.0]];
    [aboutButton.titleLabel setFont:[UIFont fontWithName:@"Edmondsans-Bold" size:32.0]];
    [rootButton connectToPage:[MRHAppDelegate pageTree]];
    for (MRHPageButton *branch in branchButtons) {
        [branch.titleLabel setFont:[UIFont fontWithName:@"Edmondsans-Medium" size:22.0]];
    }
    for (MRHPageButton *leaf in leafButtons) {
        [leaf.titleLabel setFont:[UIFont fontWithName:@"Edmondsans-Regular" size:18.0]];
    }

    [aButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/a"]];
    
    [studentButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/a/student"]];
    [studentAtButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/a/student/at"]];
    [msuStudentButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/a/student/at/MississippiState"]];
    [cmuStudentButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/a/student/at/CarnegieMellon"]];

    [plannerButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/a/planner"]];
    [plannerForButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/a/planner/for"]];
    [zpfcSummerPicnicButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/a/planner/for/ZPFCSummerPicnic"]];

    [designerButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/a/designer"]];
    [designerOnButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/a/designer/on"]];
    [sweatbadgesButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/a/designer/on/Sweatbadges"]];
    [zpfcEmployeeGuideButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/a/designer/on/ZPFCEmployeeGuide"]];

    [hackerButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/a/hacker"]];
    [hackerOnButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/a/hacker/on"]];
    [colorMeTimbersButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/a/hacker/on/ColorMeTimbers"]];

    [coderButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/a/coder"]];
    [coderOnButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/a/coder/on"]];
    [clothespinButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/a/coder/on/Clothespin"]];

    [leaderButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/a/leader"]];
    [leaderOfButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/a/leader/of"]];
    [socialSigButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/a/leader/of/SocialSIG"]];
    [blitzButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/a/leader/of/Blitz!"]];
    [tauBetaPiButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/a/leader/of/TauBetaPi"]];

    [productiveButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/productive"]];
    [productiveAtButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/productive/at"]];

    [schoolButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/productive/at/school"]];
    [schoolAtButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/productive/at/school/at"]];
    [cmuButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/productive/at/school/at/CarnegieMellon"]];
    [cmuOnButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/productive/at/school/at/CarnegieMellon/on"]];
    [clothespinCMUButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/productive/at/school/at/CarnegieMellon/on/Clothespin"]];
    [msuButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/productive/at/school/at/MississippiState"]];
    [msuOnButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/productive/at/school/at/MississippiState/on"]];
    [researchButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/productive/at/school/at/MississippiState/on/research"]];
    [seniorDesignButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/productive/at/school/at/MississippiState/on/seniordesign"]];

    [workButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/productive/at/work"]];
    [workAtButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/productive/at/work/at"]];
    [saicButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/productive/at/work/at/SAIC"]];
    [saicOnButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/productive/at/work/at/SAIC/on"]];
    [mtsButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/productive/at/work/at/SAIC/on/MTS"]];
    [cloudshieldButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/productive/at/work/at/SAIC/on/CloudShield"]];
    [ecpButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/productive/at/work/at/SAIC/on/ECP"]];
    [zpfcButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/productive/at/work/at/ZPFC"]];
    [zpfcOnButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/productive/at/work/at/ZPFC/on"]];
    [thisOrThatButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/productive/at/work/at/ZPFC/on/ThisorThat"]];
    [blastButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/productive/at/work/at/ZPFC/on/BLAST"]];
    [instarocketButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/productive/at/work/at/ZPFC/on/Instarocket"]];

    [onButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/on"]];
    [theAppStoreButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/on/theAppStore"]];
    [linkedInButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/on/LinkedIn"]];
    [twitterButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/on/Twitter"]];
    [theInternetButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/on/theInternet"]];

    [awesomeButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/awesome"]];
    [awesomeAtButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/awesome/at"]];
    [singingButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/awesome/at/singing"]];
    [speakingButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/awesome/at/speaking"]];
    [spanishButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/awesome/at/speaking/Spanish"]];
    [makingFriendsButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/awesome/at/makingfriends"]];
    [popCultureButton connectToPage:[MRHAppDelegate pageAtPath:@"mrh.is/awesome/at/popculture"]];

    allButtons = [NSMutableArray arrayWithObject:rootButton];
    [allButtons addObjectsFromArray:branchButtons];
    [allButtons addObjectsFromArray:leafButtons];

    [self drawLinesToChildren:rootButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)drawLinesToChildren:(MRHPageButton *)parentButton
{
    NSPredicate *filter = [NSPredicate predicateWithFormat:@"SELF.page.parent == %@",parentButton.page];
    for (MRHPageButton *childButton in [allButtons filteredArrayUsingPredicate:filter]) {
        [self drawLineBetweenButton:parentButton andButton:childButton];
        [self drawLinesToChildren:childButton];
    }
}

- (void)drawLineBetweenButton:(MRHPageButton *)firstButton andButton:(MRHPageButton *)secondButton
{
    NSDictionary *lineDict = @{@"startPoint" : [NSValue valueWithCGPoint:firstButton.center], @"endPoint" : [NSValue valueWithCGPoint:secondButton.center]};
    [((MRHMindmap *)self.view).linesToDraw addObject:lineDict];
    [self.view setNeedsDisplay];
}

- (IBAction)about:(id)sender {
    MRHAboutViewController *about = [[MRHAboutViewController alloc] initWithNibName:nil bundle:nil];
    [self.viewController presentViewController:about animated:YES completion:nil];
}

@end

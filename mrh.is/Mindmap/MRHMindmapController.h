//
//  MRHMindmapController.h
//  mrh.is
//
//  Created by Michael on 10/16/12.
//  Copyright (c) 2012 Michael Helmbrecht. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MRHPageButton;
@class MRHMindmapViewController;

@interface MRHMindmapController : UIViewController

@property (strong, nonatomic) MRHMindmapViewController *viewController;
@property (strong, nonatomic) IBOutlet MRHPageButton *rootButton;
@property (strong, nonatomic) IBOutletCollection(MRHPageButton) NSMutableArray *branchButtons;
@property (strong, nonatomic) IBOutletCollection(MRHPageButton) NSMutableArray *leafButtons;
@property (strong, nonatomic) NSMutableArray *allButtons;
@property (strong, nonatomic) IBOutlet MRHPageButton *aboutButton;

@property (strong, nonatomic) IBOutlet UILabel *mrhisLabel;
@property (strong, nonatomic) IBOutlet MRHPageButton *aButton;

@property (strong, nonatomic) IBOutlet MRHPageButton *studentButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *studentAtButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *msuStudentButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *cmuStudentButton;

@property (strong, nonatomic) IBOutlet MRHPageButton *plannerButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *plannerForButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *zpfcSummerPicnicButton;

@property (strong, nonatomic) IBOutlet MRHPageButton *designerButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *designerOnButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *sweatbadgesButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *zpfcEmployeeGuideButton;

@property (strong, nonatomic) IBOutlet MRHPageButton *hackerButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *hackerOnButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *colorMeTimbersButton;

@property (strong, nonatomic) IBOutlet MRHPageButton *coderButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *coderOnButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *clothespinButton;

@property (strong, nonatomic) IBOutlet MRHPageButton *leaderButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *leaderOfButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *socialSigButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *blitzButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *tauBetaPiButton;

@property (strong, nonatomic) IBOutlet MRHPageButton *productiveButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *productiveAtButton;

@property (strong, nonatomic) IBOutlet MRHPageButton *schoolButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *schoolAtButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *cmuButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *cmuOnButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *clothespinCMUButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *msuButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *msuOnButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *researchButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *seniorDesignButton;

@property (strong, nonatomic) IBOutlet MRHPageButton *workButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *workAtButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *saicButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *saicOnButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *mtsButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *cloudshieldButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *ecpButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *zpfcButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *zpfcOnButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *thisOrThatButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *blastButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *instarocketButton;

@property (strong, nonatomic) IBOutlet MRHPageButton *onButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *theAppStoreButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *linkedInButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *twitterButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *theInternetButton;

@property (strong, nonatomic) IBOutlet MRHPageButton *awesomeButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *awesomeAtButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *singingButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *speakingButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *spanishButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *makingFriendsButton;
@property (strong, nonatomic) IBOutlet MRHPageButton *popCultureButton;

- (void)drawLinesToChildren:(MRHPageButton *)pageButton;
- (void)drawLineBetweenButton:(MRHPageButton *)firstButton andButton:(MRHPageButton *)secondButton;
- (IBAction)about:(id)sender;

@end

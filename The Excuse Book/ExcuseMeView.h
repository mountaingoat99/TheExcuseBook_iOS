//
//  ViewController.h
//  The Excuse Book
//
//  Created by Jeremey Rodriguez on 4/19/15.
//  Copyright (c) 2015 SingleCog Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "SwitchSportView.h"

@import GoogleMobileAds;

@interface ExcuseMeView : UIViewController <MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate, SwitchSportDelegate, UIPopoverPresentationControllerDelegate>

@property (nonatomic, strong) NSString *defaultSportID;
//popover
@property (strong, nonatomic) UIPopoverPresentationController *popoverContr;

@property (weak, nonatomic) IBOutlet UILabel *lblDefaultSportName;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnMenu;
@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;

- (IBAction)btnMenu:(id)sender;

@end


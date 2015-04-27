//
//  ViewController.h
//  The Excuse Book
//
//  Created by Jeremey Rodriguez on 4/19/15.
//  Copyright (c) 2015 SingleCog Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ExcuseMeView : UIViewController <MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate>

@property (nonatomic, strong) NSString *defaultSportID;

@property (weak, nonatomic) IBOutlet UILabel *lblDefaultSportName;

- (IBAction)btnMenu:(id)sender;

@end


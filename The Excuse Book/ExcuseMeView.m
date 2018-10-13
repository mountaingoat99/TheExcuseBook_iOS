
//  ViewController.m
//  The Excuse Book
//
//  Created by Jeremey Rodriguez on 4/19/15.
//  Copyright (c) 2015 SingleCog Software. All rights reserved.
//

#import "ExcuseMeView.h"
#import "DefaultController.h"
#import "Excuse Controller.h"
#import "ShowExcuseView.h"
#import "SwitchSportView.h"
#import "WYPopoverController.h"

@interface ExcuseMeView () <WYPopoverControllerDelegate>
{
    WYPopoverController* popoverController;
}

@property (nonatomic, strong) NSString *defaultSportName;
@property (nonatomic, strong) NSString *NewSportName;
@property (nonatomic, strong) NSString *NewExcuseName;

-(void)CheckDefaultSport;
-(void)LoadDefaultSport;
-(void)AddNewSportAlert;
-(void)AddSport;
-(void)AddNewExcuseAlert;
-(void)AddNewExcuse;
-(void)PresentSportsChoice;

@end

@implementation ExcuseMeView

@synthesize popoverContr;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    [self.lblDefaultSportName setHidden:YES];
    
    [self CheckDefaultSport];
    
    NSLog(@"Google Mobile Ads SDK version: %@", [GADRequest sdkVersion]);
    self.bannerView.adUnitID = @"ca-app-pub-9150360740164586/4668671754";
    self.bannerView.rootViewController = self;
    
    // Testing ads on device here comment out after testing
//    GADRequest *request = [GADRequest request];
//    request.testDevices = @[ @"557a4c728b9860e5e386b606af0ca46a" ];
//    [self.bannerView loadRequest:request];
    
    // Uncomment this after testing
    [self.bannerView loadRequest:[GADRequest request]];
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
    if (motion == UIEventSubtypeMotionShake) {
        [self performSegueWithIdentifier:@"segueChooseToRandom" sender:self];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segueChooseToRandom"]) {
        ShowExcuseView *random = [segue destinationViewController];
        
        random.defaultSportID = self.defaultSportID;
        
    }
}

-(void)CheckDefaultSport {
    
    DefaultController *defaultSport = [[DefaultController alloc] init];
    self.defaultSportID = [defaultSport DefaultSportID];
    self.defaultSportName = [defaultSport DefaultSportName:self.defaultSportID];
    
    [self LoadDefaultSport];
}

-(void)LoadDefaultSport {
    
    switch ([self.defaultSportID intValue]) {
        case 1:
            [self.lblDefaultSportName setHidden:YES];
            [self.backgroundImage setImage:[UIImage imageNamed:@"ExcuseBikeClosed"]];
            break;
        case 2:
            [self.lblDefaultSportName setHidden:YES];
            [self.backgroundImage setImage:[UIImage imageNamed:@"RunBookClosed"]];
            break;
        case 3:
            [self.lblDefaultSportName setHidden:YES];
            [self.backgroundImage setImage:[UIImage imageNamed:@"SkiBook"]];
            break;
        case 4:
            [self.lblDefaultSportName setHidden:YES];
            [self.backgroundImage setImage:[UIImage imageNamed:@"DiveBookClosed"]];
            break;
        case 5:
            [self.lblDefaultSportName setHidden:YES];
            [self.backgroundImage setImage:[UIImage imageNamed:@"SwimBook"]];
            break;
        case 6:
            [self.lblDefaultSportName setHidden:YES];
            [self.backgroundImage setImage:[UIImage imageNamed:@"TriBook"]];
            break;
        case 7:
            [self.lblDefaultSportName setHidden:YES];
            [self.backgroundImage setImage:[UIImage imageNamed:@"amFootballBook"]];
            break;
        case 8:
            [self.lblDefaultSportName setHidden:YES];
            [self.backgroundImage setImage:[UIImage imageNamed:@"baseballBook"]];
            break;
        case 9:
            [self.lblDefaultSportName setHidden:YES];
            [self.backgroundImage setImage:[UIImage imageNamed:@"footballBook"]];
            break;
        case 10:
            [self.lblDefaultSportName setHidden:YES];
            [self.backgroundImage setImage:[UIImage imageNamed:@"golfBook"]];
            break;
        case 11:
            [self.lblDefaultSportName setHidden:YES];
            [self.backgroundImage setImage:[UIImage imageNamed:@"frisbeeBook"]];
            break;
        case 12:
            [self.lblDefaultSportName setHidden:YES];
            [self.backgroundImage setImage:[UIImage imageNamed:@"basketballBook"]];
            break;
        default:
            [self.backgroundImage setImage:[UIImage imageNamed:@"genericbookclosed"]];
            [self.lblDefaultSportName setHidden:NO];
            self.lblDefaultSportName.text = self.defaultSportName;
            break;
    }
}

-(void)AddNewSportAlert {
    // updated alertController for iOS 8
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Add Sport"
                                          message:nil
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = @"Enter New Sport";
         textField.keyboardAppearance = UIKeyboardAppearanceDark;
         textField.keyboardType = UIKeyboardTypeDefault;
         textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
     }];
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:@"Cancel"
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"Cancel Action");
                                   }];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   NSLog(@"OK Action");
                                   UITextField *name = alertController.textFields.firstObject;
                                   self.NewSportName = name.text;
                                   [self AddSport];
                               }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void)AddSport {
    
    DefaultController *defaultSport = [[DefaultController alloc] init];
    
    if (![defaultSport AddNewSport:self.NewSportName]) {
        UIAlertController *error = [UIAlertController
                                    alertControllerWithTitle:@"Hold On!"
                                    message:@"Sport did not get entered, please try again"
                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *error){
                                       NSLog(@"Ok Action");
                                   }];
        
        [error addAction:okAction];
        [self presentViewController:error animated:YES completion:nil];
        [error reloadInputViews];
    } else {
        [self CheckDefaultSport];
    }
    
}

-(void)AddNewExcuseAlert {
    
    // updated alertController for iOS 8
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Add Excuse"
                                          message:nil
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = @"Enter New Excuse";
         textField.keyboardAppearance = UIKeyboardAppearanceDark;
         textField.keyboardType = UIKeyboardTypeDefault;
         textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
     }];
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:@"Cancel"
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"Cancel Action");
                                   }];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   NSLog(@"OK Action");
                                   UITextField *name = alertController.textFields.firstObject;
                                   self.NewExcuseName = name.text;
                                   [self AddNewExcuse];
                               }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

-(void)AddNewExcuse {
    Excuse_Controller *excuse = [[Excuse_Controller alloc] init];
    if (![excuse AddExcuse:self.defaultSportID ExcuseName:self.NewExcuseName]) {
        UIAlertController *error = [UIAlertController
                                    alertControllerWithTitle:@"Hold On!"
                                    message:@"Excuse did not get entered, please try again"
                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *error){
                                       NSLog(@"Ok Action");
                                   }];
        
        [error addAction:okAction];
        [self presentViewController:error animated:YES completion:nil];
        [error reloadInputViews];
    } else {
        UIAlertController *success = [UIAlertController
                                    alertControllerWithTitle:@"Awesome"
                                    message:@"New Excuse Added!"
                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *success){
                                       NSLog(@"Ok Action");
                                   }];
        
        [success addAction:okAction];
        [self presentViewController:success animated:YES completion:nil];
        [success reloadInputViews];
    }
}

-(void)PresentSportsChoice {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        UIStoryboard *sboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SwitchSportView *switchDiver = [sboard instantiateViewControllerWithIdentifier:@"SwitchSportView"];
        
        popoverController = [[WYPopoverController alloc] initWithContentViewController:switchDiver];
        popoverController.delegate = self;
        popoverController.popoverContentSize = CGSizeMake(300, 300);
        CGRect rect = CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/2, 1, 1);
        switchDiver.delegate = self;
        switchDiver.defaultSportID = self.defaultSportID;
        switchDiver.controller = popoverController;
        [popoverController presentPopoverFromRect:rect inView:self.view permittedArrowDirections:WYPopoverArrowDirectionNone animated:YES];
    } else {
        UIStoryboard *sboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SwitchSportView *switchSport = [sboard instantiateViewControllerWithIdentifier:@"SwitchSportView"];
        
        switchSport.delegate = self;
        switchSport.defaultSportID = self.defaultSportID;
        switchSport.preferredContentSize = CGSizeMake(400, 400);
        switchSport.popoverPresentationController.sourceView = self.view;
        switchSport.popoverPresentationController.sourceRect = CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/2, 1, 1);
        switchSport.popoverPresentationController.permittedArrowDirections = 0;
        popoverContr = [switchSport popoverPresentationController];
        popoverContr.delegate = self;
        [self presentViewController:switchSport animated:YES completion:nil];
    }
}

-(void)SwitchedSport {
    
    [self CheckDefaultSport];
}

- (IBAction)btnMenu:(id)sender {
    
    // updated alertController for iOS 8
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Contact"
                                          message:@"Thanks for using my app. Please email me if you have sports that you think should be added to the app"
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *changeSport = [UIAlertAction
                                  actionWithTitle:@"Change Sport"
                                  style:UIAlertActionStyleDefault
                                  handler:^(UIAlertAction *action)
                                  {
                                      [self PresentSportsChoice];
                                  }];
    
    UIAlertAction *addNewSport = [UIAlertAction
                                  actionWithTitle:@"Add New Sport"
                                  style:UIAlertActionStyleDefault
                                  handler:^(UIAlertAction *action)
                                  {
                                      [self AddNewSportAlert];
                                  }];
    
    UIAlertAction *addNewExcuse = [UIAlertAction
                                  actionWithTitle:@"Add New Excuse"
                                  style:UIAlertActionStyleDefault
                                  handler:^(UIAlertAction *action)
                                  {
                                      [self AddNewExcuseAlert];
                                  }];
    
    
    
    UIAlertAction *Email = [UIAlertAction
                            actionWithTitle:@"Email"
                            style:UIAlertActionStyleDefault
                            handler:^(UIAlertAction *action)
                            {
                                [self sendEmail];
                            }];
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:@"Cancel"
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"Cancel Action");
                                   }];
    
    
    [alertController addAction:changeSport];
    [alertController addAction:addNewSport];
    [alertController addAction:addNewExcuse];
    [alertController addAction:Email];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

// Email
-(void)sendEmail {
    
    NSString *EmailTo = @"jeremey.rodriguez@outlook.com";
    NSString *subject = @"The Excuse Book Feedback";
    
    MFMailComposeViewController *composer = [[MFMailComposeViewController alloc] init];
    composer.mailComposeDelegate = self;
    [composer setToRecipients:@[EmailTo]];
    [composer setSubject:subject];
    
    // present it on the screen
    [self presentViewController:composer animated:YES completion:nil];
    
}

// delegate method
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            [self canceledEmail];
            break;
        case MFMailComposeResultSent:
            [self SentEmail];
            break;
        case MFMailComposeResultFailed:
            [self FailedEmail];
            break;
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    // filling up
}

-(void)canceledEmail {
    UIAlertController *error = [UIAlertController
                                alertControllerWithTitle:@"Email Cancelled"
                                message:@""
                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *error){
                                   NSLog(@"Ok Action");
                               }];
    
    [error addAction:okAction];
    [self presentViewController:error animated:YES completion:nil];
    [error reloadInputViews];
}

-(void)SentEmail {
    UIAlertController *error = [UIAlertController
                                alertControllerWithTitle:@"Email Sent"
                                message:@""
                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *error){
                                   NSLog(@"Ok Action");
                               }];
    
    [error addAction:okAction];
    [self presentViewController:error animated:YES completion:nil];
    [error reloadInputViews];
}

-(void)FailedEmail {
    UIAlertController *error = [UIAlertController
                                alertControllerWithTitle:@"Email Failed"
                                message:@""
                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *error){
                                   NSLog(@"Ok Action");
                               }];
    
    [error addAction:okAction];
    [self presentViewController:error animated:YES completion:nil];
    [error reloadInputViews];
}

@end

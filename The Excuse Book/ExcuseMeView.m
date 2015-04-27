
//  ViewController.m
//  The Excuse Book
//
//  Created by Jeremey Rodriguez on 4/19/15.
//  Copyright (c) 2015 SingleCog Software. All rights reserved.
//

#import "ExcuseMeView.h"
#import "DefaultController.h"
#import "ShowExcuseView.h"

@interface ExcuseMeView ()

@property (nonatomic, strong) NSString *defaultSportName;
@property (nonatomic, strong) NSString *NewSportName;

-(void)CheckDefaultSport;
-(void)LoadDefaultSport;
-(void)AddNewSportAlert;
-(void)AddSport;

@end

@implementation ExcuseMeView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.view.backgroundColor = [UIColor clearColor];
    
    [self CheckDefaultSport];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
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
    
    self.lblDefaultSportName.text = self.defaultSportName;
    
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
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Hold On!"
                                                        message:@"Sport did not get entered, please try again"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [error show];
        [error reloadInputViews];
    } else {
        [self CheckDefaultSport];
    }
    
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
                                      // TODO call the segue to change a sport
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
                                      // TODO call the segue to add an excuse
                                  }];
    
    
    
    UIAlertAction *Email = [UIAlertAction
                            actionWithTitle:@"Email"
                            style:UIAlertActionStyleDefault
                            handler:^(UIAlertAction *action)
                            {
                                [self sendEmail];
                            }];
    
    
    [alertController addAction:changeSport];
    [alertController addAction:addNewSport];
    [alertController addAction:addNewExcuse];
    [alertController addAction:Email];
    
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

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    // filling up
}

-(void)canceledEmail {
    
    UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Email Cancelled"
                                                    message:@""
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [error show];
    [error reloadInputViews];
    
}

-(void)SentEmail {
    
    UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Email Sent"
                                                    message:@""
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [error show];
    [error reloadInputViews];
    
}

-(void)FailedEmail {
    
    UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Email Failed"
                                                    message:@""
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [error show];
    [error reloadInputViews];
    
}

@end

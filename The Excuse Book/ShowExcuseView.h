//
//  ShowExcuseView.h
//  The Excuse Book
//
//  Created by Jeremey Rodriguez on 4/25/15.
//  Copyright (c) 2015 SingleCog Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@import GoogleMobileAds;

@interface ShowExcuseView : UIViewController

@property (nonatomic, strong) NSString *defaultSportID;
@property (weak, nonatomic) IBOutlet UILabel *lblRandomExcuse;
@property (weak, nonatomic) IBOutlet UIView *viewRandomExcuse;
@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;
- (IBAction)btnNewExcuse:(id)sender;

@end

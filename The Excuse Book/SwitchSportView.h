//
//  SwitchSportView.h
//  The Excuse Book
//
//  Created by Jeremey Rodriguez on 4/26/15.
//  Copyright (c) 2015 SingleCog Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYPopoverController.h"

@protocol SwitchSportDelegate

-(void)SwitchedSport;

@end

@interface SwitchSportView : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) id<SwitchSportDelegate> delegate;

@property (nonatomic, strong) NSString *defaultSportID;
@property (nonatomic, strong) NSArray * sportInfo;
//WYPopoverController delegate
@property (nonatomic, assign) WYPopoverController *controller;

@property (weak, nonatomic) IBOutlet UITableView *tblSports;

@end

//
//  SwitchSportView.h
//  The Excuse Book
//
//  Created by Jeremey Rodriguez on 4/26/15.
//  Copyright (c) 2015 SingleCog Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwitchSportView : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSString *defaultSportID;
@property (nonatomic, strong) NSArray * sportInfo;

@property (weak, nonatomic) IBOutlet UITableView *tblSports;

@end

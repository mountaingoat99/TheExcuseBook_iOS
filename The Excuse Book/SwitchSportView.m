//
//  SwitchSportView.m
//  The Excuse Book
//
//  Created by Jeremey Rodriguez on 4/26/15.
//  Copyright (c) 2015 SingleCog Software. All rights reserved.
//

#import "SwitchSportView.h"
#import "WYPopoverController.h"

@interface SwitchSportView ()

@end

@implementation SwitchSportView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        // this doesn't seem to work
        [WYPopoverController setDefaultTheme:[WYPopoverTheme theme]];
        WYPopoverBackgroundView *appearance = [WYPopoverBackgroundView appearance];
        appearance.backgroundColor = [UIColor colorWithRed:.16 green:.45 blue:.81 alpha:1];
        
    } else {
        self.popoverPresentationController.backgroundColor = [UIColor colorWithRed:.16 green:.45 blue:.81 alpha:1];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

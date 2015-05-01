//
//  ShowExcuseView.m
//  The Excuse Book
//
//  Created by Jeremey Rodriguez on 4/25/15.
//  Copyright (c) 2015 SingleCog Software. All rights reserved.
//

#import "ShowExcuseView.h"
#import "Excuse Controller.h"

@interface ShowExcuseView ()

-(void)GetRandomExcuse;

@end

@implementation ShowExcuseView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewRandomExcuse.layer.shadowColor = [UIColor blackColor].CGColor;
    self.viewRandomExcuse.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    self.viewRandomExcuse.layer.masksToBounds = NO;
    self.viewRandomExcuse.layer.shadowOpacity = 1.0;
    self.viewRandomExcuse.layer.cornerRadius = 25;
    
    [self GetRandomExcuse];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

}


-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
    [self GetRandomExcuse];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)GetRandomExcuse {
    
    Excuse_Controller *excuse = [[Excuse_Controller alloc] init];
    self.lblRandomExcuse.text = [excuse RandomExcuse:self.defaultSportID];
    
}

- (IBAction)btnNewExcuse:(id)sender {
    
    [self GetRandomExcuse];
}
@end

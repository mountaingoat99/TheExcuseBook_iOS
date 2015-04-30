//
//  InterfaceController.m
//  The Excuse Book WatchKit Extension
//
//  Created by Jeremey Rodriguez on 4/19/15.
//  Copyright (c) 2015 SingleCog Software. All rights reserved.
//

#import "InterfaceController.h"
#import "Excuse Controller.h"
#import "DefaultController.h"


@interface InterfaceController()

@property (nonatomic, strong) NSString *defaultSport;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    DefaultController *defaultSport = [[DefaultController alloc] init];
    self.defaultSport = [defaultSport DefaultSportID];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)btnShowExcuse {
    
    Excuse_Controller *excuse = [[Excuse_Controller alloc] init];
    self.lblExcuseName.text = [excuse RandomExcuse:self.defaultSport];
    
}
@end




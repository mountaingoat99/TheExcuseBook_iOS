//
//  DefaultController.m
//  The Excuse Book
//
//  Created by Jeremey Rodriguez on 4/25/15.
//  Copyright (c) 2015 SingleCog Software. All rights reserved.
//

#import "DefaultController.h"
#import "SportsModel.h"
#import "DefaultModel.h"

@implementation DefaultController

-(NSString*)DefaultSportID {
    
    DefaultModel *defaultSport = [[DefaultModel alloc] init];
    
    return [defaultSport CheckDefaultID];
    
}

-(NSString*)DefaultSportName:(NSString*)sportID {
    
    SportsModel *sport = [[SportsModel alloc] init];
    
    return [sport GetOneSportName:sportID];
    
}

-(BOOL)AddNewSport:(NSString*)sportName {
    
    SportsModel *sport = [[SportsModel alloc] init];
    
    return [sport AddNewSport:sportName];
    
}

// android version has a method to add sport name and id at once
// but that is for the wear app, shouldn't need it for the iOS version

@end

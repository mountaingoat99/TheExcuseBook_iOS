//
//  Excuse Controller.m
//  The Excuse Book
//
//  Created by Jeremey Rodriguez on 4/25/15.
//  Copyright (c) 2015 SingleCog Software. All rights reserved.
//

#import "Excuse Controller.h"
#import "ExcuseModel.h"

@implementation Excuse_Controller

-(NSString*)RandomExcuse:(NSString*)sportID {
    
    ExcuseModel *excuse = [[ExcuseModel alloc] init];
    
    NSArray *excuses = [excuse GetExcuseListBySport:sportID];
    
    // gets a random number from the array
    int r = arc4random_uniform((int)[excuses objectAtIndex:1]);
    //NSUInteger r = arc4random() % [excuses count];
    
    NSString *rand = [NSString stringWithFormat:@"%d", r];
    
    return [excuse GetExcuseName:rand];
}

-(BOOL)AddExcuse:(NSString*)sportID ExcuseName:(NSString*)excuseName {
    
    ExcuseModel *excuse = [[ExcuseModel alloc] init];
    
    return [excuse AddNewExcuse:excuseName SportID:sportID];
    
}

@end

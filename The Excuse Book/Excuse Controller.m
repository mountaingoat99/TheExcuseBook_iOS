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
    NSUInteger r = arc4random() % [excuses count];
    
    NSString *numId = [[excuses objectAtIndex:r] objectAtIndex:0];
    NSLog(@"Random Int was%lu", (unsigned long)r);
    NSLog(@"Random ExcuseID was%@", numId);
    
    return [excuse GetExcuseName:numId];
}

-(BOOL)AddExcuse:(NSString*)sportID ExcuseName:(NSString*)excuseName {
    if ([excuseName isEqualToString:@""]) {
        return FALSE;
    }
    ExcuseModel *excuse = [[ExcuseModel alloc] init];
    return [excuse AddNewExcuse:excuseName SportID:sportID];    
}

@end

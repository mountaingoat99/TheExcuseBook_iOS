//
//  SportsModel.h
//  The Excuse Book
//
//  Created by Jeremey Rodriguez on 4/25/15.
//  Copyright (c) 2015 SingleCog Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SportsModel : NSObject <NSCoding>

@property (nonatomic, copy) NSString *sportID;
@property (nonatomic, copy) NSString *sportName;

// Get a list of sports: ID and Name
-(NSArray*)GetSportsAndIDs;

// get just the sport name from the defaultID
-(NSString*)GetOneSportName:(NSString*)sportID;

//add a sport (and 1 excuse at the same time)
// here we need to get the ID back, I think the apple database automatically does it
// so we don't need a seperate method
-(BOOL)AddNewSport:(NSString*)sportName;

@end

//
//  DefaultModel.h
//  The Excuse Book
//
//  Created by Jeremey Rodriguez on 4/25/15.
//  Copyright (c) 2015 SingleCog Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DefaultModel : NSObject <NSCoding>

@property (nonatomic, copy) NSString *defaultSportId;

// do a single select to check the default Sport ID
-(NSString*)CheckDefaultID;

// Update the default sport
-(BOOL)UpdateDefaultSport:(NSString*)sportid;

@end

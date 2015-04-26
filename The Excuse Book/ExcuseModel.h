//
//  ExcuseModel.h
//  The Excuse Book
//
//  Created by Jeremey Rodriguez on 4/25/15.
//  Copyright (c) 2015 SingleCog Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExcuseModel : NSObject <NSCoding>

@property (nonatomic, copy) NSString *sportID;
@property (nonatomic, copy) NSString *excuseName;

// method to get an array of excuse to send to the excuse controller
-(NSArray*)GetExcuseListBySport:(NSString*)sportId;

-(NSString*)GetExcuseName:(NSString*)excuseId;

// method to add an excuse by sport
-(BOOL)AddNewExcuse:(NSString*)excuseText SportID:(NSString*)sportId;

@end

//
//  DBManager.h
//  The Excuse Book
//
//  Created by Jeremey Rodriguez on 4/25/15.
//  Copyright (c) 2015 SingleCog Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBManager : NSObject

// Custom init method
-(instancetype)initWithDatabaseFilename:(NSString *)excuse_book;

// properties for db query
@property (nonatomic, strong) NSMutableArray *arrColumnNames;
@property (nonatomic) int affectedRows;
@property (nonatomic) long long lastInsertedRowID;

// public methods for the db selects and querys
// select multiple results first
-(NSArray *)loadDataFromDB:(NSString *)query;

// selects one NSString value
-(NSString *)loadOneDataFromDB:(NSString *)query;

// select one int value
-(NSNumber*)loadNumberFromDB:(NSString *)query;

// insert, update, and delete
-(void)executeQuery:(NSString *)query;

@end

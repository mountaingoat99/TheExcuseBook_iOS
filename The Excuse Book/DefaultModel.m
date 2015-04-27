//
//  DefaultModel.m
//  The Excuse Book
//
//  Created by Jeremey Rodriguez on 4/25/15.
//  Copyright (c) 2015 SingleCog Software. All rights reserved.
//

#import "DefaultModel.h"
#import "DBManager.h"

@interface DefaultModel()

@property (nonatomic, strong) DBManager *dbManager;

@end

@implementation DefaultModel

-(id)initWithCoder:(NSCoder *)aDecoder  {
    
    if ((self = [super init])) {
        self.defaultSportId = [aDecoder decodeObjectForKey:@"defaultSportId"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:self.defaultSportId forKey:@"defaultSportId"];
}

// do a single select to check the default Sport ID
-(NSString*)CheckDefaultID {
    
    NSString *sportID;
    
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"excuse_book_database.db"];
    
    NSString *query = [NSString stringWithFormat:@"select default_id from default_sport where id = 1"];
                       
    return sportID = [self.dbManager loadOneDataFromDB:query];
}

// Update the default sport
-(BOOL)UpdateDefaultSport:(NSString*)sportid {
    
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"excuse_book_database.db"];
    
    NSString *query = [NSString stringWithFormat:@"update default_sport set default_id=%@ where id = 1", sportid];
    
    [self.dbManager executeQuery:query];
    
    if(self.dbManager.affectedRows != 0) {
        NSLog(@"query was executed successfully. Affected Rows = %d", self.dbManager.affectedRows);
        return true;
    } else {
        NSLog(@"Could not execute query");
        return  false;
    }
}

@end

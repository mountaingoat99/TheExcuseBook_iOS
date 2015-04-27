//
//  SportsModel.m
//  The Excuse Book
//
//  Created by Jeremey Rodriguez on 4/25/15.
//  Copyright (c) 2015 SingleCog Software. All rights reserved.
//

#import "SportsModel.h"
#import "DBManager.h"
#import "ExcuseModel.h"
#import "DefaultController.h"

@interface SportsModel ()

@property (nonatomic, strong) DBManager *dbManager;

@end

@implementation SportsModel

-(id)initWithCoder:(NSCoder *)aDecoder {
    
    if ((self = [super init])) {
        self.sportID = [aDecoder decodeObjectForKey:@"sportID"];
        self.sportName = [aDecoder decodeObjectForKey:@"sportName"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:self.sportID forKey:@"sportID"];
    [aCoder encodeObject:self.sportName forKey:@"sportName"];
}

// Get a list of sports: ID and Name
-(NSArray*)GetSportsAndIDs {
    
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"excuse_book_database.db"];
    
    NSString *query = @"select * from sports";
    
    NSArray *sports = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    
    return sports;
    
}

// get just the sport name from the defaultID
-(NSString*)GetOneSportName:(NSString*)sportID {
    
    NSString *sport;
    
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"excuse_book_database.db"];
    
    NSString *query = [NSString stringWithFormat:@"select sport_name from sports where id=%@", sportID];
    
    return sport = [self.dbManager loadOneDataFromDB:query];
}

//add a sport (and 1 excuse at the same time)
// here we need to get the ID back, I think the apple database automatically does it
// so we don't need a seperate method
-(BOOL)AddNewSport:(NSString*)sportName {
    
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"excuse_book_database.db"];
    
    NSString *query = [NSString stringWithFormat:@"insert into sports(sport_name) values('%@')", sportName];
    
    [self.dbManager executeQuery:query];
    
    int lastID = (int)[self.dbManager lastInsertedRowID];
    
    NSString *lastIDInserted = [NSString stringWithFormat:@"%d", lastID];
    
    if(self.dbManager.affectedRows != 0) {
        
        NSLog(@"query was executed successfully. Affected Rows = %d", self.dbManager.affectedRows);
        // if the new sport insert is successful we want to add at least one excuse
        NSString *firstExcuse = @"I do not like this sport anyway";
        ExcuseModel *excuse = [[ExcuseModel alloc] init];
        [excuse AddNewExcuse:firstExcuse SportID:lastIDInserted];
        // and then change the default sport
        DefaultController *defaultSport = [[DefaultController alloc] init];
        [defaultSport UpdateDefaultSport:lastIDInserted];
        
        return true;
        
    } else {
        
        NSLog(@"Could not execute query");
        return  false;
    }
}

@end

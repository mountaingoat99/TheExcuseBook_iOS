//
//  ExcuseModel.m
//  The Excuse Book
//
//  Created by Jeremey Rodriguez on 4/25/15.
//  Copyright (c) 2015 SingleCog Software. All rights reserved.
//

#import "ExcuseModel.h"
#import "DBManager.h"

@interface ExcuseModel ()

@property (nonatomic, strong) DBManager *dbManager;

@end

@implementation ExcuseModel


-(id)initWithCoder:(NSCoder *)aDecoder {
    
    if ((self = [super init])) {
        self.sportID = [aDecoder decodeObjectForKey:@"sportID"];
        self.excuseName = [aDecoder decodeObjectForKey:@"excuseName"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:self.sportID forKey:@"sportID"];
    [aCoder encodeObject:self.excuseName forKey:@"excuseName"];
}

// method to get an array of excuse to send to the excuse controller
-(NSArray*)GetExcuseListBySport:(NSString*)sportId {
    
    NSArray *excuses;
    
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"excuse_book"];
    
    NSString *query = [NSString stringWithFormat:@"select excuse_name from excuses where sport_id=%@", sportId];
    
    return excuses = [self.dbManager loadDataFromDB:query];
}

// method to add an excuse by sport
-(BOOL)AddNewExcuse:(NSString*)excuseText SportID:(NSString*)sportId{

    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"excuse_book"];
    
    NSString *query = [NSString stringWithFormat:@"insert into excuses(sport_id, excuse_name) values(%@, %@)", sportId, excuseText];
    
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

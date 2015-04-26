//
//  DefaultController.h
//  The Excuse Book
//
//  Created by Jeremey Rodriguez on 4/25/15.
//  Copyright (c) 2015 SingleCog Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DefaultController : NSObject

-(NSString*)DefaultSportID;

-(NSString*)DefaultSportName:(NSString*)sportID;

-(BOOL)AddNewSport:(NSString*)sportName;

// android version has a method to add sport name and id at once
// but that is for the wear app, shouldn't need it for the iOS version

@end

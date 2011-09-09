//
//  BeerCategory.m
//  BelgianBeer
//
//  Created by Amatsu on 11/09/06.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "BeerCategory.h"
#import <Foundation/NSString.h>

@implementation BeerCategory

@synthesize categoryID;
@synthesize categoryName;
@synthesize categroyExplanation;
@synthesize beerList;


- (id)init{
    self = [super init];
    if (self) {
        // Initialization code here.
        return [self initParameter:-1 name:@"initName" exp:@"initExp"];
   }
    
    return self;
}

- (id)initParameter:(int)seq
              name:(NSString *)name
               exp:(NSString *) exp{
    
    categoryID = seq;
    categoryName = name;
    categroyExplanation = exp;
    beerList = [[NSMutableArray alloc]init];
    
    return self;
}

- (NSString *) getCategoryName{
    return categoryName;
}

@end

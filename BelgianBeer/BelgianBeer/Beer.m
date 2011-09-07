//
//  Beer.m
//  BelgianBeer
//
//  Created by Amatsu on 11/09/07.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Beer.h"

@implementation Beer

@synthesize commodityID;
@synthesize beerName;
@synthesize beerExplanation;

- (id)init
{
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
    
    commodityID = seq;
    beerName = name;
    beerExplanation = exp;
    
    return self;
}

@end

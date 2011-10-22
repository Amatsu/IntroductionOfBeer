//
//  Ale.m
//  BelgianBeer
//
//  Created by Amatsu on 11/10/16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Ale.h"

@implementation Ale

//プロパティと対応付け
@synthesize AleNo;
@synthesize AleID;
@synthesize AleName;
@synthesize AleKanaName;
@synthesize AleExplanation;
@synthesize AleImage;
@synthesize AleStyleList;
@synthesize Rank;
@synthesize DrinkState;
@synthesize ReviewText;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

@end

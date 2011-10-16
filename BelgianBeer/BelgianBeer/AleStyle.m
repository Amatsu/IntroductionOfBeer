//
//  AleStyle.m
//  BelgianBeer
//
//  Created by Amatsu on 11/10/16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "AleStyle.h"

@implementation AleStyle

//プロパティと対応付け
@synthesize AleStyleNo;
@synthesize AleStyleID;
@synthesize AleStyleName;
@synthesize AleStyleKanaName;
@synthesize AleStyleExplanation;
@synthesize AleList;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

@end

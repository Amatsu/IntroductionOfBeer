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
@synthesize beerKanaName;
@synthesize beerExplanation;
@synthesize beerImage;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        return [self initParameter:-1 name:@"initName" kanaName:@"initkanaName" exp:@"initExp" img:@"no-image.png"];

    }
    
    return self;
}

- (id)initParameter:(int)seq
               name:(NSString *)name
            kanaName:(NSString *)kanaName
                exp:(NSString *) exp
                img:(NSString *) img{
    
    commodityID = seq;
    beerName = name;
    beerKanaName = kanaName;
    beerExplanation = exp;
    beerImage = [UIImage imageNamed:img];
    return self;
}

@end

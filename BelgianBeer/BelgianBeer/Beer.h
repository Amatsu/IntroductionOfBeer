//
//  Beer.h
//  BelgianBeer
//
//  Created by Amatsu on 11/09/07.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Beer : NSObject{
    int commodityID;
    NSString *beerName;
    NSString *beerExplanation;
}


@property (readonly)int commodityID;
@property (readonly)NSString *beerName;
@property (readonly)NSString *beerExplanation;

- (id) initParameter:(int) seq
                name:(NSString *)name
                 exp:(NSString *)exp;
@end

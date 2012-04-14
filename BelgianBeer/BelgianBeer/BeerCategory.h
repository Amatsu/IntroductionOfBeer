//
//  BeerCategory.h
//  BelgianBeer
//
//  Created by Amatsu on 11/09/06.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/NSString.h>

@interface BeerCategory : NSObject{
    int categoryID;
    NSString *categoryName;
    NSString *categroyExplanation;
    NSMutableArray *beerList;
}

@property (readonly)int categoryID;
@property (readonly)NSString *categoryName;
@property (readonly)NSString *categroyExplanation;
@property (readonly)NSMutableArray *beerList;

- (id)initParameter:(int)seq
                name:(NSString *)name
                 exp:(NSString *) exp;

                     

@end

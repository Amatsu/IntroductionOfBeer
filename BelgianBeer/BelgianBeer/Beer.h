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
    NSString *beerKanaName;
    NSString *beerExplanation;
    UIImage  *beerImage;
}


@property (readonly)int commodityID;
@property (readonly)NSString *beerName;
@property (readonly)NSString *beerKanaName;
@property (readonly)NSString *beerExplanation;
@property (readonly)UIImage *beerImage;

- (id) initParameter:(int) seq
                name:(NSString *)name
            kanaName:(NSString *)kanaName
                 exp:(NSString *)exp
                 img:(NSString *)img;
@end

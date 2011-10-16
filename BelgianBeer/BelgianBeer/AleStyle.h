//
//  AleStyle.h
//  BelgianBeer
//
//  Created by Amatsu on 11/10/16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AleStyle : NSObject{
    int       AleSytleNo;
    NSString *AleSytleID;
    NSString *AleSytleName;
    NSString *AleSytleKanaName;
    NSString *AleSytleExplanation;
    NSMutableArray *AleList;
}

@property (assign)int AleStyleNo;
@property (assign)NSString *AleStyleID;
@property (assign)NSString *AleStyleName;
@property (assign)NSString *AleStyleKanaName;
@property (assign)NSString *AleStyleExplanation;
@property (assign)NSMutableArray *AleList;


@end

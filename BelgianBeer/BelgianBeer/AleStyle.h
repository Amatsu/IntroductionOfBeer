//
//  AleStyle.h
//  BelgianBeer
//
//  Created by Amatsu on 11/10/16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AleStyle : NSObject{
    int       _aleSytleNo;
    NSString* _aleSytleID;
    NSString* _aleSytleName;
    NSString* _aleSytleKanaName;
    NSString* _aleSytleExplanation;
    NSMutableArray *AleList;
}

@property (assign)int _aleStyleNo;
@property (assign)NSString* _aleStyleID;
@property (assign)NSString* _aleStyleName;
@property (assign)NSString* _aleStyleKanaName;
@property (assign)NSString* _aleStyleExplanation;
@property (assign)NSMutableArray* _aleList;


@end

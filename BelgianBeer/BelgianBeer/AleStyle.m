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
@synthesize aleStyleNo;
@synthesize aleStyleID;
@synthesize aleStyleName;
@synthesize aleStyleKanaName;
@synthesize aleStyleExplanation;
@synthesize aleList;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        return [self initParameter:-1 styleId:@"" styleName:@"" styleKanaName:@"" styleExplanation:@""];
    }
    
    return self;
}

//全ての引数を持つinit
- (id)initParameter:(int) sytleNo
            styleId:(NSString *) styleId
          styleName:(NSString *) name
      styleKanaName:(NSString *) kanaName
   styleExplanation:(NSString *) exp
{
 
    aleStyleNo = sytleNo;
    aleStyleID = styleId;
    aleStyleName = name;
    aleStyleKanaName = kanaName;
    aleStyleExplanation = exp;
    
    //AleListは初期化
    aleList = [[NSMutableArray alloc]init];
    
    //設定後に自身を返す
    return self;
}

@end

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
@synthesize _aleStyleNo;
@synthesize _aleStyleID;
@synthesize _aleStyleName;
@synthesize _aleStyleKanaName;
@synthesize _aleStyleExplanation;
@synthesize _aleList;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

//全ての引数を持つinit
- (id)initParameter:(int) sytleNo
            styleId:(NSString *) styleId
          styleName:(NSString *) name
      styleKanaName:(NSString *) kanaName
   styleExplanation:(NSString *) exp
            aleList:(NSMutableArray *) aleList
{
 
    self._aleStyleNo = sytleNo;
    self._aleStyleID = styleId;
    self._aleStyleName = name;
    self._aleStyleKanaName = kanaName;
    self._aleStyleExplanation = exp;
    self._aleList = aleList;
    
    //設定後に自身を返す
    return self;
}

@end

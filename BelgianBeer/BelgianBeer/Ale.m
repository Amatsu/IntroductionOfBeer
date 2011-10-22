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
@synthesize aleNo;
@synthesize aleID;
@synthesize aleName;
@synthesize aleKanaName;
@synthesize aleExplanation;
@synthesize aleMiniImage;
@synthesize aleImage;
@synthesize aleStyleList;
@synthesize rank;
@synthesize drinkState;
@synthesize reviewText;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

//全ての引数を持つinit
- (id)initParameter:(int)no
               aleId:(NSString *) aleId
             aleName:(NSString *) name
         aleKanaName:(NSString *) kanaName
         explanation:(NSString *) exp
  miniImageFileName:(NSString *) miniImageFileName
      imageFileName:(NSString *) ImageFileName
               rank:(int) rankVal
         drinkState:(int) state
             review:(NSString *) review
{
    
    aleNo = no;
    aleID = aleId;
    aleName = name;
    aleKanaName = kanaName;
    aleExplanation = exp;
    aleMiniImage = [UIImage imageNamed:miniImageFileName];
    aleImage = [UIImage imageNamed:ImageFileName];
    rank = rankVal;
    drinkState = state;
    reviewText = review;
    
    //StyleListは初期化する
    aleStyleList = [[NSMutableArray alloc]init];
    
    //プロパティ設定後自身を返す
    return self;
}


@end

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
@synthesize _aleNo;
@synthesize _aleID;
@synthesize _aleName;
@synthesize _aleKanaName;
@synthesize _aleExplanation;
@synthesize _aleMiniImage;
@synthesize _aleImage;
@synthesize _aleStyleList;
@synthesize _rank;
@synthesize _drinkState;
@synthesize _reviewText;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

//全ての引数を持つinit
- (id)initParameter:(int)aleNo
               aleId:(NSString *) aleId
             aleName:(NSString *) name
         aleKanaName:(NSString *) kanaName
         explanation:(NSString *) exp
  miniImageFileName:(NSString *) miniImageFileName
      imageFileName:(NSString *) ImageFileName
          styleList:(NSMutableArray *) styleList
               rank:(int) rank
         drinkState:(int) drinkState
             review:(NSString *) review
{
    
    self._aleNo = aleNo;
    self._aleID = aleId;
    self._aleName = name;
    self._aleKanaName = kanaName;
    self._aleExplanation = exp;
    self._aleMiniImage = [UIImage imageNamed:miniImageFileName];
    self._aleImage = [UIImage imageNamed:ImageFileName];
    self._aleStyleList = styleList;
    self._rank = rank;
    self._drinkState = drinkState;
    self._reviewText = review;
    
    //プロパティ設定後自身を返す
    return self;
}


@end

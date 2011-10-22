//
//  Ale.h
//  BelgianBeer
//
//  Created by Amatsu on 11/10/16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

//Aleの情報を保持
@interface Ale : NSObject{
    int       _aleNo;
    NSString* _aleID;
    NSString* _aleName;
    NSString* _aleKanaName;
    NSString* _aleExplanation;
    UIImage*  _aleMiniImage;
    UIImage*  _aleImage;
    NSMutableArray* _aleStyleList;  //該当するStyleのリスト　Aleに対して複数のStyleが適用される
    int       _rank;             //0~5までのランク
    int       _drinkState;       //1:次回飲む予定
    NSString* _reviewText;       //感想（未使用）
}

//技術ノート：(assign)は単純代入を使用するという意味
@property (assign)int       _aleNo;
@property (assign)NSString* _aleID;
@property (assign)NSString* _aleName;
@property (assign)NSString* _aleKanaName;
@property (assign)NSString* _aleExplanation;
@property (assign)UIImage*  _aleMiniImage;
@property (assign)UIImage*  _aleImage;
@property (assign)NSMutableArray * _aleStyleList;
@property (assign)int       _rank;
@property (assign)int       _drinkState;
@property (assign)NSString* _reviewText;

@end

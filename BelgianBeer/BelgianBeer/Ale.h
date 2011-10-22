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
    int       aleNo;
    NSString *aleID;
    NSString *aleName;
    NSString *aleKanaName;
    NSString *aleExplanation;
    UIImage  *aleMiniImage;
    UIImage  *aleImage;
    NSMutableArray *aleStyleList;  //該当するStyleのリスト　Aleに対して複数のStyleが適用される
    int       rank;             //0~5までのランク
    int       drinkState;       //1:次回飲む予定
    NSString *reviewText;       //感想（未使用）
}

//技術ノート：(assign)は単純代入を使用するという意味
@property (assign)int       aleNo;
@property (assign)NSString *aleID;
@property (assign)NSString *aleName;
@property (assign)NSString *aleKanaName;
@property (assign)NSString *aleExplanation;
@property (assign)UIImage  *aleMiniImage;
@property (assign)UIImage  *aleImage;
@property (assign)NSMutableArray *aleStyleList;
@property (assign)int       rank;
@property (assign)int       drinkState;
@property (assign)NSString *reviewText;


//初期化用メソッド
- (id)initParameter:(int)aleNo
              aleId:(NSString *) aleId
            aleName:(NSString *) name
        aleKanaName:(NSString *) kanaName
        explanation:(NSString *) exp
  miniImageFileName:(NSString *) miniImageFileName
      imageFileName:(NSString *) ImageFileName
               rank:(int) rank
         drinkState:(int) drinkState
             review:(NSString *) review;
@end

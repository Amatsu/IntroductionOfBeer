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
    int       AleNo;
    NSString *AleID;
    NSString *AleName;
    NSString *AleKanaName;
    NSString *AleExplanation;
    UIImage  *AleImage;
    NSMutableArray *AleStyleList;  //該当するStyleのリスト　Aleに対して複数のStyleが適用される
    int       Rank;             //0~5までのランク
    int       DrinkState;       //1:次回飲む予定
    NSString *ReviewText;       //感想（未使用）
}

//技術ノート：(assign)は単純代入を使用するという意味
@property (assign)int       AleNo;
@property (assign)NSString *AleID;
@property (assign)NSString *AleName;
@property (assign)NSString *AleKanaName;
@property (assign)NSString *AleExplanation;
@property (assign)UIImage  *AleImage;
@property (assign)NSMutableArray *AleStyleList;
@property (assign)int       Rank;
@property (assign)int       DrinkState;
@property (assign)NSString *ReviewText;

@end

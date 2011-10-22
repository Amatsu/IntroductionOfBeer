//
//  AleStyle.h
//  BelgianBeer
//
//  Created by Amatsu on 11/10/16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AleStyle : NSObject{
    int       aleSytleNo;
    NSString *aleSytleID;
    NSString *aleSytleName;
    NSString *aleSytleKanaName;
    NSString *aleSytleExplanation;
    NSMutableArray *aleList;
}

@property (assign)int aleStyleNo;
@property (assign)NSString *aleStyleID;
@property (assign)NSString *aleStyleName;
@property (assign)NSString *aleStyleKanaName;
@property (assign)NSString *aleStyleExplanation;
@property (assign)NSMutableArray* aleList;

//初期化用メソッド
- (id)initParameter:(int) sytleNo
            styleId:(NSString *) styleId
          styleName:(NSString *) name
      styleKanaName:(NSString *) kanaName
   styleExplanation:(NSString *) exp;

@end

//
//  AleInfoDbAccessController.h
//  BelgianBeer
//
//  Created by Amatsu on 11/10/16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

//DBから情報を取得する
@interface AleInfoDbAccessController : NSObject

//A-Z順でAle一覧を返すメソッド
-(NSMutableArray *) getAleList_SortByAtoZ;

//Style順でAle一覧を返すメソッド
-(NSMutableArray *) getAleList_SortByStyle;

@end

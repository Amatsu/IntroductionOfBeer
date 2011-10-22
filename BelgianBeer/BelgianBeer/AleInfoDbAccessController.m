//
//  AleInfoDbAccessController.m
//  BelgianBeer
//
//  Created by Amatsu on 11/10/16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "AleInfoDbAccessController.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "Ale.h"
#import "AleStyle.h"

@implementation AleInfoDbAccessController

@synthesize _writeDbPath;

- (id)init
{
    self = [super init];
    if (self) {
        //--------------------------writableDBPath------------------------------------------
        //DBをiPhone上に作成
        //上書きの仕方がまだ見検討
        //--------------------------------------------------------------------
        
        // ファイルがなければプロジェクトフォルダからiPhone Documentフォルダにコピー
        BOOL success;
        NSError *error;	
        NSFileManager *fm = [NSFileManager defaultManager];
        NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        self._writeDbPath = [[documentsDirectory stringByAppendingPathComponent:@"Beer.db"]retain] ;
        success = [fm fileExistsAtPath:self._writeDbPath];
        if(!success){
            NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Beer.db"];
            success = [fm copyItemAtPath:defaultDBPath toPath:self._writeDbPath error:&error];
            if(!success){
                //Error
                //NSLog([error localizedDescription]);
            }
        }
    }
    return self;
}

//A-Z順でAle一覧を返すメソッド
-(NSMutableArray *) getAleList_SortByAtoZ{
    return nil;
}

//Style順でAle一覧を返すメソッド

-(NSMutableArray *) getAleList_SortByStyle{
    
    //戻り値のリストを生成
    NSMutableArray *wkStyleList = [[NSMutableArray alloc]init];
    NSLog(@"%d",wkStyleList.count);
    
    
    FMDatabase* db = [FMDatabase databaseWithPath:self._writeDbPath];
    
    if ([db open]) {
        [db setShouldCacheStatements:YES];
        
        NSMutableString *sql = [NSMutableString string];
        [sql appendString:@" SELECT "];
        [sql appendString:@"       STYLE.STYLE_NO "];
        [sql appendString:@"     , STYLE.STYLE_ID "];
        [sql appendString:@"     , STYLE.STYLE_NAME "];
        [sql appendString:@"     , STYLE.STYLE_KANA_NAME "];
        [sql appendString:@"     , STYLE.STYLE_EXPLANATION "];
        [sql appendString:@"     , ALE.ALE_NO "];
        [sql appendString:@"     , ALE.ALE_ID "];
        [sql appendString:@"     , ALE.ALE_NAME "];
        [sql appendString:@"     , ALE.ALE_KANA_NAME "];
        [sql appendString:@"     , ALE.ALE_EXPLANATION "];
        [sql appendString:@"     , ALE.ALE_MINI_IMAGE_FILENAME "];
        [sql appendString:@"     , ALE.ALE_IMAGE_FILENAME "];
        [sql appendString:@"     , REVIEW.RANK "];
        [sql appendString:@"     , REVIEW.NEXT_DRINK_STATE "];
        [sql appendString:@"     , REVIEW.REVIEW_TEXT "];
        [sql appendString:@" FROM STYLE INNER JOIN ALE_STYLE "];
        [sql appendString:@"                    ON STYLE.STYLE_NO = ALE_STYLE.STYLE_NO "];
        [sql appendString:@"		    INNER JOIN ALE "];
        [sql appendString:@"				    ON ALE_STYLE.ALE_NO = ALE.ALE_NO "];
        [sql appendString:@"			 LEFT JOIN REVIEW "];
        [sql appendString:@"			   				ON ALE.ALE_NO = REVIEW.ALE_NO "];
        [sql appendString:@" ORDER BY STYLE.STYLE_NO ASC "];
        [sql appendString:@"			  , STYLE.STYLE_NAME ASC "];
        [sql appendString:@" 			  , ALE.ALE_NAME ASC "];
        
        //sqｌの中身の確認
        //NSLog(@"%@",sql);
        
        //SQLを発行
        FMResultSet *rs = [db executeQuery:sql];
        
        //戻り値のリストを生成
        int beforeStyleNo = -1;
        AleStyle *wkStylel;
        Ale *wkAle;
        
        //レコード分ループ
        while ([rs next]) {
            
            if (beforeStyleNo != [rs intForColumn:@"STYLE_NO"]) {
                
                //StyleNoを保存
                beforeStyleNo = [rs intForColumn:@"STYLE_NO"];
                
                //Styleを生成
                wkStylel = [[[AleStyle alloc] init] retain];
                [wkStylel initParameter:[rs intForColumn:@"STYLE_NO"]
                                 styleId:[[rs stringForColumn:@"STYLE_ID"] retain]
                               styleName:[[rs stringForColumn:@"STYLE_NAME"] retain]
                           styleKanaName:[[rs stringForColumn:@"STYLE_KANA_NAME"] retain]
                        styleExplanation:[[rs stringForColumn:@"STYLE_EXPLANATION"] retain]];
                
                //生成したStyleを追加
                [wkStyleList addObject:wkStylel];
                
            }
            
            //Aleを生成
            wkAle = [[[Ale alloc]init] retain];
            [wkAle initParameter:[rs intForColumn:@"ALE_NO"]
                           aleId:[[rs stringForColumn:@"ALE_ID"] retain]
                         aleName:[[rs stringForColumn:@"ALE_NAME"] retain]
                     aleKanaName:[[rs stringForColumn:@"ALE_KANA_NAME"] retain]
                     explanation:[[rs stringForColumn:@"ALE_EXPLANATION"] retain]
               miniImageFileName:[[rs stringForColumn:@"ALE_MINI_IMAGE_FILENAME"] retain]
                   imageFileName:[[rs stringForColumn:@"ALE_IMAGE_FILENAME"] retain]
                            rank:[rs intForColumn:@"RANK"]
                      drinkState:[rs intForColumn:@"NEXT_DRINK_STATE"]
                          review:[[rs stringForColumn:@"REVIEW_TEXT"] retain]];
            
            //StyleにAleを追加
            [wkStylel.aleList addObject:wkAle];
        }
        
        [rs close];  
        [db close];
    }

    //AleListを変換
    return wkStyleList;
}

@end

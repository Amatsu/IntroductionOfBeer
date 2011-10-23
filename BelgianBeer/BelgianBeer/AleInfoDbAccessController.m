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

    //戻り値のリストを生成
    NSMutableArray *wkAleList = [[NSMutableArray alloc]init];
    
    FMDatabase* db = [FMDatabase databaseWithPath:self._writeDbPath];
    
    if ([db open]) {
        [db setShouldCacheStatements:YES];
            
            //Sytleに対するAleを取得
            NSMutableString *getAleSql = [NSMutableString string];
            [getAleSql appendString:@" SELECT "];
            [getAleSql appendString:@"       ALE.ALE_NO "];
            [getAleSql appendString:@"     , ALE.ALE_ID "];
            [getAleSql appendString:@"     , ALE.ALE_NAME "];
            [getAleSql appendString:@"     , ALE.ALE_KANA_NAME "];
            [getAleSql appendString:@"     , ALE.ALE_EXPLANATION "];
            [getAleSql appendString:@"     , ALE.ALE_MINI_IMAGE_FILENAME "];
            [getAleSql appendString:@"     , ALE.ALE_IMAGE_FILENAME "];
            [getAleSql appendString:@"     , REVIEW.RANK "];
            [getAleSql appendString:@"     , REVIEW.NEXT_DRINK_STATE "];
            [getAleSql appendString:@"     , REVIEW.REVIEW_TEXT "];
            
            [getAleSql appendString:@"     , STYLE1.STYLE_NO          AS STYLE1_STYLE_NO "];
            [getAleSql appendString:@"     , STYLE1.STYLE_ID          AS STYLE1_STYLE_ID "];
            [getAleSql appendString:@"     , STYLE1.STYLE_NAME        AS STYLE1_STYLE_NAME "];
            [getAleSql appendString:@"     , STYLE1.STYLE_KANA_NAME   AS STYLE1_STYLE_KANA_NAME "];
            [getAleSql appendString:@"     , STYLE1.STYLE_EXPLANATION AS STYLE1_STYLE_EXPLANATION "];
            
            [getAleSql appendString:@"     , STYLE2.STYLE_NO          AS STYLE2_STYLE_NO "];
            [getAleSql appendString:@"     , STYLE2.STYLE_ID          AS STYLE2_STYLE_ID "];
            [getAleSql appendString:@"     , STYLE2.STYLE_NAME        AS STYLE2_STYLE_NAME "];
            [getAleSql appendString:@"     , STYLE2.STYLE_KANA_NAME   AS STYLE2_STYLE_KANA_NAME "];
            [getAleSql appendString:@"     , STYLE2.STYLE_EXPLANATION AS STYLE2_STYLE_EXPLANATION "];
            
            [getAleSql appendString:@"     , STYLE3.STYLE_NO          AS STYLE3_STYLE_NO "];
            [getAleSql appendString:@"     , STYLE3.STYLE_ID          AS STYLE3_STYLE_ID "];
            [getAleSql appendString:@"     , STYLE3.STYLE_NAME        AS STYLE3_STYLE_NAME "];
            [getAleSql appendString:@"     , STYLE3.STYLE_KANA_NAME   AS STYLE3_STYLE_KANA_NAME "];
            [getAleSql appendString:@"     , STYLE3.STYLE_EXPLANATION AS STYLE3_STYLE_EXPLANATION "];
            
            [getAleSql appendString:@"     , STYLE4.STYLE_NO          AS STYLE4_STYLE_NO "];
            [getAleSql appendString:@"     , STYLE4.STYLE_ID          AS STYLE4_STYLE_ID "];
            [getAleSql appendString:@"     , STYLE4.STYLE_NAME        AS STYLE4_STYLE_NAME "];
            [getAleSql appendString:@"     , STYLE4.STYLE_KANA_NAME   AS STYLE4_STYLE_KANA_NAME "];
            [getAleSql appendString:@"     , STYLE4.STYLE_EXPLANATION AS STYLE4_STYLE_EXPLANATION "];
            
            [getAleSql appendString:@"     , STYLE5.STYLE_NO          AS STYLE5_STYLE_NO "];
            [getAleSql appendString:@"     , STYLE5.STYLE_ID          AS STYLE5_STYLE_ID "];
            [getAleSql appendString:@"     , STYLE5.STYLE_NAME        AS STYLE5_STYLE_NAME "];
            [getAleSql appendString:@"     , STYLE5.STYLE_KANA_NAME   AS STYLE5_STYLE_KANA_NAME "];
            [getAleSql appendString:@"     , STYLE5.STYLE_EXPLANATION AS STYLE5_STYLE_EXPLANATION "];
            
            [getAleSql appendString:@" FROM ALE LEFT JOIN REVIEW "];
            [getAleSql appendString:@"			   	   ON ALE.ALE_NO = REVIEW.ALE_NO "];
            [getAleSql appendString:@"          LEFT JOIN STYLE STYLE1"];
            [getAleSql appendString:@"			   	   ON ALE.ALE_STYLE_1 = STYLE1.STYLE_NO "];
            [getAleSql appendString:@"          LEFT JOIN STYLE STYLE2"];
            [getAleSql appendString:@"			   	   ON ALE.ALE_STYLE_2 = STYLE2.STYLE_NO "];
            [getAleSql appendString:@"          LEFT JOIN STYLE STYLE3"];
            [getAleSql appendString:@"			   	   ON ALE.ALE_STYLE_3 = STYLE3.STYLE_NO "];
            [getAleSql appendString:@"          LEFT JOIN STYLE STYLE4"];
            [getAleSql appendString:@"			   	   ON ALE.ALE_STYLE_4 = STYLE4.STYLE_NO "];
            [getAleSql appendString:@"          LEFT JOIN STYLE STYLE5"];
            [getAleSql appendString:@"			   	   ON ALE.ALE_STYLE_5 = STYLE5.STYLE_NO "];
            [getAleSql appendString:@" ORDER BY ALE.ALE_NAME ASC "];
            
            FMResultSet *ale_rs = [db executeQuery:getAleSql];
            
            Ale *wkAle;
            while ([ale_rs next]) {
                //Aleを生成
                wkAle = [[Ale alloc]init];
                [wkAle initParameter:[ale_rs intForColumn:@"ALE_NO"]
                               aleId:[[ale_rs stringForColumn:@"ALE_ID"] retain]
                             aleName:[[ale_rs stringForColumn:@"ALE_NAME"] retain]
                         aleKanaName:[[ale_rs stringForColumn:@"ALE_KANA_NAME"] retain]
                         explanation:[[ale_rs stringForColumn:@"ALE_EXPLANATION"] retain]
                   miniImageFileName:[[ale_rs stringForColumn:@"ALE_MINI_IMAGE_FILENAME"] retain]
                       imageFileName:[[ale_rs stringForColumn:@"ALE_IMAGE_FILENAME"] retain]
                                rank:[ale_rs intForColumn:@"RANK"]
                          drinkState:[ale_rs intForColumn:@"NEXT_DRINK_STATE"]
                              review:[[ale_rs stringForColumn:@"REVIEW_TEXT"] retain]];
                
                //Style1
                AleStyle *tmpStylel1 = [[AleStyle alloc] init];
                [tmpStylel1 initParameter:[ale_rs intForColumn:@"STYLE1_STYLE_NO"]
                                  styleId:[[ale_rs stringForColumn:@"STYLE1_STYLE_ID"] retain]
                                styleName:[[ale_rs stringForColumn:@"STYLE1_STYLE_NAME"] retain]
                            styleKanaName:[[ale_rs stringForColumn:@"STYLE1_STYLE_KANA_NAME"] retain]
                         styleExplanation:[[ale_rs stringForColumn:@"STYLE1_STYLE_EXPLANATION"] retain]];
                if (tmpStylel1.aleStyleNo > 0) {
                    [wkAle.aleStyleList addObject:tmpStylel1];
                }
                
                //Style2
                AleStyle *tmpStylel2 = [[AleStyle alloc] init];
                [tmpStylel2 initParameter:[ale_rs intForColumn:@"STYLE2_STYLE_NO"]
                                  styleId:[[ale_rs stringForColumn:@"STYLE2_STYLE_ID"] retain]
                                styleName:[[ale_rs stringForColumn:@"STYLE2_STYLE_NAME"] retain]
                            styleKanaName:[[ale_rs stringForColumn:@"STYLE2_STYLE_KANA_NAME"] retain]
                         styleExplanation:[[ale_rs stringForColumn:@"STYLE2_STYLE_EXPLANATION"] retain]];
                if (tmpStylel2.aleStyleNo > 0) {
                    [wkAle.aleStyleList addObject:tmpStylel2];
                }
                
                //Style3
                AleStyle *tmpStylel3 = [[AleStyle alloc] init];
                [tmpStylel3 initParameter:[ale_rs intForColumn:@"STYLE3_STYLE_NO"]
                                  styleId:[[ale_rs stringForColumn:@"STYLE3_STYLE_ID"] retain]
                                styleName:[[ale_rs stringForColumn:@"STYLE3_STYLE_NAME"] retain]
                            styleKanaName:[[ale_rs stringForColumn:@"STYLE3_STYLE_KANA_NAME"] retain]
                         styleExplanation:[[ale_rs stringForColumn:@"STYLE3_STYLE_EXPLANATION"] retain]];
                if (tmpStylel3.aleStyleNo > 0) {
                    [wkAle.aleStyleList addObject:tmpStylel3];
                }
                
                //Style4
                AleStyle *tmpStylel4 = [[AleStyle alloc] init];
                [tmpStylel4 initParameter:[ale_rs intForColumn:@"STYLE4_STYLE_NO"]
                                  styleId:[[ale_rs stringForColumn:@"STYLE4_STYLE_ID"] retain]
                                styleName:[[ale_rs stringForColumn:@"STYLE4_STYLE_NAME"] retain]
                            styleKanaName:[[ale_rs stringForColumn:@"STYLE4_STYLE_KANA_NAME"] retain]
                         styleExplanation:[[ale_rs stringForColumn:@"STYLE4_STYLE_EXPLANATION"] retain]];
                if (tmpStylel4.aleStyleNo > 0) {
                    [wkAle.aleStyleList addObject:tmpStylel4];
                }
                
                //Style5
                AleStyle *tmpStylel5 = [[AleStyle alloc] init];
                [tmpStylel5 initParameter:[ale_rs intForColumn:@"STYLE5_STYLE_NO"]
                                  styleId:[[ale_rs stringForColumn:@"STYLE5_STYLE_ID"] retain]
                                styleName:[[ale_rs stringForColumn:@"STYLE5_STYLE_NAME"] retain]
                            styleKanaName:[[ale_rs stringForColumn:@"STYLE5_STYLE_KANA_NAME"] retain]
                         styleExplanation:[[ale_rs stringForColumn:@"STYLE5_STYLE_EXPLANATION"] retain]];
                if (tmpStylel5.aleStyleNo > 0) {
                    [wkAle.aleStyleList addObject:tmpStylel5];
                }
                
                //リストに追加
                [wkAleList addObject:wkAle];
                
            }
        
        [ale_rs close]; 
        [db close];
    }
    
    //AleListを変換
    return wkAleList;
}

//Style順でAle一覧を返すメソッド

-(NSMutableArray *) getAleList_SortByStyle{
    
    //戻り値のリストを生成
    NSMutableArray *wkStyleList = [[NSMutableArray alloc]init];
    
    FMDatabase* db = [FMDatabase databaseWithPath:self._writeDbPath];
    
    if ([db open]) {
        [db setShouldCacheStatements:YES];
        
        NSMutableString *getStyleSql = [NSMutableString string];
        [getStyleSql appendString:@" SELECT "];
        [getStyleSql appendString:@"       STYLE.STYLE_NO "];
        [getStyleSql appendString:@"     , STYLE.STYLE_ID "];
        [getStyleSql appendString:@"     , STYLE.STYLE_NAME "];
        [getStyleSql appendString:@"     , STYLE.STYLE_KANA_NAME "];
        [getStyleSql appendString:@"     , STYLE.STYLE_EXPLANATION "];
        [getStyleSql appendString:@" FROM STYLE "];
        [getStyleSql appendString:@" ORDER BY STYLE.STYLE_NO ASC "];
        [getStyleSql appendString:@"			  , STYLE.STYLE_NAME ASC "];
        
        //sqｌの中身の確認
        //NSLog(@"%@",sql);
        
        //SQLを発行
        FMResultSet *style_rs = [db executeQuery:getStyleSql];
        
        AleStyle *wkStylel;
        while ([style_rs next]) {
            

            //Styleを生成
            wkStylel = [[AleStyle alloc] init];
            [wkStylel initParameter:[style_rs intForColumn:@"STYLE_NO"]
                            styleId:[[style_rs stringForColumn:@"STYLE_ID"] retain]
                          styleName:[[style_rs stringForColumn:@"STYLE_NAME"] retain]
                      styleKanaName:[[style_rs stringForColumn:@"STYLE_KANA_NAME"] retain]
                   styleExplanation:[[style_rs stringForColumn:@"STYLE_EXPLANATION"] retain]];
                
            //生成したStyleを追加
            [wkStyleList addObject:wkStylel];
            
            
            //Sytleに対するAleを取得
            NSString *styleNo = [NSString stringWithFormat : @"%d", wkStylel.aleStyleNo];
            NSMutableString *getAleSql = [NSMutableString string];
            [getAleSql appendString:@" SELECT "];
            [getAleSql appendString:@"       ALE.ALE_NO "];
            [getAleSql appendString:@"     , ALE.ALE_ID "];
            [getAleSql appendString:@"     , ALE.ALE_NAME "];
            [getAleSql appendString:@"     , ALE.ALE_KANA_NAME "];
            [getAleSql appendString:@"     , ALE.ALE_EXPLANATION "];
            [getAleSql appendString:@"     , ALE.ALE_MINI_IMAGE_FILENAME "];
            [getAleSql appendString:@"     , ALE.ALE_IMAGE_FILENAME "];
            [getAleSql appendString:@"     , REVIEW.RANK "];
            [getAleSql appendString:@"     , REVIEW.NEXT_DRINK_STATE "];
            [getAleSql appendString:@"     , REVIEW.REVIEW_TEXT "];
            
            [getAleSql appendString:@"     , STYLE1.STYLE_NO          AS STYLE1_STYLE_NO "];
            [getAleSql appendString:@"     , STYLE1.STYLE_ID          AS STYLE1_STYLE_ID "];
            [getAleSql appendString:@"     , STYLE1.STYLE_NAME        AS STYLE1_STYLE_NAME "];
            [getAleSql appendString:@"     , STYLE1.STYLE_KANA_NAME   AS STYLE1_STYLE_KANA_NAME "];
            [getAleSql appendString:@"     , STYLE1.STYLE_EXPLANATION AS STYLE1_STYLE_EXPLANATION "];
            
            [getAleSql appendString:@"     , STYLE2.STYLE_NO          AS STYLE2_STYLE_NO "];
            [getAleSql appendString:@"     , STYLE2.STYLE_ID          AS STYLE2_STYLE_ID "];
            [getAleSql appendString:@"     , STYLE2.STYLE_NAME        AS STYLE2_STYLE_NAME "];
            [getAleSql appendString:@"     , STYLE2.STYLE_KANA_NAME   AS STYLE2_STYLE_KANA_NAME "];
            [getAleSql appendString:@"     , STYLE2.STYLE_EXPLANATION AS STYLE2_STYLE_EXPLANATION "];
            
            [getAleSql appendString:@"     , STYLE3.STYLE_NO          AS STYLE3_STYLE_NO "];
            [getAleSql appendString:@"     , STYLE3.STYLE_ID          AS STYLE3_STYLE_ID "];
            [getAleSql appendString:@"     , STYLE3.STYLE_NAME        AS STYLE3_STYLE_NAME "];
            [getAleSql appendString:@"     , STYLE3.STYLE_KANA_NAME   AS STYLE3_STYLE_KANA_NAME "];
            [getAleSql appendString:@"     , STYLE3.STYLE_EXPLANATION AS STYLE3_STYLE_EXPLANATION "];
            
            [getAleSql appendString:@"     , STYLE4.STYLE_NO          AS STYLE4_STYLE_NO "];
            [getAleSql appendString:@"     , STYLE4.STYLE_ID          AS STYLE4_STYLE_ID "];
            [getAleSql appendString:@"     , STYLE4.STYLE_NAME        AS STYLE4_STYLE_NAME "];
            [getAleSql appendString:@"     , STYLE4.STYLE_KANA_NAME   AS STYLE4_STYLE_KANA_NAME "];
            [getAleSql appendString:@"     , STYLE4.STYLE_EXPLANATION AS STYLE4_STYLE_EXPLANATION "];
            
            [getAleSql appendString:@"     , STYLE5.STYLE_NO          AS STYLE5_STYLE_NO "];
            [getAleSql appendString:@"     , STYLE5.STYLE_ID          AS STYLE5_STYLE_ID "];
            [getAleSql appendString:@"     , STYLE5.STYLE_NAME        AS STYLE5_STYLE_NAME "];
            [getAleSql appendString:@"     , STYLE5.STYLE_KANA_NAME   AS STYLE5_STYLE_KANA_NAME "];
            [getAleSql appendString:@"     , STYLE5.STYLE_EXPLANATION AS STYLE5_STYLE_EXPLANATION "];
             
            [getAleSql appendString:@" FROM ALE LEFT JOIN REVIEW "];
            [getAleSql appendString:@"			   	   ON ALE.ALE_NO = REVIEW.ALE_NO "];
            [getAleSql appendString:@"          LEFT JOIN STYLE STYLE1"];
            [getAleSql appendString:@"			   	   ON ALE.ALE_STYLE_1 = STYLE1.STYLE_NO "];
            [getAleSql appendString:@"          LEFT JOIN STYLE STYLE2"];
            [getAleSql appendString:@"			   	   ON ALE.ALE_STYLE_2 = STYLE2.STYLE_NO "];
            [getAleSql appendString:@"          LEFT JOIN STYLE STYLE3"];
            [getAleSql appendString:@"			   	   ON ALE.ALE_STYLE_3 = STYLE3.STYLE_NO "];
            [getAleSql appendString:@"          LEFT JOIN STYLE STYLE4"];
            [getAleSql appendString:@"			   	   ON ALE.ALE_STYLE_4 = STYLE4.STYLE_NO "];
            [getAleSql appendString:@"          LEFT JOIN STYLE STYLE5"];
            [getAleSql appendString:@"			   	   ON ALE.ALE_STYLE_5 = STYLE5.STYLE_NO "];
            
            [getAleSql appendString:@" WHERE ALE.ALE_STYLE_1="];
            [getAleSql appendString:styleNo];
            [getAleSql appendString:@"    OR ALE.ALE_STYLE_2="];
            [getAleSql appendString:styleNo];
            [getAleSql appendString:@"    OR ALE.ALE_STYLE_3="];
            [getAleSql appendString:styleNo];
            [getAleSql appendString:@"    OR ALE.ALE_STYLE_4="];
            [getAleSql appendString:styleNo];
            [getAleSql appendString:@"    OR ALE.ALE_STYLE_5="];
            [getAleSql appendString:styleNo];
            [getAleSql appendString:@" ORDER BY ALE.ALE_NAME ASC "];
            
            NSLog(@"%@",getAleSql);
            
            FMResultSet *ale_rs = [db executeQuery:getAleSql];
            
            Ale *wkAle;
            while ([ale_rs next]) {
                //Aleを生成
                wkAle = [[Ale alloc]init];
                [wkAle initParameter:[ale_rs intForColumn:@"ALE_NO"]
                               aleId:[[ale_rs stringForColumn:@"ALE_ID"] retain]
                             aleName:[[ale_rs stringForColumn:@"ALE_NAME"] retain]
                         aleKanaName:[[ale_rs stringForColumn:@"ALE_KANA_NAME"] retain]
                         explanation:[[ale_rs stringForColumn:@"ALE_EXPLANATION"] retain]
                   miniImageFileName:[[ale_rs stringForColumn:@"ALE_MINI_IMAGE_FILENAME"] retain]
                       imageFileName:[[ale_rs stringForColumn:@"ALE_IMAGE_FILENAME"] retain]
                                rank:[ale_rs intForColumn:@"RANK"]
                          drinkState:[ale_rs intForColumn:@"NEXT_DRINK_STATE"]
                              review:[[ale_rs stringForColumn:@"REVIEW_TEXT"] retain]];
                
                //Style1
                AleStyle *tmpStylel1 = [[AleStyle alloc] init];
                [tmpStylel1 initParameter:[ale_rs intForColumn:@"STYLE1_STYLE_NO"]
                                  styleId:[[ale_rs stringForColumn:@"STYLE1_STYLE_ID"] retain]
                                styleName:[[ale_rs stringForColumn:@"STYLE1_STYLE_NAME"] retain]
                            styleKanaName:[[ale_rs stringForColumn:@"STYLE1_STYLE_KANA_NAME"] retain]
                         styleExplanation:[[ale_rs stringForColumn:@"STYLE1_STYLE_EXPLANATION"] retain]];
                if (tmpStylel1.aleStyleNo > 0) {
                    [wkAle.aleStyleList addObject:tmpStylel1];
                }
                
                //Style2
                AleStyle *tmpStylel2 = [[AleStyle alloc] init];
                [tmpStylel2 initParameter:[ale_rs intForColumn:@"STYLE2_STYLE_NO"]
                                  styleId:[[ale_rs stringForColumn:@"STYLE2_STYLE_ID"] retain]
                                styleName:[[ale_rs stringForColumn:@"STYLE2_STYLE_NAME"] retain]
                            styleKanaName:[[ale_rs stringForColumn:@"STYLE2_STYLE_KANA_NAME"] retain]
                         styleExplanation:[[ale_rs stringForColumn:@"STYLE2_STYLE_EXPLANATION"] retain]];
                if (tmpStylel2.aleStyleNo > 0) {
                    [wkAle.aleStyleList addObject:tmpStylel2];
                }
                
                //Style3
                AleStyle *tmpStylel3 = [[AleStyle alloc] init];
                [tmpStylel3 initParameter:[ale_rs intForColumn:@"STYLE3_STYLE_NO"]
                                  styleId:[[ale_rs stringForColumn:@"STYLE3_STYLE_ID"] retain]
                                styleName:[[ale_rs stringForColumn:@"STYLE3_STYLE_NAME"] retain]
                            styleKanaName:[[ale_rs stringForColumn:@"STYLE3_STYLE_KANA_NAME"] retain]
                         styleExplanation:[[ale_rs stringForColumn:@"STYLE3_STYLE_EXPLANATION"] retain]];
                if (tmpStylel3.aleStyleNo > 0) {
                    [wkAle.aleStyleList addObject:tmpStylel3];
                }
                
                //Style4
                AleStyle *tmpStylel4 = [[AleStyle alloc] init];
                [tmpStylel4 initParameter:[ale_rs intForColumn:@"STYLE4_STYLE_NO"]
                                  styleId:[[ale_rs stringForColumn:@"STYLE4_STYLE_ID"] retain]
                                styleName:[[ale_rs stringForColumn:@"STYLE4_STYLE_NAME"] retain]
                            styleKanaName:[[ale_rs stringForColumn:@"STYLE4_STYLE_KANA_NAME"] retain]
                         styleExplanation:[[ale_rs stringForColumn:@"STYLE4_STYLE_EXPLANATION"] retain]];
                if (tmpStylel4.aleStyleNo > 0) {
                    [wkAle.aleStyleList addObject:tmpStylel4];
                }
                
                //Style5
                AleStyle *tmpStylel5 = [[AleStyle alloc] init];
                [tmpStylel5 initParameter:[ale_rs intForColumn:@"STYLE5_STYLE_NO"]
                                  styleId:[[ale_rs stringForColumn:@"STYLE5_STYLE_ID"] retain]
                                styleName:[[ale_rs stringForColumn:@"STYLE5_STYLE_NAME"] retain]
                            styleKanaName:[[ale_rs stringForColumn:@"STYLE5_STYLE_KANA_NAME"] retain]
                         styleExplanation:[[ale_rs stringForColumn:@"STYLE5_STYLE_EXPLANATION"] retain]];
                if (tmpStylel5.aleStyleNo > 0) {
                    [wkAle.aleStyleList addObject:tmpStylel5];
                }
                
                //StyleにAleを追加
                [wkStylel.aleList addObject:wkAle];
            }
            
            [ale_rs close]; 
            
        }
        
        [style_rs close];  
        [db close];
    }

    //AleListを変換
    return wkStyleList;
}

@end

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
        self._writeDbPath = [documentsDirectory stringByAppendingPathComponent:@"Beer.db"];
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
    NSMutableArray * tmpAleList = [[NSMutableArray alloc]init];
    
    FMDatabase* db = [FMDatabase databaseWithPath:self._writeDbPath];
    
    if ([db open]) {
        [db setShouldCacheStatements:YES];
        
        NSMutableString *sql = [NSMutableString string];
        [sql appendString:@" SELECT "];
        [sql appendString:@"        cate.category_id"];
        [sql appendString:@"      , cate.name as category_name"];
        [sql appendString:@"      , cate.explanation as category_explanation"];
        [sql appendString:@"      , com.commodity_id"];
        [sql appendString:@"      , com.name as commodity_name"];
        [sql appendString:@"      , com.kana_name as commodity_kana_name"];
        [sql appendString:@"      , com.explanation as commodity_explanation"];
        [sql appendString:@"      , com.Image as commodity_image"];
        [sql appendString:@"  FROM Commodity com INNER JOIN Category cate"];
        [sql appendString:@"                     ON com.category_ID = cate.Category_ID"];
        [sql appendString:@" Order By"];
        [sql appendString:@"       cate.category_id ASC,com.commodity_id ASC"];
        
        //カテゴリ一覧を生成
        //categoryList = [[NSMutableArray alloc]init];
        
        //sqｌの中身の確認
        //NSLog(@"%@",sql);
        
        // SELECT
        FMResultSet *rs = [db executeQuery:sql];
        
//        int beforeCategoryId = -1;
//        BeerCategory *category;
//        Beer *beer;
//        while ([rs next]) {
//            
//            if (beforeCategoryId != [rs intForColumn:@"Category_id"]) {
//                
//                beforeCategoryId = [rs intForColumn:@"Category_id"];
//                
//                //カテゴリを生成
//                category = [[BeerCategory alloc] init];
//                [category initParameter:[rs intForColumn:@"Category_id"] 
//                                   name:[[rs stringForColumn:@"category_name"] retain]
//                                    exp:[[rs stringForColumn:@"category_explanation"] retain]];
//                
//                //生成したカテゴリを追加
//                [categoryList addObject:category];
//            }
//            
//            //ビールを生成
//            beer = [[Beer alloc]init];
//            [beer initParameter:[rs intForColumn:@"Commodity_id"]
//                           name:[[rs stringForColumn:@"commodity_name"] retain]
//                       kanaName:[[rs stringForColumn:@"commodity_kana_name"] retain]
//                            exp:[[rs stringForColumn:@"commodity_explanation"] retain]
//                            img:[[rs stringForColumn:@"commodity_image"] retain]];
//            
//            
//            //カテゴリにビールを追加
//            [category.beerList addObject:beer];
//            
//        }
        
        [rs close];  
        [db close];
    }
    
    //AleListを変換
    return tmpAleList;
}

@end

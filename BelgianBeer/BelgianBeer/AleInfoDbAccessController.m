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

- (id)init
{
    self = [super init];
    if (self) {
        //--------------------------------------------------------------------
        //DBをiPhone上に
        //--------------------------------------------------------------------
        
        // ファイルがなければプロジェクトフォルダからiPhone Documentフォルダにコピー
        BOOL success;
        NSError *error;	
        NSFileManager *fm = [NSFileManager defaultManager];
        NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"Beer.db"];
        success = [fm fileExistsAtPath:writableDBPath];
        if(!success){
            NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Beer.db"];
            success = [fm copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
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
    return nil;
}

@end

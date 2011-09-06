//
//  MainListNaviController.m
//  BelgianBeer
//
//  Created by Amatsu on 11/09/06.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MainListNaviController.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"

@implementation MainListNaviController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //--------------------------------------------------------------------
    //DBに接続し必要情報を取得
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
    
    //DBのパスをログ出力
    //NSLog(writableDBPath);
    
    // DBに接続
    FMDatabase* db = [FMDatabase databaseWithPath:writableDBPath];
    if ([db open]) {
        [db setShouldCacheStatements:YES];
		
        NSString* sql = @"SELECT cate.name as category_name, com.name as commodity_name FROM Commodity com INNER JOIN Category cate On com.category_ID = cate.Category_ID";
        
        // SELECT
        FMResultSet *rs = [db executeQuery:sql];
        while ([rs next]) {
            NSLog(@"%d %@ %@", [rs intForColumn:@"commodity_id"]
                             , [rs stringForColumn:@"category_name"]
                             , [rs stringForColumn:@"commodity_name"]);
        }
        [rs close];  
        [db close];
    }else{
        NSLog(@"Could not open db.");
    }
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

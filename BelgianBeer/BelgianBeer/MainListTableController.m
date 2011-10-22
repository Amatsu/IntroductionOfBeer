//
//  MainListTableController.m
//  BelgianBeer
//
//  Created by Amatsu on 11/09/06.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MainListTableController.h"
#import "DetailTableViewController.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "BeerCategory.h"
#import "Beer.h"

@implementation MainListTableController

@synthesize beerCell;

#define SECTION_HEIGHT 30   //セクションの高さ
#define ROW_HEIGHT 110       //行の高さ

//カテゴリ一覧
@synthesize categoryList;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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
    
//    //ナビゲーションバーの右側にボタンを表示
//    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:@"Style" style:UIBarButtonItemStylePlain target:nil action:nil];
//    self.navigationItem.rightBarButtonItem = barButton;
//    [barButton release];
    
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
        categoryList = [[NSMutableArray alloc]init];
        
        //sqｌの中身の確認
        //NSLog(@"%@",sql);
        
        // SELECT
        FMResultSet *rs = [db executeQuery:sql];
        
        int beforeCategoryId = -1;
        BeerCategory *category;
        Beer *beer;
        while ([rs next]) {
            
            if (beforeCategoryId != [rs intForColumn:@"Category_id"]) {
                
                beforeCategoryId = [rs intForColumn:@"Category_id"];
                
                //カテゴリを生成
                category = [[BeerCategory alloc] init];
                [category initParameter:[rs intForColumn:@"Category_id"] 
                                   name:[[rs stringForColumn:@"category_name"] retain]
                                    exp:[[rs stringForColumn:@"category_explanation"] retain]];
                
                //生成したカテゴリを追加
                [categoryList addObject:category];
            }
            
            //ビールを生成
            beer = [[Beer alloc]init];
            [beer initParameter:[rs intForColumn:@"Commodity_id"]
                           name:[[rs stringForColumn:@"commodity_name"] retain]
                       kanaName:[[rs stringForColumn:@"commodity_kana_name"] retain]
                            exp:[[rs stringForColumn:@"commodity_explanation"] retain]
                            img:[[rs stringForColumn:@"commodity_image"] retain]];

            
            //カテゴリにビールを追加
            [category.beerList addObject:beer];
            
        }
        
        [rs close];  
        [db close];
    }else{
        NSLog(@"Could not open db.");
    }
    
//    NSLog(@"%d",[[categoryList objectAtIndex:0] categoryID]);
//    NSLog(@"%@",[[categoryList objectAtIndex:0] categoryName]);
//    NSLog(@"%@",[[categoryList objectAtIndex:0] categroyExplanation]);
//    
//    NSLog(@"%@",[[[[categoryList objectAtIndex:0] beerList] objectAtIndex:0] beerName]);
//    NSLog(@"%@",[[[[categoryList objectAtIndex:0] beerList] objectAtIndex:0] beerExplanation]);    

    
 }

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    //セクションの数はカテゴリの数
    return [categoryList count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    //該当セクションの行数はビールの数
    return [[[categoryList objectAtIndex:section] beerList] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return SECTION_HEIGHT;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //cellの高さ
    return ROW_HEIGHT;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //セクション名
    //NSLog(@"%d", [categoryList count]);
    //NSLog(@"CategoryID:::%d",[[categoryList objectAtIndex:0] categoryID]);
    return [NSString stringWithFormat:@"%@",[[categoryList objectAtIndex:section] categoryName]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
	
	static NSString *CellIdentifier = @"BeerCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
    //カスタムセル
    if (cell == nil) {
        
        [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
        
        //名称を設定
        [beerCell setBeerName:[[[[categoryList objectAtIndex:indexPath.section] beerList] objectAtIndex:indexPath.row] beerName]];
        
        //カナ名称を設定
        [beerCell setBeerKanaName:[[[[categoryList objectAtIndex:indexPath.section] beerList] objectAtIndex:indexPath.row] beerKanaName]];
        
        //Style名称を設定
        
        //画像を設定
        [beerCell setBeerImage:[[[[categoryList objectAtIndex:indexPath.section] beerList] objectAtIndex:indexPath.row] beerImage]];
        
        cell = beerCell;
        self.beerCell = nil;
    }
    
	return cell;
}
  

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DetailTableViewController *detailView = [[DetailTableViewController alloc]init];
    
    //詳細Viewを表示する。
    [self.navigationController pushViewController:detailView animated:YES];
    [detailView release];
    
    
    //選択をおこなった行番号が取得できる。
    //番号を元に別のViewをpush（呼び出す）
    

}

@end

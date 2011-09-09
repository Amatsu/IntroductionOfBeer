//
//  MainListTableController.m
//  BelgianBeer
//
//  Created by Amatsu on 11/09/06.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MainListTableController.h"
#import "DetailViewController.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "BeerCategory.h"
#import "Beer.h"

@implementation MainListTableController

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
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
        
        NSString* sql = @"SELECT cate.category_id,cate.name as category_name,cate.explanation as category_explanation,com.commodity_id, com.name as commodity_name,com.explanation as commodity_explanation FROM Commodity com INNER JOIN Category cate On com.category_ID = cate.Category_ID";
        
        //カテゴリ一覧を生成
        categoryList = [[NSMutableArray alloc]init];
        
        // SELECT
        FMResultSet *rs = [db executeQuery:sql];
        
        while ([rs next]) {
            
            //カテゴリを生成
            BeerCategory *category = [[BeerCategory alloc] init];
            [category initParameter:[rs intForColumn:@"Category_id"] 
                               name:[rs stringForColumn:@"category_name"]
                                exp:[rs stringForColumn:@"category_explanation"]];
            
            //ビールを生成
            Beer *beer = [[Beer alloc]init];
            [beer initParameter:[rs intForColumn:@"Commodity_id"]
                           name:[rs stringForColumn:@"commodity_name"]
                            exp:[rs stringForColumn:@"commodity_explanation"]];

            
            //カテゴリにビールを追加
            [category.beerList addObject:beer];
            
            //生成したカテゴリを追加
            [categoryList addObject:category];
            
        }
        
        [rs close];  
        [db close];
    }else{
        NSLog(@"Could not open db.");
    }
    
    NSLog(@"%d",[[categoryList objectAtIndex:0] categoryID]);
    NSLog(@"%@",[[categoryList objectAtIndex:0] categoryName]);
    NSLog(@"%@",[[categoryList objectAtIndex:0] categroyExplanation]);
    
    NSLog(@"%@",[[[[categoryList objectAtIndex:0] beerList] objectAtIndex:0] beerName]);
    NSLog(@"%@",[[[[categoryList objectAtIndex:0] beerList] objectAtIndex:0] beerExplanation]);    

    
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

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //セクション名
    //NSLog(@"%d", [categoryList count]);
    NSLog(@"CategoryID:::%d",[[categoryList objectAtIndex:0] categoryID]);
    return [NSString stringWithFormat:@"%d",[[categoryList objectAtIndex:section] categoryID]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
//    //カテゴリの生成
//    BeerCategory *testCategory = [[[BeerCategory alloc] init]autorelease];
//    [testCategory initParameter:1 name:@"categoryName" exp:@"Exp"];
//    
//    //ビールの生成
//    Beer *testBeer1 = [[[Beer alloc]init]autorelease];
//    [testBeer1 initParameter:1 name:@"asahi" exp:@"オーバル"];
//    Beer *testBeer2 = [[[Beer alloc]init]autorelease];
//    [testBeer2 initParameter:2 name:@"kirin" exp:@"オーバル"];
//    
//    [testCategory.beerList addObject:testBeer1];
//    [testCategory.beerList addObject:testBeer2];
//    
//    NSLog(@"Datacount: %d",[testCategory.beerList count]);
//    
//    for (Beer *beer in testCategory.beerList) {
//        NSLog(@"%@",beer.beerName);   
//    }
//    
//    Beer *tmp = [testCategory.beerList objectAtIndex:0];
    
    for (Beer *beer in [[categoryList objectAtIndex:0] beerList]) {
           NSLog(@"%@",beer.beerName);   
    }
    
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"%d",[[[[categoryList objectAtIndex:indexPath.section] beerList] objectAtIndex:0] commodityID]];
    
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
    
    DetailViewController *detailViewController = [DetailViewController alloc];
    
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
    
    //選択をおこなった行番号が取得できる。
    //番号を元に別のViewをpush（呼び出す）
//    if(indexPath.section == 0){
//        
//    }else if(indexPath.section == 1){
//        
//    }
    
    // Navigation logic may go here. Create and push another view controller.
    /*
     DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"Nib name" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end

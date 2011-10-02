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
	
	// configureCell:cell forIndexPath: sets the text and image for the cell -- the method is factored out as it's also called during minuted-based updates.
	//[self configureCell:cell forIndexPath:indexPath];
    
	return cell;
}


//#define NAME_TAG 1
//#define STAR_TAG 2
//#define IMAGE_TAG 3
//
////左の列位置
//#define LEFT_COLUMN_OFFSET 10.0
//#define LEFT_COLUMN_WIDTH 30.0
//
////中央の列位置
//#define MIDDLE_COLUMN_OFFSET 50.0
//#define MIDDLE_COLUMN_WIDTH 100.0
//
////右の列位置
//#define RIGHT_COLUMN_OFFSET 220.0
//#define RIGHT_COLUMN_WIDTH 80.0
//
////フォントサイズ等々
//#define MAIN_FONT_SIZE 16.0
//#define LABEL_HEIGHT 26.0
//#define IMAGE_SIDE 30.0

//- (UITableViewCell *)tableViewCellWithReuseIdentifier:(NSString *)identifier 
//{
//    
//    /*
//	 Create an instance of UITableViewCell and add tagged subviews for the name, local time, and quarter image of the time zone.
//	 */
//	UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
//    
//	/*
//	 Create labels for the text fields; set the highlight color so that when the cell is selected it changes appropriately.
//     */
//	UILabel *label;
//	CGRect rect;
//    
//    // Create an image view for the quarter image.
//	rect = CGRectMake(LEFT_COLUMN_OFFSET, (ROW_HEIGHT - IMAGE_SIDE) / 2.0, IMAGE_SIDE, IMAGE_SIDE);
//    
//	UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
//	imageView.tag = IMAGE_TAG;
//	[cell.contentView addSubview:imageView];
//	[imageView release];	
//	
//	// Create a label for the time zone name.
//	rect = CGRectMake(MIDDLE_COLUMN_OFFSET, (ROW_HEIGHT - LABEL_HEIGHT) / 2.0, MIDDLE_COLUMN_WIDTH, LABEL_HEIGHT);
//	label = [[UILabel alloc] initWithFrame:rect];
//	label.tag = NAME_TAG;
//	label.font = [UIFont boldSystemFontOfSize:MAIN_FONT_SIZE];
//	label.adjustsFontSizeToFitWidth = YES;
//	[cell.contentView addSubview:label];
//	label.highlightedTextColor = [UIColor whiteColor];
//	[label release];
//	
//	// Create a label for the time.
//	rect = CGRectMake(RIGHT_COLUMN_OFFSET, (ROW_HEIGHT - LABEL_HEIGHT) / 2.0, RIGHT_COLUMN_WIDTH, LABEL_HEIGHT);
//	label = [[UILabel alloc] initWithFrame:rect];
//	label.tag = STAR_TAG;
//	label.font = [UIFont systemFontOfSize:MAIN_FONT_SIZE];
//	label.textAlignment = UITextAlignmentRight;
//	[cell.contentView addSubview:label];
//	label.highlightedTextColor = [UIColor whiteColor];
//	[label release];
//	
//	return cell;
//}
//
//- (void)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
//
//	// Get the time zones for the region for the section
//	UILabel *label;
//	
//	// Set the beer name.
//	label = (UILabel *)[cell viewWithTag:NAME_TAG];
//	label.text = [[[[categoryList objectAtIndex:indexPath.section] beerList] objectAtIndex:indexPath.row] beerName];
//	
//	// Set the Star.
//	label = (UILabel *)[cell viewWithTag:STAR_TAG];
//    label.text = @"☆☆★★★";
//	
//	// Set the image.
//	UIImageView *imageView = (UIImageView *)[cell viewWithTag:IMAGE_TAG];
//	imageView.image = [[[[categoryList objectAtIndex:indexPath.section] beerList] objectAtIndex:indexPath.row] beerImage];
//    
//}    

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

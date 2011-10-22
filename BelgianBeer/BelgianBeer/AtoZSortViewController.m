//
//  AtoZSortViewController.m
//  BelgianBeer
//
//  Created by Amatsu on 11/10/23.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "AtoZSortViewController.h"
#import "DetailTableViewController.h"
#import "Ale.h"
#import "AleStyle.h"

@implementation AtoZSortViewController

@synthesize aleList;
@synthesize aleInfoDbCtrl;
@synthesize beerCell;

#define SECTION_HEIGHT 30   //セクションの高さ
#define ROW_HEIGHT 110       //行の高さ

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
    
    //AtoZ順のリストを取得
    aleList = [aleInfoDbCtrl getAleList_SortByAtoZ];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [aleList count];
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
    return [NSString stringWithFormat:@"A-Z"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
	
	static NSString *CellIdentifier = @"BeerCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
    //カスタムセル
    if (cell == nil) {
        
        [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
        
        //名称を設定
        [beerCell setBeerName:[[aleList objectAtIndex:indexPath.row] aleName]];
        
        //カナ名称を設定
        [beerCell setBeerKanaName:[[aleList objectAtIndex:indexPath.row] aleKanaName]];
        
        //Style名称を設定
        
        //画像を設定
        [beerCell setBeerImage:[[aleList objectAtIndex:indexPath.section] aleMiniImage]];
        
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

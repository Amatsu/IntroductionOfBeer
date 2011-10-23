//
//  DetailTableViewController.m
//  BelgianBeer
//
//  Created by Amatsu on 11/09/11.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DetailTableViewController.h"

@implementation DetailTableViewController

@synthesize dspAle;
@synthesize shareCell;
@synthesize detailBeerCell;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        //境界線をなし
        [[self tableView] setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        //セル選択不可
        [[self tableView] setAllowsSelection:FALSE];
        
        //タイトルを設定
        self.title = NSLocalizedString(@"詳細情報", @"DetailInfoTitle");
        
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
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //cellの高さ
    if (indexPath.row == 0) {
        return 120;
    }else if(indexPath.row == 1) {
        return 100;
    }else if(indexPath.row == 2) {
        return 140;
    };
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    //上から順に 0:詳細情報 1:説明 2:その他
    if (indexPath.row == 0) {
        DetailBeerCell *cell;
        NSString *CellIdentifier = @"DetailBeerCell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        //カスタムセル
        if (cell == nil) {
            [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
            cell = detailBeerCell;
        }
        [cell setAle:dspAle];
        self.detailBeerCell = nil;
        
        return cell;
        
    }else if(indexPath.row == 1){
        
        UITableViewCell *cell;
        NSString *CellIdentifier = @"Cell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        }
        
        CGRect txtViewSize = CGRectMake(0.0, 0.0, 320, 100);
        UITextView *txtView = [[UITextView alloc]initWithFrame:txtViewSize];
        [txtView setEditable:FALSE];
        [txtView setText:self.dspAle.aleExplanation];
        [cell addSubview:txtView];
        
        return cell;
        
        
    }else if(indexPath.row == 2){
        
        ShareCell *cell;
        NSString *CellIdentifier = @"ShareCell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        //カスタムセル
        if (cell == nil) {
            [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
            cell = shareCell;
        }
        [cell setAle:dspAle];
        self.shareCell = nil;
     
        return cell;
    }
    
    return  nil;
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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end

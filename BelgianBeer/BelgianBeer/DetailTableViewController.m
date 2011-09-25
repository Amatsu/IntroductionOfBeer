//
//  DetailTableViewController.m
//  BelgianBeer
//
//  Created by Amatsu on 11/09/11.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DetailTableViewController.h"

@implementation DetailTableViewController

@synthesize shareCell;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        //境界線をなし
        [[self tableView] setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        //セル選択不可
        [[self tableView] setAllowsSelection:FALSE];
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
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //cellの高さ
    return 250;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    CGRect rect;
    
    //上から順に 0:text 1:image 2:other
    
    if (indexPath.row == 0) {
        
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        }
        
        rect = CGRectMake(10, (60-50) / 2.0, 200,200);
        UITextView *textView;
        textView = [[UITextView alloc] initWithFrame:rect];
        textView.font = [UIFont boldSystemFontOfSize:16];
        textView.editable = FALSE;
        textView.scrollEnabled = FALSE;
        [cell.contentView addSubview:textView];
        textView.text = @"Override to support conditional editing of the table view.Override to support conditional editing of the table view.Override to support conditional editing of the table view.Override to support conditional editing of the table view.";
        [textView release];   
        
    }else if(indexPath.row == 1){
        
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        }
        
        rect = CGRectMake(10, (60-50) / 2.0, 200, 200);
        UIImageView *imageView1;
        imageView1 = [[UIImageView alloc] initWithFrame:rect];
        [imageView1 setImage:[[UIImage imageNamed:@"6-12AM.png"] retain]];
        
        rect = CGRectMake(210, (60-50) / 2.0, 200, 200);
        UIImageView *imageView2;
        imageView2 = [[UIImageView alloc] initWithFrame:rect];
        [imageView2 setImage:[[UIImage imageNamed:@"6-12PM.png"] retain]];
        
        rect = CGRectMake(10, (60-50) / 2.0, 200, 200);
        UIScrollView *scrollView;
        scrollView = [[UIScrollView alloc] initWithFrame:rect];
        [scrollView addSubview:imageView1];
        [scrollView addSubview:imageView2];
        scrollView.pagingEnabled = YES;
        scrollView.contentSize = CGSizeMake(200 * 2, scrollView.frame.size.height);
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.backgroundColor = [UIColor blackColor];
        
        
        //セルのViewに追加
        [cell.contentView addSubview:scrollView];
        
        [imageView1 release];
        [imageView2 release];
        [scrollView release];
        
    }else if(indexPath.row == 2){
        //カスタムセル
        if (cell == nil) {
            [[NSBundle mainBundle] loadNibNamed:@"ShareCell" owner:self options:nil];
            cell = shareCell;
            self.shareCell = nil;
        }
        
    }else{
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        }
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

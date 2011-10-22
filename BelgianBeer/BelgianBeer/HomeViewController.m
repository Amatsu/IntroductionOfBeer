//
//  HomeViewController.m
//  BelgianBeer
//
//  Created by Amatsu on 11/10/09.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "HomeViewController.h"
#import "MainListTableController.h"

@implementation HomeViewController

@synthesize aleInfoDbCtrl;

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

//AleListをClick
-(IBAction)showAleList:(id)sender{
    
    MainListTableController *tableViewController = [[MainListTableController alloc] init];
    tableViewController.aleInfoDbCtrl  = aleInfoDbCtrl;
    [self.navigationController pushViewController:tableViewController animated:YES];
    [tableViewController release];
}

-(IBAction)showAlelistStyleSort:(id)sender{
    
    MainListTableController *tableViewController = [[MainListTableController alloc] init];
    tableViewController.aleInfoDbCtrl  = aleInfoDbCtrl;
    [self.navigationController pushViewController:tableViewController animated:YES];
    [tableViewController release];

}

//infoをClick
-(IBAction)showDeveInfo:(id)sender{
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"SoftwereVersion"
                              message:@"Ver1.0 開発：codeJoy" delegate:nil
                              cancelButtonTitle:@"OK" 
                              otherButtonTitles:nil
                              ];
    [alertView show];
    [alertView release];
}



#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //ロード時にDBコントローラを生成
    if (aleInfoDbCtrl == nil){
        aleInfoDbCtrl = [[[AleInfoDbAccessController alloc]init]retain];
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

//
//  AtoZSortViewController.h
//  BelgianBeer
//
//  Created by Amatsu on 11/10/23.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BeerCell.h"
#import "AleInfoDbAccessController.h"

@interface AtoZSortViewController : UITableViewController{
    
    NSMutableArray *aleList;
    AleInfoDbAccessController *aleInfoDbCtrl;
    BeerCell *beerCell;			//	提案用セル
    
}

@property (assign) NSMutableArray *aleList;
@property (assign) AleInfoDbAccessController *aleInfoDbCtrl;
@property (nonatomic, assign) IBOutlet BeerCell *beerCell;

@end

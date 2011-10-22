//
//  MainListTableController.h
//  BelgianBeer
//
//  Created by Amatsu on 11/09/06.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BeerCell.h"
#import "AleInfoDbAccessController.h"

@interface MainListTableController : UITableViewController{
    NSMutableArray *styleList;
    AleInfoDbAccessController *aleInfoDbCtrl;
    
    BeerCell *beerCell;			//	提案用セル
}

@property (assign) NSMutableArray *styleList;
@property (assign) AleInfoDbAccessController *aleInfoDbCtrl;

@property (nonatomic, assign) IBOutlet BeerCell *beerCell;

@end

//
//  MainListTableController.h
//  BelgianBeer
//
//  Created by Amatsu on 11/09/06.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/NSArray.h>
#import "BeerCell.h"

@interface MainListTableController : UITableViewController{
    NSMutableArray *categoryList;
    BeerCell *beerCell;			//	提案用セル
}

@property (readonly) NSMutableArray *categoryList;
@property (nonatomic, assign) IBOutlet BeerCell* beerCell;

//- (UITableViewCell *)tableViewCellWithReuseIdentifier:(NSString *)identifier;
//- (void)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath;

@end

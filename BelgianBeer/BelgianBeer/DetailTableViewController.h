//
//  DetailTableViewController.h
//  BelgianBeer
//
//  Created by Amatsu on 11/09/11.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareCell.h"
#import "DetailBeerCell.h"
#import "Ale.h"
@interface DetailTableViewController : UITableViewController{
    Ale *dspAle;
    ShareCell *shareCell;
    DetailBeerCell *detailBeerCell;
}

@property (assign) Ale *dspAle;
@property (nonatomic, assign) IBOutlet ShareCell* shareCell;
@property (nonatomic, assign) IBOutlet DetailBeerCell* detailBeerCell;

@end

//
//  MainListTableController.h
//  BelgianBeer
//
//  Created by Amatsu on 11/09/06.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/NSArray.h>

@interface MainListTableController : UITableViewController{
    NSMutableArray *categoryList;
}

@property (readonly) NSMutableArray *categoryList;

@end

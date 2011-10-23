//
//  ShareCell.h
//  BelgianBeer
//
//  Created by Amatsu on 11/09/20.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ale.h"
@interface ShareCell : UITableViewCell{
    Ale *dspAle;
    IBOutlet UILabel  *lblRank;
    IBOutlet UIButton *btnShare;
    
}

@property (assign) Ale *dspAle;
@property (nonatomic, assign) UILabel  *lblRank;
@property (nonatomic, assign) UIButton *btnShare;

-(void)setAle:(Ale *)wkAle;

@end

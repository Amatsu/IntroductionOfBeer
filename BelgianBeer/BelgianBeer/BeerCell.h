//
//  BeerCell.h
//  BelgianBeer
//
//  Created by Amatsu on 11/10/02.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ale.h"

@interface BeerCell : UITableViewCell{
    Ale *dspAle;
    IBOutlet UILabel *lblName;
    IBOutlet UILabel *lblKanaName;
    IBOutlet UIImageView *imgAleView;
    IBOutlet UILabel *lblStyleName;
    IBOutlet UILabel *lblRank;
    IBOutlet UILabel *lblState;
}

@property (assign) Ale *dspAle;
@property (nonatomic, assign) UILabel *lblName;
@property (nonatomic, assign) UILabel *lblKanaName;
@property (nonatomic, assign) UIImageView *imgAleView;
@property (nonatomic, assign) UILabel *lblStyleName;
@property (nonatomic, assign) UILabel *lblRank;
@property (nonatomic, assign) UILabel *lblState;

-(void)setAle:(Ale *)wkAle;

@end

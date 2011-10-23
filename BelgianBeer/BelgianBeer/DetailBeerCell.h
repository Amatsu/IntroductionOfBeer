//
//  DetailBeerCell.h
//  BelgianBeer
//
//  Created by Amatsu on 11/10/02.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ale.h"
@interface DetailBeerCell : UITableViewCell{
    Ale *dspAle;
    IBOutlet UILabel *lblName;
    IBOutlet UILabel *lblKanaName;
    IBOutlet UIImageView *imgAleView;
    IBOutlet UILabel *lblStyleName;
}

@property (assign) Ale *dspAle;
@property (nonatomic, assign) UILabel *lblName;
@property (nonatomic, assign) UILabel *lblKanaName;
@property (nonatomic, assign) UIImageView *imgAleView;
@property (nonatomic, assign) UILabel *lblStyleName;

-(void)setAle:(Ale *)wkAle;

@end

//
//  DetailBeerCell.m
//  BelgianBeer
//
//  Created by Amatsu on 11/10/02.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DetailBeerCell.h"
#import "Ale.h"

@implementation DetailBeerCell

@synthesize dspAle;
@synthesize lblName;
@synthesize lblKanaName;
@synthesize lblStyleName;
@synthesize imgAleView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
  

//Aleを設定
-(void)setAle:(Ale *)wkAle{
    self.dspAle = wkAle;
    [self.lblName setText:self.dspAle.aleName];
    [self.lblKanaName setText:self.dspAle.aleKanaName];
    [self.imgAleView setImage:self.dspAle.aleImage];
    [self.lblStyleName setText:@"test"];
}

@end

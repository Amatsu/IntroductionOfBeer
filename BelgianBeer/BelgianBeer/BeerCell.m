//
//  BeerCell.m
//  BelgianBeer
//
//  Created by Amatsu on 11/10/02.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "BeerCell.h"

@implementation BeerCell

//プロパティと同期
@synthesize dspAle;
@synthesize lblName;
@synthesize lblKanaName;
@synthesize imgAleView;
@synthesize lblStyleName;
@synthesize lblRank;
@synthesize lblState;


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
    
    int i;
    NSMutableString *rankStr = [NSMutableString string];
    for (i=0; i<self.dspAle.rank; i++) {
        [rankStr appendString:@"★"];
    }
    [self.lblRank setText:rankStr];
    
    if (self.dspAle.drinkState == 1) {
        [self.lblState setText:@"Complate!"];
    }else{
        [self.lblState setText:@"NoComp..."];
    }
}


@end

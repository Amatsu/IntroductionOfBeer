//
//  DetailBeerCell.m
//  BelgianBeer
//
//  Created by Amatsu on 11/10/02.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DetailBeerCell.h"
#import "Ale.h"
#import "AleStyle.h"

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
    NSMutableString *styelStr = [NSMutableString string];
    for (AleStyle *tmpStyle in self.dspAle.aleStyleList) {
        [styelStr appendString:@", "];
        [styelStr appendString:tmpStyle.aleStyleName];
    }
    [self.lblStyleName setText:[styelStr substringFromIndex:2]];

}

@end

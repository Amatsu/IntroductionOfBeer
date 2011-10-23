//
//  BeerCell.m
//  BelgianBeer
//
//  Created by Amatsu on 11/10/02.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "BeerCell.h"
#import "AleStyle.h"

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
    
    NSMutableString *styelStr = [NSMutableString string];
    for (AleStyle *tmpStyle in self.dspAle.aleStyleList) {
        [styelStr appendString:@", "];
        [styelStr appendString:tmpStyle.aleStyleName];
    }
    [self.lblStyleName setText:[styelStr substringFromIndex:2]];

//    for (i=0; i<self.dspAle.aleStyleList.count-1; i++) {
//        [styelStr appendString:[[self.dspAle.aleStyleList objectAtIndex:i] aleStyleName]];
//    }
    
    int i;
    NSMutableString *rankStr = [NSMutableString string];
    for (i=0; i<self.dspAle.rank; i++) {
        [rankStr appendString:@"★"];
    }
    [self.lblRank setText:rankStr];
    
    if (self.dspAle.rank > 0) {
        [self.lblState setTextColor:[UIColor greenColor]];
        [self.lblState setText:@"✔Complate!"];
    }else{
        [self.lblState setTextColor:[UIColor redColor]];
        [self.lblState setText:@"NoComp..."];
    }
    
    if(self.dspAle.drinkState == 0){
        self.backgroundView.backgroundColor =  [UIColor colorWithRed:0.0 green:0.5 blue:1.0 alpha:1.0];
    }
}


@end

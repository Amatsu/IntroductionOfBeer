//
//  ShareCell.m
//  BelgianBeer
//
//  Created by Amatsu on 11/09/20.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "ShareCell.h"

@implementation ShareCell

@synthesize dspAle;
@synthesize lblRank;
@synthesize btnShare;

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

- (void)dealloc {
    [super dealloc];
}

//Aleを設定
-(void)setAle:(Ale *)wkAle{
    self.dspAle = wkAle;
    
    int i;
    NSMutableString *rankStr = [NSMutableString string];
    for (i=0; i<self.dspAle.rank; i++) {
        [rankStr appendString:@"★"];
    }
    [self.lblRank setText:rankStr];
    
}

@end

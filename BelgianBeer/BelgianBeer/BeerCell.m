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
@synthesize lblName;
@synthesize lblKanaName;
@synthesize imgBeerView;

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

//名称を表示
-(void)setBeerName:(NSString *)name{
    [self.lblName setText:name];
    [self.lblName setFont:[UIFont boldSystemFontOfSize:24.0]];
}

//カナ名称を表示
-(void)setBeerKanaName:(NSString *)name{
    [self.lblKanaName setText:name];
}

//ビールイメージを設定
-(void)setBeerImage:(UIImage *)img{
    [self.imgBeerView setImage:img];
}

@end

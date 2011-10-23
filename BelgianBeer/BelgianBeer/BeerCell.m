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

//名称を表示
-(void)setName:(NSString *)name{
    [self.lblName setText:name];
}

//カナ名称を表示
-(void)setKanaName:(NSString *)name{
    [self.lblKanaName setText:name];
}

//ビールイメージを設定
-(void)setMiniImage:(UIImage *)img{
    [self.imgBeerView setImage:img];
}

//スタイル名称を表示
-(void)setStyleName:(NSString *)name{
    [self.lblStyleName setText:name];
}

//ランクを表示
-(void)setRank:(int)rank{
    int i = rank;
    NSMutableString *rankStr = [NSMutableString string];
    for (i=0; i<rank; i++) {
        [rankStr appendString:@"★"];
    }
    [self.lblRank setText:rankStr];
}

//Stateを表示
-(void)setState:(int)state{
    if (state == 1) {
        [self.lblState setText:@"Complate!"];
    }else{
        [self.lblState setText:@"NoComp..."];
    }
}

@end

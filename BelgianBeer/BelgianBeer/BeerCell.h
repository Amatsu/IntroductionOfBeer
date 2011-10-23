//
//  BeerCell.h
//  BelgianBeer
//
//  Created by Amatsu on 11/10/02.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BeerCell : UITableViewCell{
    IBOutlet UILabel *lblName;
    IBOutlet UILabel *lblKanaName;
    IBOutlet UIImageView *imgBeerView;
    IBOutlet UILabel *lblStyleName;
    IBOutlet UILabel *lblRank;
    IBOutlet UILabel *lblState;
}

@property (nonatomic, assign) UILabel *lblName;
@property (nonatomic, assign) UILabel *lblKanaName;
@property (nonatomic, assign) UIImageView *imgBeerView;
@property (nonatomic, assign) UILabel *lblStyleName;
@property (nonatomic, assign) UILabel *lblRank;
@property (nonatomic, assign) UILabel *lblState;

-(void)setName:(NSString*)name;
-(void)setKanaName:(NSString*)name;
-(void)setMiniImage:(UIImage*)img;
-(void)setStyleName:(NSString*)name;
-(void)setRank:(int)rank;
-(void)setState:(int)state;


@end

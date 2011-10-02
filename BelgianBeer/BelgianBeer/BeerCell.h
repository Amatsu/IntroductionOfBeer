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
}

@property (nonatomic, assign) UILabel *lblName;
@property (nonatomic, assign) UILabel *lblKanaName;
@property (nonatomic, assign) UIImageView *imgBeerView;

-(void)setBeerName:(NSString*)name;
-(void)setBeerKanaName:(NSString*)name;
-(void)setBeerImage:(UIImage*)img;

@end

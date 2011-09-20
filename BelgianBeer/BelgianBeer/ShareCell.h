//
//  ShareCell.h
//  BelgianBeer
//
//  Created by Amatsu on 11/09/20.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareCell : UITableViewCell{
    UILabel*	nameLabel;		//	名前
	UILabel*	voteCountLabel;		//	支持数
}

@property (nonatomic, retain) IBOutlet UILabel*	nameLabel;
@property (nonatomic, retain) IBOutlet UILabel*	voteCountLabel;

@end

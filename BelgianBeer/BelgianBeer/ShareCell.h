//
//  ShareCell.h
//  BelgianBeer
//
//  Created by Amatsu on 11/09/20.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareCell : UITableViewCell{
    
    IBOutlet UIButton *btnShare;
    IBOutlet UIButton *btnCommnet;
    
}

@property (nonatomic, assign) UIButton *btnShare;
@property (nonatomic, assign) UIButton *btnComment;


@end

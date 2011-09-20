//
//  ShareCell.m
//  BelgianBeer
//
//  Created by Amatsu on 11/09/20.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "ShareCell.h"

@implementation ShareCell

@synthesize btnShare;
@synthesize btnComment;

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

@end

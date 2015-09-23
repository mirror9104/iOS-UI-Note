//
//  ActivityCell.m
//  DouBan-Activity
//
//  Created by huchunyuan on 15/9/8.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "ActivityCell.h"

@implementation ActivityCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_titleLabel release];
    [_timeLabel release];
    [_addressLabel release];
    [_categoryLabel release];
    [_wisherLabel release];
    [_participantLabel release];
    [_activityPci release];
    [super dealloc];
}
@end

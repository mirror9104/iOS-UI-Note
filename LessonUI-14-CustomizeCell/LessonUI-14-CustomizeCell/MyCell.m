//
//  MyCell.m
//  LessonUI-14-CustomizeCell
//
//  Created by huchunyuan on 15/8/31.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_picView release];
    [_nameLabel release];
    [_phoneLabel release];
    [super dealloc];
}
@end

//
//  MyCollectionCell.m
//  LessonUI-21-UICollectionView
//
//  Created by huchunyuan on 15/9/14.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "MyCollectionCell.h"

@implementation MyCollectionCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)dealloc {
    [_picImageView release];
    [_textLabel release];
    [super dealloc];
}
@end

//
//  MyCell.m
//  LessonUI-21-UICollectionViewController
//
//  Created by huchunyuan on 15/9/14.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)dealloc {
    [_imageView release];
    [super dealloc];
}
@end

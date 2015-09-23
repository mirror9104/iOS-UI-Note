//
//  label.m
//  LessonUI-04-TouchEvent
//
//  Created by huchunyuan on 15/8/18.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "label.h"

@implementation label

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
    }
    return self;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"被点击了");
}

@end

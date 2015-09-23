//
//  TouchView.m
//  LessonUI-05-Delegate
//
//  Created by huchunyuan on 15/8/19.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    // 让代理 执行代理中的方法
    [_delegate touchViewDidTouchBegan:self];
}

@end

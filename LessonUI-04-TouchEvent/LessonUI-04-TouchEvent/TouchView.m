//
//  TouchView.m
//  LessonUI-04-TouchEvent
//
//  Created by huchunyuan on 15/8/18.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "TouchView.h"

@interface TouchView ()
@property (nonatomic,assign)CGPoint touchPosition; // 手指的位置

@end

@implementation TouchView

// iOS 中主要包括三种事件:触摸事件,晃动事件,远程控制事件.
// 触摸事件:用户使用,触摸设备硬件发生的事件对象
// 对于我们的UIView控件,都是可以对触摸事件进行响应 之前之所以没有响应是因为 我们没有实现touchsBegan touchesMove touchesEnded  TouchesCancel

// 开始触摸 当手指开始触摸屏幕时触发
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"啊~!");
//    // 改变颜色
//    [self changeColorOfSelf];
//    // 改变位置
//    [self changeBounds];
    // 获取手指
    UITouch *touch = [touches anyObject];
    // 获取手指在试图上的位置
    self.touchPosition = [touch locationInView:self];
//     self.center = [[[event allTouches] anyObject] locationInView:self];
}
// 移动触摸 当手在屏幕上滑动时 触发
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"好舒服啊");
//    [self changePositionWithEvent:event];
   
//    [self changeColorOfSelf];
//    [self changeBounds];
//     获取手指
    UITouch *touch = [touches anyObject];
    // 获取手指在视图上的位置
    CGPoint position = [touch locationInView:self];
    // 获取水平方向 和 竖直方向的差额
    CGFloat x = position.x - _touchPosition.x;
    CGFloat y = position.y - _touchPosition.y;
    // 移动视图
    self.center = CGPointMake(self.center.x + x, self.center.y + y);
    
    
}
// 结束触摸 当手指离开屏幕时触发
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"不要停");
}
// 取消触摸 当手指仍然在屏幕上还未离开 此时应用程序进入后台 (电话打入)
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"我还要");
}
// 改变颜色
- (void)changeColorOfSelf{
    self.backgroundColor = [UIColor colorWithRed:arc4random() %266/255.0 green:arc4random() %266/255.0 blue:arc4random() %266/255.0 alpha:1.0];
//    self.superview.backgroundColor = [UIColor colorWithRed:arc4random() %266/255.0 green:arc4random() %266/255.0 blue:arc4random() %266/255.0 alpha:1.0];
}
- (void)changePositionWithEvent:(UIEvent *)event{
//    self.center = [[[event allTouches] anyObject] locationInView:self];
}
- (void)changeBounds{
//    self.bounds = CGRectMake(0, 0, arc4random()%(200-10+1)+10, arc4random()%(200-10+1)+10);
}
@end

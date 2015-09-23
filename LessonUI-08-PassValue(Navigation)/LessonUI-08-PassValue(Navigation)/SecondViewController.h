//
//  SecondViewController.h
//  LessonUI-08-PassValue(Navigation)
//
//  Created by huchunyuan on 15/8/24.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import <UIKit/UIKit.h>
// 界面传值
// 场景一 : 从前往后传值 A->B
// 方法:属性传值
// 步骤:1.在B中声明对应的属性
//     2.在A中push的方法中将 值传给B的属性
//     3.在B中 使用属性进行操作
// 场景二: 从后忘前传值 B --> A
// 方法:代理窜至
// 步骤:1.在B中声明协议 声明代理
//     2.在B将要消失的时候 通知代理 执行协议中的方法 将对应的值拿走
//     3.在A中找到B对象,并把A设置为B的代理 服从协议
//     4.在A中实现协议中的方法 获取代理传来的对应的值

// 一共有6种传值 单利传值 通知传值 targetAction传值 block传值
@protocol SendDelegate <NSObject>
// 通知 第一个界面执行方法 并讲字符串拿走
- (void)StringToFirst:(NSString *)str;
@end
@interface SecondViewController : UIViewController
@property (nonatomic,copy)NSString *tfStr;// 用来接收字符串
@property (nonatomic,assign)id<SendDelegate>delegate;// 声明服从协议的代理
@end

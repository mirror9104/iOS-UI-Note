//
//  AppDelegate.m
//  LessonUI-02-UITextFildAndUIButton
//
//  Created by huchunyuan on 15/8/14.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize MOVED;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
#pragma mark - UITextFiled : 是iOS中可以输入的控件,也就是输入框 主要进行文字的输入控制和显示 和UILabel相比,仅仅多的是文字的输入功能 在使用上和UILabel没有区别
//    // 1.创建对象
//    UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 275, 50)];
//    // 2.配置属性
//    tf.backgroundColor = [UIColor whiteColor];
//// 文字显示
//    // a.显示内容
//    tf.text = @"Duang~Duang~!";
//    // b.设置文字颜色
//    tf.textColor = [UIColor redColor];
//    // c.设置文字的对其方式
//    tf.textAlignment = NSTextAlignmentCenter;
//    // d.字体
//    tf.font = [UIFont systemFontOfSize:20];
//    // e.设置占位提示符
//    tf.placeholder = @"请输入你的发质为什么这么好?";
//// 输入的控制
//    // a.设置是否可以输入 (可以控制输入框 输入的时机)
//    tf.enabled = YES; // NO不能输入 默认为YES
//    // b.设置 当开始编辑时 是否进行清空
//    tf.clearsOnBeginEditing = YES;
//    // c.设置键盘风格
//    tf.keyboardType = UIKeyboardTypeNamePhonePad;
//    // d.设置return 风格
//    tf.returnKeyType = UIReturnKeySearch;
//    // e.设置安全模式(密码模式)
//    tf.secureTextEntry = YES;
//    // f.设置 输入弹出视图(默认 是键盘)
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 300)];
//    view.backgroundColor = [UIColor redColor];
//    tf.inputView = view;
//    // g.设置辅助 输入视图
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 375, 40)];
//    label.text = @"🐱🐶🐭🐘🐱🐶🐭🐘🐱🐶🐭🐘🐱🐶🐭🐘🐱🐶🐭🐘🐱🐶🐭🐘";
//    tf.inputAccessoryView = label;
//// 外观 控制
//    // a.设置输入框设置
//    tf.borderStyle = UITextBorderStyleRoundedRect;
//    // b.设置清除 按钮的模式
//    tf.clearButtonMode = UITextFieldViewModeAlways;
//    // c.左视图
//    UILabel *nameLabel = [[UILabel alloc ]initWithFrame:CGRectMake(0, 0, 75, 50)];
//    nameLabel.text = @"用户名:";
//    nameLabel.textAlignment = NSTextAlignmentCenter;
//    nameLabel.shadowColor = [UIColor whiteColor];
//    nameLabel.shadowOffset = CGSizeMake(2, 2);
//    nameLabel.textColor = [UIColor blackColor];
//    nameLabel.backgroundColor = [UIColor colorWithRed:76/255.0 green:98/255.0 blue:124/255.0 alpha:0.8];
//    tf.leftView = nameLabel;
//    tf.leftViewMode = UITextFieldViewModeAlways;
//    // 3.添加父视图
//    [self.window addSubview:tf];
//    
//    // 4.释放所有权
//    [tf release];
    
#pragma mark - UIButton : 是ios中用于响应用户点击事件的控件,他和UILabel类似 只不过多的是事件的处理功能 在使用上和UILabel 差别不大
    // 1.创建控件对象
    // 如果是SyStem 前景图片会显示色块,custom不会显示图片
    UIButton *bt = [UIButton buttonWithType:(UIButtonTypeCustom)];
    // 2.配置属性
    bt.frame = CGRectMake(100, 300, 150, 100);
//    bt.backgroundColor = [UIColor redColor];
    // (1)title
//    // 正常状态下 title的设置
//    [bt setTitle:@"登陆" forState:UIControlStateNormal];
//    // 高亮状态下 title的设置
//    [bt setTitle:@"登陆中..." forState:UIControlStateHighlighted];
    // (2)添加点击事件
    [bt addTarget:self action:@selector(btAction:) forControlEvents:UIControlEventTouchUpInside];
    [bt addTarget:self action:@selector(btAction2:) forControlEvents:UIControlEventTouchDown];
    // (3)移除点击事件
//    [bt removeTarget:self action:@selector(btAction2:) forControlEvents:UIControlEventTouchDown];
    // (4)设置title的颜色
    [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bt setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    // (5)设置阴影颜色
    [bt setTitleShadowColor:[UIColor blackColor] forState:UIControlStateNormal];
    // (6)设置背景图片
    [bt setBackgroundImage:[UIImage imageNamed:@"bt2"] forState:UIControlStateNormal];
    [bt setBackgroundImage:[UIImage imageNamed:@"bt"] forState:UIControlStateHighlighted];
    // (7)设置前景图片
    [bt setImage:[UIImage imageNamed:@"01"] forState:UIControlStateNormal];
    [bt setImage:[UIImage imageNamed:@"02"] forState:UIControlStateHighlighted];
    
    // 3.添加父视图
    [self.window addSubview:bt];
    [self drawCurve];
    return YES;
}
// 点击事件
- (void)btAction:(UIButton *)bt{
    if (MOVED) {
        
        NSLog(@"upInside");
        // 获取正常状态下的title
        NSLog(@"tittle = %@",[bt titleForState:UIControlStateNormal]);
        // 获取高亮状态下的title
        NSLog(@"hightTitle = %@",[bt titleForState:UIControlStateHighlighted]);
    }
    else{
        
        NSLog(@"inside取消了");
    }
}
// 点击时间2
- (void)btAction2:(UIButton *)btn{
    MOVED = NO;
    NSLog(@"down");
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
// 绘制曲线
- (void)drawCurve {
    
    // 获取当前图形，视图推入堆栈的图形，相当于你所要绘制图形的图纸
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 创建一个新的空图形路径。
    CGContextBeginPath(ctx);
    
    /**
     *  @brief 在指定点开始一个新的子路径 参数按顺序说明
     *
     *  @param c 当前图形
     *  @param x 指定点的x坐标值
     *  @param y 指定点的y坐标值
     *
     */
    CGContextMoveToPoint(ctx, 160, 100);
    
    /**
     *  @brief 在指定点追加二次贝塞尔曲线，通过控制点和结束点指定曲线。
     *         关于曲线的点的控制见下图说明，图片来源苹果官方网站。参数按顺序说明
     *  @param c   当前图形
     *  @param cpx 曲线控制点的x坐标
     *  @param cpy 曲线控制点的y坐标
     *  @param x   指定点的x坐标值
     *  @param y   指定点的y坐标值
     *
     */
    CGContextAddQuadCurveToPoint(ctx, 160, 50, 190, 50);
    
    // 设置图形的线宽
    CGContextSetLineWidth(ctx, 20);
    
    // 设置图形描边颜色
    CGContextSetStrokeColorWithColor(ctx, [UIColor brownColor].CGColor);
    
    // 根据当前路径，宽度及颜色绘制线
    CGContextStrokePath(ctx);
}

@end

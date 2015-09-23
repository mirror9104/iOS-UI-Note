//
//  SingoleClass.h
//  LessonUI-12-PresssentViewController Modal
//
//  Created by huchunyuan on 15/8/28.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingoleClass : NSObject
/** 创建单利的方法:类方法 返回值为当前的类类型 方法名 一般以share,standmain开头 +当前类名 */
+ (SingoleClass *)shareSingleClass;
@property (nonatomic,retain)UIImage *image;
@end

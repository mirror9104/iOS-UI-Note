//
//  SingoleClass.m
//  LessonUI-12-PresssentViewController Modal
//
//  Created by huchunyuan on 15/8/28.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "SingoleClass.h"
static SingoleClass *singleClass = nil;
@implementation SingoleClass
/** 创建单利的方法:类方法 返回值为当前的类类型 方法名 一般以share,standmain开头 +当前类名 */
+ (SingoleClass *)shareSingleClass{
    // 同步锁
    @synchronized(self){
        if (singleClass == nil) {
            // 如果为空 就创建对象
            singleClass = [[SingoleClass alloc] init];
            
        }
    }
    return singleClass;
}

@end

//
//  DatabaseHandle.h
//  LessonUI-20-DataBase
//
//  Created by huchunyuan on 15/9/10.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface DatabaseHandle : NSObject
// 数据库操作类 只是为我们提供两个功能:打开数据库和关闭数据库
// 想要使用sqlite需要进行两部操作:
// 1.导入动态链接库libsqlite3.0.dylib
// 2.导入头文件<sqlite3.h>

// 打开数据库
+ (sqlite3 *)openDataBase;

// 关闭数据库
+ (void)closeDataBase;


@end

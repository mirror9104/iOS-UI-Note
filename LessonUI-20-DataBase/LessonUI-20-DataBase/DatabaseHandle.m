//
//  DatabaseHandle.m
//  LessonUI-20-DataBase
//
//  Created by huchunyuan on 15/9/10.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "DatabaseHandle.h"
// 定义静态指针
static sqlite3 *sqlite = nil;

@implementation DatabaseHandle
// 对于应用程序来说,一个数据库 足以

// 打开数据库
+ (sqlite3 *)openDataBase{
    // @sunchronized 同步锁
    if (sqlite) {
        return sqlite;
    }
    // 获取documents 文件路径
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSLog(@"%@",documentsPath);
    
    // 文件拼接
    NSString *dbPath = [documentsPath stringByAppendingPathComponent:@"DB.sqlite"];
    
    // 打开数据库 char*c语言字符串要转换 会有返回值 用int接受
    // 通过路径查询到文件 如果文件存在,打开 如果不存在 先进行创建,再打开
    int result = sqlite3_open([dbPath UTF8String], &sqlite);
    
    if (result == SQLITE_OK) {
        NSLog(@"打开数据库操作");
        
        // 创建表单
        // 创建SQL语句
        NSString *sql = @"CREATE TABLE Student (stu_ID INTEGER PRIMARY KEY NOT NULL,name TEXT NOT NULL,sex TEXT NOT NULL,age INTEGER NOT NULL DEFAULT 1000,score FLOAT NOT NULL)";
        // 执行sql语句
        sqlite3_exec(sqlite, [sql UTF8String], NULL, NULL, NULL);
        
    }
    return sqlite;
}

// 关闭数据库
+ (void)closeDataBase{
    
    int result = sqlite3_close(sqlite);
    if (result == SQLITE_OK) {
        sqlite = nil;
    }
}
@end

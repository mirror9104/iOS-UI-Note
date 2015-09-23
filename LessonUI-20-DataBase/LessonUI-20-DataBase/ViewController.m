//
//  ViewController.m
//  LessonUI-20-DataBase
//
//  Created by huchunyuan on 15/9/10.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "ViewController.h"
#import "DatabaseHandle.h"

@interface ViewController ()
@property (retain, nonatomic) IBOutlet UITextField *numberTF;
@property (retain, nonatomic) IBOutlet UITextField *scroceTF;
@property (retain, nonatomic) IBOutlet UITextField *nameTF;
@property (retain, nonatomic) IBOutlet UITextField *sexTF;
@property (retain, nonatomic) IBOutlet UITextField *ageTF;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)insertAction:(id)sender {
    // 1.打开数据库
    sqlite3 *db = [DatabaseHandle openDataBase];
    
    // 2.创建指令集(伴随指针)
    sqlite3_stmt *stmt = nil;
    
    // 3.创建sql语句
     NSString *sql = @"INSERT INTO Student(name,sex,age,score) VALUES (?,?,?,?)";
    
    // 4.语法检查
    /**
     sqlite3 *db  // 数据库指针
     
     const char *zSql // C语言SQL语句
     
     int nByte // 长度 所占字节数 一般给-1 代表不限制长度 表示无穷大
     
     sqlite3_stmt **ppStmt // 伴随指针的地址 存放sql语句和数据库地址信息
     
     const char **pzTail 预留参数
     
     语法检查的作用:不会执行sql语句,只是检查数据库是否正确打开,sql语句是否正确 如果正确,将数据库的信息和sql语句的信息 放入伴随指针stmt中
     
     v2代表可以追溯到高版本和旧版本 不带为当前版本
     */
    int flag = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, nil);
    
    // 5.检查语法是否正确
    if (flag == SQLITE_OK) {
        
        // 6.参数banding
        sqlite3_bind_text(stmt, 1, [_nameTF.text UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 2, [_sexTF.text UTF8String], -1, nil);
        sqlite3_bind_int(stmt, 3, [_ageTF.text intValue]);
        sqlite3_bind_double(stmt, 4, [_scroceTF.text doubleValue]);
        
        // 7.执行
        sqlite3_step(stmt);
        
    }
    
    // 8.释放所有权
    sqlite3_finalize(stmt);
    
    // 9.关闭数据库
    [DatabaseHandle closeDataBase];
}

// 查询
- (IBAction)selectAction:(id)sender {
    
    // 1.打开数据库
    sqlite3 *sqlite = [DatabaseHandle openDataBase];
    
    // 2.创建指令集
    sqlite3_stmt *stmt = nil;
    
    // 3.创建sql语句
    
    NSString *sql = @"SELECT *FROM Student WHERE stu_ID = ?";
    
    // 4.语法检查
    int flag = sqlite3_prepare_v2(sqlite, [sql UTF8String], -1, &stmt, nil);
    
    // 5. 判断语法检查 是否正确
    if (flag == SQLITE_OK) {
        // 6.参数绑定
        sqlite3_bind_int(stmt, 1, [_numberTF.text intValue]);
        
        // 7.执行
        // 对于sqlite3_step() 在查询时,可能会多个符合条件的数据条 当查询完一条数据时,sqlite3_step() 会往下看有没有下一条数据,如果有 返回SQLITE_ROW , 如果没有返回 SQLITE_DONE
        // 所以,我们在进行查询时 以sqlite3_step() 是否等于SQLITE_ROW作为循环获取数据的条件
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            
            // 获取数据
            char *nameC = (char *)sqlite3_column_text(stmt, 1);
            char *sexC = (char *)sqlite3_column_text(stmt, 2);
            int ageC = sqlite3_column_int(stmt, 3);
            double scoreC = sqlite3_column_double(stmt,4);
            
            // 转化为OC中的类型
            NSString *name = [NSString stringWithUTF8String:nameC];
            NSString *sex = [NSString stringWithUTF8String:sexC];
            NSString *age = [NSString stringWithFormat:@"%d",ageC];
            NSString *score = [NSString stringWithFormat:@"%f",scoreC];
            
            _nameTF.text = name;
            _sexTF.text = sex;
            _ageTF.text = age;
            _scroceTF.text = score;
    
            
        }
    }
    
    // 8.释放所有权
    sqlite3_finalize(stmt);
    
    // 9.关闭数据库
    [DatabaseHandle closeDataBase];
                                   
                                   
}
- (IBAction)updataAction:(id)sender {
    
    // 1.打开数据库
    sqlite3 *db = [DatabaseHandle openDataBase];
    
    // 2.创建指令集
    sqlite3_stmt *stmt = nil;
    
    // 3.创建sql语句
    NSString *sql = @"UPDATE Student SET sex = ? WHERE name = ?";

    // 4.语法检查
    int flag = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, nil);
    
    // 5.判断语法检查是否正确
    if (flag == SQLITE_OK) {
        
        // 6.绑定参数
        sqlite3_bind_text(stmt, 2, [_nameTF.text UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 1, [_sexTF.text UTF8String], -1, nil);
        
        // 7.执行
        sqlite3_step(stmt);
        
        
    }
    // 8.释放所有权
    sqlite3_finalize(stmt);
    
    // 9.关闭数据库
    [DatabaseHandle closeDataBase];
    
}
- (IBAction)deleteAction:(id)sender {
    // 1.打开数据库
    sqlite3 *db = [DatabaseHandle openDataBase];
    
    // 2.创建指令集
    sqlite3_stmt *stmt = nil;
    
    // 3.创建SQL语句
    NSString *sql = @"DELETE FROM Student WHERE Stu_ID = ?";
    
    // 4.检查语法
    int flag = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, nil);
    
    // 5.检查是否成功
    if (flag == SQLITE_OK) {
        
        // 6.绑定参数
        sqlite3_bind_text(stmt, 1, [_numberTF.text UTF8String], -1, nil);
        
        // 7.执行
        sqlite3_step(stmt);
    }
    
    // 8.释放所有权
    sqlite3_finalize(stmt);
    
    // 9.关闭数据库
    [DatabaseHandle closeDataBase];
    
}

- (void)dealloc {
    [_numberTF release];
    [_scroceTF release];
    [_nameTF release];
    [_sexTF release];
    [_ageTF release];
    [super dealloc];
}
@end

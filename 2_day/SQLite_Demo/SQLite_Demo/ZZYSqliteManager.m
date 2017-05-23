//
//  ZZYSqliteManager.m
//  SQLite_Demo
//
//  Created by 张正雨 on 2017/5/23.
//  Copyright © 2017年 张正雨. All rights reserved.
//

#import "ZZYSqliteManager.h"
#import <sqlite3.h>
#import <UIKit/UIKit.h>
@interface ZZYSqliteManager (){
    sqlite3 *db;
}

@end

@implementation ZZYSqliteManager
+ (ZZYSqliteManager *)sharedManager{
    static ZZYSqliteManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ZZYSqliteManager alloc]init];
    });
    return manager;
}

- (void)open{
    //存放路径
    NSString *docmentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    //sqlite路径
    NSString *sqlitePath = [docmentPath stringByAppendingString:@"database.sqlite"];
    //打开数据库
    int result = sqlite3_open(sqlitePath.UTF8String, &db);
    //判断是否打开成功
    if (result == SQLITE_OK) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"数据库打开成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"数据库打开失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)close{
    int result = sqlite3_close(db);
    if (result == SQLITE_OK) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"数据库关闭成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"数据库关闭失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)create{
    //sql语句
    NSString *sqlString = @"create table Person (id integer primary key,name text,age integer)";
    
    char *errmsg = nil;
    sqlite3_exec(db, sqlString.UTF8String, nil, nil, &errmsg);
    //判断是否出现错误
    if (errmsg == nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"创建成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"创建失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)insert{
    //sql语句
    NSString *sqlString = @"insert into Person ('name','age') values ('张三',18)";
    
    char *error = nil;
    sqlite3_exec(db, sqlString.UTF8String, nil, nil, &error);
    if (error == nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"插入数据成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"插入数据失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)update{
    //sql语句
    NSString *sqlString = @"update Person set 'name' = '李四' where id = 1";
    char *error = nil;
    sqlite3_exec(db, sqlString.UTF8String, nil, nil, &error);
    if (error == nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"更新数据成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"更新数据失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)deleteData{
    NSString *sqlString = @"delete from Person where id = 1";
    char *error = nil;
    sqlite3_exec(db, sqlString.UTF8String, nil, nil, &error);
    if (error == nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"删除数据成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"删除数据失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)select{
    NSString *sqlString = @"select * from Person";
    
    //准备sql语句
    sqlite3_stmt *stmt = nil;
    sqlite3_prepare(db, sqlString.UTF8String, -1, &stmt, nil);
    
    //单步执行
    while (sqlite3_step(stmt) == SQLITE_ROW) {
        int ID = sqlite3_column_int(stmt, 0);
        const unsigned char *name = sqlite3_column_text(stmt, 1);
        NSString *nameString = [NSString stringWithUTF8String:name];
        int age = sqlite3_column_int(stmt, 2);
        NSLog(@"id:%d, name:%@, age:%d",ID,nameString,age);
    }
    
    //释放
    sqlite3_finalize(stmt);
    
//    char *error = nil;
//    sqlite3_exec(db, sqlString.UTF8String, nil, nil, &error);
//    if (error == nil) {
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"查询数据成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//        [alert show];
//    }else{
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"查询数据失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//        [alert show];
//    }
}
@end

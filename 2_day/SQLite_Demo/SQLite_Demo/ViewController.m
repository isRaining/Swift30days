//
//  ViewController.m
//  SQLite_Demo
//
//  Created by 张正雨 on 2017/5/23.
//  Copyright © 2017年 张正雨. All rights reserved.
//

#import "ViewController.h"
#import "ZZYSqliteManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //数据持久化的方式
    //1、文件读写（NSString ，NSArray,NSDictionary,NSData）
    //2、归档
    //3、NSUserDefaults
    //4、SQLite 数据库
    
    //在iOS中实现sqllite数据库的操作
    //1、导入框架  libsqlite3.0.tbd
    //2、倒入头文件  <sqlite3.h>
    
}

- (IBAction)openDataBase:(id)sender {
    [[ZZYSqliteManager sharedManager]open];
}

- (IBAction)createTable:(id)sender {
    [[ZZYSqliteManager sharedManager]create];
}

- (IBAction)insertData:(id)sender {
    [[ZZYSqliteManager sharedManager]insert];
}

- (IBAction)updateData:(id)sender {
    [[ZZYSqliteManager sharedManager]update];
}

- (IBAction)selectData:(id)sender {
    [[ZZYSqliteManager sharedManager]select];
}

- (IBAction)deletaData:(id)sender {
    [[ZZYSqliteManager sharedManager]deleteData];
}
- (IBAction)closeDataBase:(id)sender {
    [[ZZYSqliteManager sharedManager]close];
}

@end

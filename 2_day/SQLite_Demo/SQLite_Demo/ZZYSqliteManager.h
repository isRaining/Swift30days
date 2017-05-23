//
//  ZZYSqliteManager.h
//  SQLite_Demo
//
//  Created by 张正雨 on 2017/5/23.
//  Copyright © 2017年 张正雨. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZYSqliteManager : NSObject
/**
 单例
 @return sqlite操作对象
 */
+ (ZZYSqliteManager *)sharedManager;


/**
 打开数据库
 */
- (void)open;


/**
 关闭数据库
 */
- (void)close;


/**
 创建表
 */
- (void)create;


/**
 插入数据
 */
- (void)insert;


/**
 更新数据
 */
- (void)update;

//查询数据
- (void)select;


/**
 删除数据
 */
- (void)deleteData;
@end

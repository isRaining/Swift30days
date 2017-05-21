//
//  ViewController.m
//  GCD
//
//  Created by 张正雨 on 2017/5/21.
//  Copyright © 2017年 张正雨. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self concurrentSync];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //创建并发队列
    dispatch_queue_t queue = dispatch_queue_create("muQueue", DISPATCH_QUEUE_CONCURRENT);
    //在队列里面添加任务
    //同步任务
    dispatch_sync(queue, ^{
        for (int i = 0 ; i < 5; i++) {
            NSLog(@"---1---%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0 ; i < 5; i++) {
            NSLog(@"---2---%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0 ; i < 5; i++) {
            NSLog(@"---3---%@",[NSThread currentThread]);
        }
    });
}
/**
 并发队列 + 同步任务：没有开启新的线程，任务是逐个执行的
 */
- (void)concurrentSync{
    //创建并发队列
    dispatch_queue_t queue = dispatch_queue_create("muQueue", DISPATCH_QUEUE_CONCURRENT);
    //在队列里面添加任务
    //同步任务
    dispatch_sync(queue, ^{
        for (int i = 0 ; i < 5; i++) {
            NSLog(@"---1---%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0 ; i < 5; i++) {
            NSLog(@"---2---%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0 ; i < 5; i++) {
            NSLog(@"---3---%@",[NSThread currentThread]);
        }
    });
}


@end

//
//  ViewController.m
//  NSOperation挂起与取消
//
//  Created by 张正雨 on 2017/5/22.
//  Copyright © 2017年 张正雨. All rights reserved.
//

#import "ViewController.h"
#import "CustomOperation.h"
@interface ViewController ()
@property (nonatomic,strong) NSOperationQueue *queue;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self custom];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self suspendAndCancel];
}
//自定义任务
- (void)custom{
    CustomOperation *cp = [[CustomOperation alloc]init];
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [queue addOperation:cp];
    self.queue = queue;
}
//  最大并发数量
- (void)concurrentCount{
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    queue.maxConcurrentOperationCount = 2;
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i< 5000; i++) {
            NSLog(@"----1---%@",[NSThread currentThread]);
        }
    }];
    [queue addOperation:op];
    
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i< 5000; i++) {
            NSLog(@"----2---%@",[NSThread currentThread]);
        }
    }];
    [queue addOperation:op1];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i< 5000; i++) {
            NSLog(@"----3---%@",[NSThread currentThread]);
        }
    }];
    [queue addOperation:op2];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i< 5000; i++) {
            NSLog(@"----4---%@",[NSThread currentThread]);
        }
    }];
    [queue addOperation:op3];
    
    self.queue = queue;
}
//挂起与取消
- (void)suspendAndCancel{
    //挂起
//    if (self.queue.suspended) {
//        self.queue.suspended = NO;
//    }else{
//        self.queue.suspended = YES;
//    }
    [self.queue cancelAllOperations];
}
@end

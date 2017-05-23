//
//  ViewController.m
//  NSOperation_Basic
//
//  Created by 张正雨 on 2017/5/22.
//  Copyright © 2017年 张正雨. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //创建队列  (默认创建的是并行队列)
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    //GCD队列形式
    // 1、全局  2、主队列  3、串行队列（自己创建）   4、并行队列（自己创建）
    // NSOperationQueue队列形式
    // 1、主队列   2、自己创建的
    
    //创建任务
    NSInvocationOperation *op = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(operation) object:nil];
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(operation1) object:nil];
    //将任务放置在队列中  默认调用 start
    [queue addOperation:op];
    [queue addOperation:op1];
    
    [[NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"---3---%@",[NSThread currentThread]);
    }] start];
}
- (void)operation{
    NSLog(@"---1---%@",[NSThread currentThread]);
}
- (void)operation1{
    NSLog(@"---2---%@",[NSThread currentThread]);
}
- (void)operation2{
    NSLog(@"---3---%@",[NSThread currentThread]);
}
@end

//
//  ViewController.m
//  模拟耗时操作
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
}

- (IBAction)buttonClick:(id)sender {
    //耗时操作
//    for (NSInteger i=0; i<1000000; i++) {
//        NSLog(@"--%d--",i);
//    }
    [self creatThread3];
}

- (void)creatThread1{
    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(run:) object:@"abc"];
    thread.name = @"for";
    //启动线程
    [thread start];
}
- (void)creatThread2{
//    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(run:) object:@"abc"];
//    thread.name = @"for";
//    //启动线程
//    [thread start];
    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@"miss"];
}
- (void)creatThread3{
    //开启了一个后台线程(子线程)
    [self performSelectorInBackground:@selector(run:) withObject:@"backgorund"];
}
- (void)run:(id)obj{
    NSLog(@"----run---\n%@\n%@",[NSThread currentThread],obj);
    //耗时操作
    for (NSInteger i=0; i<1000000; i++) {
        NSLog(@"--%d--",i);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

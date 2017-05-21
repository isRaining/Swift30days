//
//  ViewController.m
//  线程安全
//
//  Created by 张正雨 on 2017/5/21.
//  Copyright © 2017年 张正雨. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) NSThread *th1;
@property (nonatomic,strong) NSThread *th2;
@property (nonatomic,strong) NSThread *th3;

@property (nonatomic,assign) NSInteger tickets;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tickets = 1000;
    self.th1 = [[NSThread alloc]initWithTarget:self selector:@selector(sellTickets) object:@""];
    self.th1.name = @"张三";
    self.th2 = [[NSThread alloc]initWithTarget:self selector:@selector(sellTickets) object:@""];
    self.th2.name = @"李四";
    self.th3 = [[NSThread alloc]initWithTarget:self selector:@selector(sellTickets) object:@""];
    self.th3.name = @"王五";
}

- (void)sellTickets{
    while (self.tickets > 0) {
        //token 锁对象  锁对象是同一个，是唯一的
//        @synchronized (self) {
            NSInteger currentTickets = self.tickets;
            if (currentTickets > 0) {
                NSLog(@"%@卖了一张票,还剩%ld张票\n",[NSThread currentThread].name,--self.tickets);
            }else{
                NSLog(@"卖完了");
            }
//        }
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.th1 start];
    [self.th2 start];
    [self.th3 start];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

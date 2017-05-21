//
//  ViewController.m
//  线程状态的膜
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@"abc"];
}
- (void)run:(id)obj{
    NSLog(@"---run---\n%@\n%@",[NSThread currentThread],obj);
    
    [NSThread sleepForTimeInterval:2];
    
    NSLog(@"再次执行");
    
    NSLog(@"%@",[NSDate distantFuture]);
    
    //强制退出线程
    for (int i = 0 ; i < 100000; i++) {
        if (i == 199) {
            NSLog(@"线程退出");
            [NSThread exit];
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

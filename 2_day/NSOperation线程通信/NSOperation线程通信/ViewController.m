//
//  ViewController.m
//  NSOperation线程通信
//
//  Created by 张正雨 on 2017/5/22.
//  Copyright © 2017年 张正雨. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dependecy];
    
}
//任务依赖
- (void)dependecy{
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    NSBlockOperation *bp1 = [NSBlockOperation blockOperationWithBlock:^{
        for (NSInteger i = 0; i < 5; i++) {
            NSLog(@"---1---%@",[NSThread currentThread]);
        }
    }];
    NSBlockOperation *bp2 = [NSBlockOperation blockOperationWithBlock:^{
        for (NSInteger i = 0; i < 5; i++) {
            NSLog(@"---2---%@",[NSThread currentThread]);
        }
    }];
    NSBlockOperation *bp3 = [NSBlockOperation blockOperationWithBlock:^{
        for (NSInteger i = 0; i < 5; i++) {
            NSLog(@"---3---%@",[NSThread currentThread]);
        }
    }];
    
    //添加 1、2 的依赖关系
    [bp2 addDependency:bp1];
    [bp1 addDependency:bp3];
    
    [queue addOperation:bp1];
    [queue addOperation:bp2];
    [queue addOperation:bp3];
}
//线程通信
- (void)threadCommunication {
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [queue addOperationWithBlock:^{
        NSURL *url = [NSURL URLWithString:@"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1266709467,2634091832&fm=23&gp=0.jpg"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.imageView.image = image;
        }];
    }];
}


@end

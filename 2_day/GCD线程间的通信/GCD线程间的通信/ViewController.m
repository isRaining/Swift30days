//
//  ViewController.m
//  GCD线程间的通信
//
//  Created by 张正雨 on 2017/5/21.
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
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        //耗时操作
//        NSURL *url = [NSURL URLWithString:@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2160502147,182418099&fm=23&gp=0.jpg"];
//        NSData *data = [NSData dataWithContentsOfURL:url];
//        UIImage *image = [UIImage imageWithData:data];
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.imageView.image=image;
//        });
//    });
    [self mianAsync];
}
#pragma mark - 主队列 + 异步任务
//没有开启新的线程,任务还是逐个完成的
- (void)mianAsync{
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        for (int i = 0 ; i < 5; i++) {
            NSLog(@"-----1-----");
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0 ; i < 5; i++) {
            NSLog(@"-----2-----");
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0 ; i < 5; i++) {
            NSLog(@"-----3-----");
        }
    });
}
#pragma mark - 主队列 + 同步任务
//会造成死锁的现象  主队列不能添加同步任务
- (void)mainSync{
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        for (int i = 0 ; i < 5; i++) {
            NSLog(@"-----1-----");
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0 ; i < 5; i++) {
            NSLog(@"-----2-----");
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0 ; i < 5; i++) {
            NSLog(@"-----3-----");
        }
    });
}
#pragma mark - 串行队列
//串行队列 + 异步任务 : 开启了新线程，任务是逐个完成的
- (void)serialAsync{
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        for (int i = 0 ; i < 5; i++) {
            NSLog(@"-----1-----");
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0 ; i < 5; i++) {
            NSLog(@"-----2-----");
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0 ; i < 5; i++) {
            NSLog(@"-----3-----");
        }
    });
}
//串行队列 + 同步任务 ： 没有开启新的线程，任务是逐个进行
- (void)serialSync{
    //创建串行队列
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        for (int i = 0 ; i < 5; i++) {
            NSLog(@"-----1-----");
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0 ; i < 5; i++) {
            NSLog(@"-----2-----");
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0 ; i < 5; i++) {
            NSLog(@"-----3-----");
        }
    });
}

#pragma mark - 并发对列
/**
 全局队列 + 异步任务 : 开启了新的线程，任务是并发的
 */
- (void)globalAsync{
    //获取全局队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        for (int i = 0 ; i < 5; i++) {
            NSLog(@"-----1-----");
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0 ; i < 5; i++) {
            NSLog(@"-----2-----");
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0 ; i < 5; i++) {
            NSLog(@"-----3-----");
        }
    });
}
/**
 全局队列  + 同步任务
 */
- (void)globalStnc{
    //获取全局队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_sync(queue, ^{
        for (int i = 0 ; i < 5; i++) {
            NSLog(@"-----1-----");
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0 ; i < 5; i++) {
            NSLog(@"-----2-----");
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0 ; i < 5; i++) {
            NSLog(@"-----3-----");
        }
    });
}
/**
 并发队列 + 异步任务:开启了新的线程，任务是并发的
*/
- (void)concurrentAsync{
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        for (int i = 0 ; i < 5; i++) {
            NSLog(@"-----1-----");
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0 ; i < 5; i++) {
            NSLog(@"-----2-----");
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0 ; i < 5; i++) {
            NSLog(@"-----3-----");
        }
    });
}
@end

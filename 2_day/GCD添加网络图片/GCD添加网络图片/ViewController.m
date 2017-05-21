//
//  ViewController.m
//  GCD添加网络图片
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
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *url = [NSURL URLWithString:@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2160502147,182418099&fm=23&gp=0.jpg"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        
        //回归到主线程
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"11111111");
            self.imageView.image = image;
        });
        
        NSLog(@"-------");
    });
}


@end

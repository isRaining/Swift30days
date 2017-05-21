//
//  ViewController.m
//  线程间通信
//
//  Created by 张正雨 on 2017/5/21.
//  Copyright © 2017年 张正雨. All rights reserved.
//
#define imageURL @"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2097810229,3516784541&fm=11&gp=0.jpg"
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
//    NSURL *imageurl = [NSURL URLWithString:imageURL];
//    NSDate *beginTime = [NSDate date];
//    NSData *data = [NSData dataWithContentsOfURL:imageurl];
//    NSDate *endTime = [NSDate date];
//    NSLog(@"%f",[endTime timeIntervalSinceDate:beginTime]);
//    self.imageView.image = [UIImage imageWithData:data];
    [NSThread detachNewThreadSelector:@selector(downloadImage) toTarget:self withObject:nil];
}
- (void)downloadImage {
    NSURL *imageurl = [NSURL URLWithString:imageURL];
    NSData *data = [NSData dataWithContentsOfURL:imageurl];
    UIImage *image = [UIImage imageWithData:data];
    //线程通信
    //由子线程回归到主线程
//    [self performSelectorOnMainThread:@selector(loadImage:) withObject:image waitUntilDone:YES];
//    [self performSelector:@selector(loadImage:) onThread:[NSThread mainThread] withObject:image waitUntilDone:NO];
    [self.imageView performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:NO];
    NSLog(@"111111");
}

- (void)loadImage:(UIImage *)image{
    self.imageView.image = image;
}
@end

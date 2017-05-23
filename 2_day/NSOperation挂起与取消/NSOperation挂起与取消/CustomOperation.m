//
//  CustomOperation.m
//  NSOperation挂起与取消
//
//  Created by 张正雨 on 2017/5/22.
//  Copyright © 2017年 张正雨. All rights reserved.
//

#import "CustomOperation.h"

@implementation CustomOperation
- (void)main{
    for (int i = 0; i< 5000; i++) {
        NSLog(@"----1---%@",[NSThread currentThread]);
    }
    if (self.cancelled) {
        return;
    }
    for (int i = 0; i< 5000; i++) {
        NSLog(@"----2---%@",[NSThread currentThread]);
    }
    if (self.cancelled) {
        return;
    }
    for (int i = 0; i< 5000; i++) {
        NSLog(@"----3---%@",[NSThread currentThread]);
    }
    if (self.cancelled) {
        return;
    }
    for (int i = 0; i< 5000; i++) {
        NSLog(@"----4---%@",[NSThread currentThread]);
    }
    if (self.cancelled) {
        return;
    }
}
@end

//
//  
//  
//
/**
 */
//
//

#import "ViewController.h"
#import "customOperation.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self invocationOperation];
//    [self blockOperation];
    [self customOperation];
}
#pragma mark - invocationOperation用法
/**
*1、invocationOperation
    * 不会开启新的线程
    * 只有将operation放进队列里才会执行
*/
- (void)invocationOperation{
    NSInvocationOperation *ip = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(operation1) object:nil];
    [ip start];
}
- (void)operation1{
    NSLog(@"---1---%@",[NSThread currentThread]);
}

#pragma mark - blockOperation用法
/**
 2、blockOperation
    * 封装的操作数肯定大于1
 */
- (void)blockOperation{
    NSBlockOperation *bp = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"---1---%@",[NSThread currentThread]);
    }];
    //添加其他额外任务   开启了新的线程
    [bp addExecutionBlock:^{
        NSLog(@"---2---%@",[NSThread currentThread]);
    }];
    [bp addExecutionBlock:^{
        NSLog(@"---3---%@",[NSThread currentThread]);
    }];
    [bp addExecutionBlock:^{
        NSLog(@"---4---%@",[NSThread currentThread]);
    }];
    [bp start];
}
#pragma mark - 自定义Operation
/**
 自定义NSOperation需要重写一下main函数
 */
- (void)customOperation{
    customOperation *op = [[customOperation alloc]init];
    [op start];
}
@end

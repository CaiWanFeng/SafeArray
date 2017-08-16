//
//  ViewController.m
//  SafeArray
//
//  Created by 蔡强 on 2017/8/16.
//  Copyright © 2017年 kuaijiankang. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+Util.h"
#import "NSMutableArray+Util.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //------- 测试不可变数组越界 -------//
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(90, 90, 200, 40);
    [self.view addSubview:button1];
    [button1 setTitle:@"不可变数组越界" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(testImmutableArray) forControlEvents:UIControlEventTouchUpInside];
    
    //------- 测试可变数组越界 -------//
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.frame = CGRectMake(90, 150, 200, 40);
    [self.view addSubview:button2];
    [button2 setTitle:@"可变数组越界" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(testMutableArray) forControlEvents:UIControlEventTouchUpInside];
}

/** 测试不可变数组越界 */
- (void)testImmutableArray {
    NSArray *arr = [NSArray array];
    NSString *item = [arr objectAtIndex:8];
    NSLog(@"item======%@",item);
}

/** 测试可变数组越界 */
- (void)testMutableArray {
    NSMutableArray *arr = [NSMutableArray array];
    NSString *item = [arr objectAtIndex:8];
    NSLog(@"item======%@",item);
}

@end

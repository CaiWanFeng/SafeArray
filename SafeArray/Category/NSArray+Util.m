//
//  NSArray+Util.m
//  SafeArray
//
//  Created by 蔡强 on 2017/8/16.
//  Copyright © 2017年 kuaijiankang. All rights reserved.
//

#import "NSArray+Util.h"
#import <objc/runtime.h>

@implementation NSArray (Util)

+ (void)load {
    // 不可变数组原本的方法
    Method method_immutableArray_objectAtIndex = class_getInstanceMethod(NSClassFromString(@"__NSArray0"), @selector(objectAtIndex:));
    // 不可变数组的安全方法
    Method method_immutableArray_safeObjectAtIndex = class_getInstanceMethod(NSClassFromString(@"NSArray"),@selector(safeObjectAtIndex:));
    // 将不可变数组的方法替换成安全方法
    method_exchangeImplementations(method_immutableArray_objectAtIndex, method_immutableArray_safeObjectAtIndex);
}

/**
 用来替换NSArray的objectAtIndex:方法

 @param index 索引
 @return 对应的object
 */
- (id)safeObjectAtIndex:(NSUInteger)index {
    if (index >= self.count) {
        NSLog(@"不可变数组越界了！");
        return nil;
    }else{
        __block id returnObj = nil;
        [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (index == idx) {
                returnObj = obj;
            }
        }];
        
        return returnObj;
    }
}

@end

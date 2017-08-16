//
//  NSMutableArray+Util.m
//  SafeArray
//
//  Created by 蔡强 on 2017/8/16.
//  Copyright © 2017年 kuaijiankang. All rights reserved.
//

#import "NSMutableArray+Util.h"
#import <objc/runtime.h>

@implementation NSMutableArray (Util)

+ (void)load {
    // 可变数组原本的方法
    Method method_mutableArray_objectAtIndex = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(objectAtIndex:));
    // 可变数组的安全方法
    Method method_mutableArray_safeObjectAtIndex = class_getInstanceMethod(NSClassFromString(@"NSMutableArray"),@selector(safeObjectAtIndex:));
    // 将可变数组的方法替换成安全方法
    method_exchangeImplementations(method_mutableArray_objectAtIndex, method_mutableArray_safeObjectAtIndex);
}

/**
 用来替换NSMutableArray的objectAtIndex:方法
 
 @param index 索引
 @return 对应的object
 */
- (id)safeObjectAtIndex:(NSUInteger)index {
    if (index >= self.count) {
        NSLog(@"可变数组越界了！");
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

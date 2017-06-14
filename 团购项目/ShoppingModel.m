//
//  ShoppingModel.m
//  团购项目
//
//  Created by jiangwei18 on 17/6/14.
//  Copyright © 2017年 jiangwei18. All rights reserved.
//

#import "ShoppingModel.h"

@implementation ShoppingModel
- (instancetype)initWithDict:(NSDictionary*)dict {
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)modelWithDict:(NSDictionary*)dict {
    return [[ShoppingModel alloc]initWithDict:dict];
}
@end

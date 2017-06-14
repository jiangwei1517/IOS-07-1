//
//  ShoppingModel.h
//  团购项目
//
//  Created by jiangwei18 on 17/6/14.
//  Copyright © 2017年 jiangwei18. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShoppingModel : NSObject
@property (nonatomic, copy)NSString* icon;
@property (nonatomic, copy)NSString* price;
@property (nonatomic, copy)NSString* title;
@property (nonatomic, copy)NSString* buyCount;

- (instancetype)initWithDict:(NSDictionary*)dict;

+ (instancetype)modelWithDict:(NSDictionary*)dict;
@end

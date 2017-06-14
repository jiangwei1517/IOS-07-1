//
//  FoodCellView.h
//  团购项目
//
//  Created by jiangwei18 on 17/6/14.
//  Copyright © 2017年 jiangwei18. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ShoppingModel.h"

@interface FoodCellView : UITableViewCell
@property (nonatomic, strong) ShoppingModel *model;

+ (instancetype)CellViewWithTableView:(UITableView*)tableView;

@end

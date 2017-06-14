//
//  FoodCellView.m
//  团购项目
//
//  Created by jiangwei18 on 17/6/14.
//  Copyright © 2017年 jiangwei18. All rights reserved.
//

#import "FoodCellView.h"
@interface FoodCellView ()
@property (weak, nonatomic) IBOutlet UIImageView *mImageView;
@property (weak, nonatomic) IBOutlet UILabel *mTitle;
@property (weak, nonatomic) IBOutlet UILabel *mPrice;
@property (weak, nonatomic) IBOutlet UILabel *mBuyCount;

@end

@implementation FoodCellView

+ (instancetype)CellViewWithTableView:(UITableView*)tableView {
    static NSString* ID = @"shopping_cell";
    FoodCellView* cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"FoodCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)setModel:(ShoppingModel *)model {
    _model = model;
    self.mImageView.image = [UIImage imageNamed:model.icon];
    self.mTitle.text = model.title;
    self.mTitle.font = [UIFont systemFontOfSize:14];
    self.mPrice.text = [NSString stringWithFormat:@"$%@", model.price];
    self.mPrice.font = [UIFont systemFontOfSize:12];
    self.mBuyCount.text = [NSString stringWithFormat:@"已有%@人购买", model.buyCount];
    self.mBuyCount.font = [UIFont systemFontOfSize:12];
}
@end

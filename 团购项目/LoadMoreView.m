//
//  LoadMore.m
//  团购项目
//
//  Created by jiangwei18 on 17/6/14.
//  Copyright © 2017年 jiangwei18. All rights reserved.
//

#import "LoadMoreView.h"
@interface LoadMoreView ()
@property (weak, nonatomic) IBOutlet UIButton *mLoadBtn;
@property (weak, nonatomic) IBOutlet UIView *mLoadingView;

@end
@implementation LoadMoreView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [self.mLoadBtn addTarget:self action:@selector(onLoadMoreClick) forControlEvents:UIControlEventTouchUpInside];
    self.mLoadBtn.hidden = NO;
    self.mLoadingView.hidden = YES;
}

- (void)onLoadMoreClick {
    self.mLoadBtn.hidden = YES;
    self.mLoadingView.hidden = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([self.delegate respondsToSelector:@selector(footViewUpDate:)]) {
            // 调用代理的方法
            [self.delegate footViewUpDate:self];
        }
        self.mLoadBtn.hidden = NO;
        self.mLoadingView.hidden = YES;
    });
}

@end

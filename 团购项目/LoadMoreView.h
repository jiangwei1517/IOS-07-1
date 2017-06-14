//
//  LoadMore.h
//  团购项目
//
//  Created by jiangwei18 on 17/6/14.
//  Copyright © 2017年 jiangwei18. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LoadMoreView;

@protocol LoadMoreViewDelegate<UIScrollViewDelegate>
@required
- (void)footViewUpDate:(LoadMoreView*)loadMoreView;

@end

@interface LoadMoreView : UIView

@property(nonatomic, strong)id<LoadMoreViewDelegate> delegate;

@end

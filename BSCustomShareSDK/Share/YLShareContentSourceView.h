//
//  YLShareContentSourceView.h
//  YangLand
//
//  Created by 李胜兵 on 16/3/28.
//  Copyright © 2016年 tshiny. All rights reserved.
//

#import "UIView+YL.h"


@class YLShareContentSourceView;

@protocol YLShareContentSourceViewDelegate <NSObject>

/**
 *  点击取消按钮，触发事件
 */
- (void)tapCancelButtom;


- (void)shareWithSNSType:(NSString *)type;

@end




@interface YLShareContentSourceView : UIView

@property (weak, nonatomic)id<YLShareContentSourceViewDelegate>delegate;

- (instancetype)initWithFrame:(CGRect)frame withShareSourceArray:(NSArray *)array;

@end

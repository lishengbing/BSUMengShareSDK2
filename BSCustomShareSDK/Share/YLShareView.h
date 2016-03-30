//
//  YLShareView.h
//  YangLand
//
//  Created by 李胜兵 on 16/3/25.
//  Copyright © 2016年 tshiny. All rights reserved.
//

#import "YLShareContentSourceView.h"


// 获取屏幕宽度、高度
#define YLScreenW [UIScreen mainScreen].bounds.size.width
#define YLScreenH [UIScreen mainScreen].bounds.size.height





@interface YLShareView : UIView
@property (strong, nonatomic)YLShareContentSourceView *bottomView;

/**
 *  显示
 */
- (void)show;


/**
 *  消失
 */
- (void)dismiss;

@end

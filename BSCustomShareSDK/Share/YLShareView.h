//
//  YLShareView.h
//  YangLand
//
//  Created by 李胜兵 on 16/3/25.
//  Copyright © 2016年 tshiny. All rights reserved.
//

#import "YLShareContentSourceView.h"


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

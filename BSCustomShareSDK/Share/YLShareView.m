//
//  YLShareView.m
//  YangLand
//
//  Created by 李胜兵 on 16/3/25.
//  Copyright © 2016年 tshiny. All rights reserved.
//

#import "YLShareView.h"
#import "UIView+YL.h"
#import "YLAnimaitonTool.h"


static CGFloat bottomViewHeight = 200;  // bottomView高度

@interface YLShareView ()<YLShareContentSourceViewDelegate>


@end


@implementation YLShareView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {

        self.backgroundColor = [UIColor colorWithWhite:.3 alpha:.3];
         [self addSubview:self.bottomView];
    }
    return self;
}

- (void)setUpUI {
    [self addSubview:self.bottomView];

}

- (void)show {
 
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    // 模版的大小等于窗口的大小
    self.frame = window.bounds;

    
    [window addSubview:self];

    [YLAnimaitonTool showAnimationFlashWithView:self.bottomView duration:.5];
     self.bottomView.alpha = 1;

}

- (void)dismiss {
    
    [UIView animateWithDuration:.7 animations:^{
        self.bottomView.alpha = 0;
    } completion:^(BOOL finished) {
        
       [self removeFromSuperview];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismiss];
}




#pragma mark - YLShareContentSourceViewDelegate代理 、

- (void)tapCancelButtom {
    [self dismiss];
}


- (void)shareWithSNSType:(NSString *)type {
    
}



#pragma mark - get

- (YLShareContentSourceView *)bottomView {
    if (!_bottomView) {
        NSArray *array = @[@"新浪",@"微信",@"朋友圈",@"QQ"]; //分享来源个数
        bottomViewHeight = bottomViewHeight<200?200:bottomViewHeight;// 限制他人设置低于200的高度
       _bottomView = [[YLShareContentSourceView alloc]initWithFrame:CGRectMake(0, YLScreenH-bottomViewHeight, YLScreenW, bottomViewHeight) withShareSourceArray:array];
        _bottomView.delegate  = self;
    }
    return _bottomView;
}

- (void)layoutSubviews {
  
}






@end
     


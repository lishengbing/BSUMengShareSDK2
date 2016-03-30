//
//  YLAnimaiton.m
//  YangLand
//
//  Created by 李胜兵 on 16/3/28.
//  Copyright © 2016年 tshiny. All rights reserved.
//

#import "YLAnimaitonTool.h"

@implementation YLAnimaitonTool


/**
 *  showAnimationFlash
 */
+ (void)showAnimationFlashWithView:(UIView *)animationView duration:(CGFloat)duration {
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    if (!duration) {
        popAnimation.duration = .8;
    }
    popAnimation.duration = duration;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.0f, 0.01f, 1.0f)],[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1, 1.0f)],[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9, 1.0f)],[NSValue valueWithCATransform3D:CATransform3DIdentity]];
    popAnimation.keyTimes = @[@0.2f,@0.5f,@0.75f,@1.0f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [animationView.layer addAnimation:popAnimation forKey:nil];
}


@end

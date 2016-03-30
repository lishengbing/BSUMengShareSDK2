//
//  UIView+YL.h
//  YangLand
//
//  Created by point on 16/3/2.
//  Copyright © 2016年 tshiny. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^GestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@interface UIView (YL)

@property (readonly) UIViewController *viewController;

@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

- (void)addTapActionWithBlock:(GestureActionBlock)block;
@end

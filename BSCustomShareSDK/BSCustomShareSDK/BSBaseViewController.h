//
//  BSBaseViewController.h
//  BSCustomShareSDK
//
//  Created by 李胜兵 on 16/3/30.
//  Copyright © 2016年 李胜兵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UMSocial.h"

@interface BSBaseViewController : UIViewController



/**
 *  分享
 *
 *  @param shareType  分享类型
 *  @param Content    分享内容
 *  @param image      分享图片
 *  @param location   分享位置
 *  @param urlResouce 分享资源路径
 *  @param vc         当前分享的控制器管理
 *  @param Completion 完成后的回调
 */
- (void)shareWithPostSNSWithTypes:(NSString *)shareType content:(NSString *)Content image:(id)image location:(CLLocation *)location urlResource:(UMSocialUrlResource *)urlResouce presentedController:(UIViewController *)vc completion:(void(^)(UMSocialResponseEntity *response))Completion;


@end

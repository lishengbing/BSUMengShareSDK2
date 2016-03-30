//
//  BSBaseViewController.m
//  BSCustomShareSDK
//
//  Created by 李胜兵 on 16/3/30.
//  Copyright © 2016年 李胜兵. All rights reserved.
//

#import "BSBaseViewController.h"
#import "UIView+YL.h"
#import "YLShareView.h"
#import "YLShareContentSourceView.h"
#import "YLShareView.h"

@interface BSBaseViewController ()<YLShareContentSourceViewDelegate>
@property (strong, nonatomic)UIButton *btn;
@property (strong, nonatomic)YLShareView *shareView;


@end

@implementation BSBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpUI];
}




- (void)setUpUI {
    [self.view addSubview:self.btn];
}


- (void)click:(UIButton *)sender {
    YLLog(@"点击开始");
    // 显示
    [self.shareView show];
}


#pragma mark - 两个代理.....

- (void)tapCancelButtom {
    [self.shareView dismiss];
}

- (void)shareWithSNSType:(NSString *)type {
    //即将跳转就让他消失页面
    [self tapCancelButtom];
    
    // 1.分享url资源
    UMSocialUrlResource *urlResource =[[UMSocialUrlResource alloc]initWithSnsResourceType:UMSocialUrlResourceTypeImage url:@"http://img0.pcgames.com.cn/pcgames/1407/07/4057451_1_thumb.jpg"];
    
    [self shareWithPostSNSWithTypes:type content:@"分享内容" image:nil location:nil urlResource:urlResource presentedController:self completion:^(UMSocialResponseEntity *response) {
        if (response.responseCode == UMSResponseCodeSuccess) {
            YLLog(@"分享成功");
        }
    }];
}

/**
 *  分享方法
 */
- (void)shareWithPostSNSWithTypes:(NSString *)shareType content:(NSString *)Content image:(id)image location:(CLLocation *)location urlResource:(UMSocialUrlResource *)urlResouce presentedController:(UIViewController *)vc completion:(void (^)(UMSocialResponseEntity *))Completion {
    if ([shareType isEqualToString:UMShareToSina]) {                  // 新浪
        
    }else if ([shareType isEqualToString:UMShareToWechatSession]) {   // 微信好友
        
    }else if ([shareType isEqualToString:UMShareToWechatTimeline]) {  // 微信朋友圈
        
    }else if ([shareType isEqualToString:UMShareToQQ]) {              // QQ
        
    }
    
    
    [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[shareType] content:Content image:image location:location urlResource:urlResouce presentedController:vc completion:^(UMSocialResponseEntity *response){
        if (Completion) {
            Completion (response);
        }
    }];
    
    
}




#pragma mark - get

- (YLShareView *)shareView {
    if (!_shareView) {
        _shareView = [[YLShareView alloc]init];
        _shareView.bottomView.delegate = self;
    }
    return _shareView;
}



#pragma mark - get

- (UIButton *)btn {
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
        [_btn setBackgroundColor:[UIColor redColor]];
        [_btn addTarget: self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        _btn.frame = CGRectMake(100, 100, 100, 100);
        
    }
    return _btn;
}


@end

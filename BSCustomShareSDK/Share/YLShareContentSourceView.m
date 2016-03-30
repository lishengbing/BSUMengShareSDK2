//
//  YLShareContentSourceView.m
//  YangLand
//
//  Created by 李胜兵 on 16/3/28.
//  Copyright © 2016年 tshiny. All rights reserved.
//

#import "YLShareContentSourceView.h"
#import "UMSocialSnsPlatformManager.h"



static CGFloat normalHeight = 50;          //  默认上下高度
static CGFloat verticalSpace = 10;        //  上下间距
static CGFloat imageHeight = 50;         //  图片高度＝宽度
static NSInteger showCount = 4;         //  一行显示分享来源个数


@interface YLShareContentSourceView ()
@property (strong, nonatomic)UILabel *shareWhereLabel; // 分享去哪儿

@property (strong, nonatomic)UIButton *cancelBtn; // 取消按钮

@property (strong, nonatomic)UIScrollView *scrollView;

@end

@implementation YLShareContentSourceView


- (instancetype)initWithFrame:(CGRect)frame withShareSourceArray:(NSArray *)array {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.shareWhereLabel];
        [self addSubview:self.cancelBtn];
        [self addSubview:self.scrollView];
        
        UIScrollView *scrollView= [[UIScrollView alloc]initWithFrame:CGRectMake(0, normalHeight+verticalSpace, YLScreenW, self.height-normalHeight*2-verticalSpace*2)];
        
        NSInteger newCount = 0;
        if (array.count%showCount!=0) {
            newCount = 1;
        }
        scrollView.contentSize = CGSizeMake(YLScreenW*(array.count/showCount+newCount), self.height-normalHeight*2-verticalSpace*2);
        [self addSubview:scrollView];
        
        
        for (int i=0; i<array.count; i++) {
            
            
            CGFloat lineSpace = (YLScreenW-showCount*imageHeight) / (showCount+1);
            double imageX = lineSpace + i*(imageHeight+lineSpace);
            double imageY = 0;
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(imageX, imageY, imageHeight, imageHeight)];
            imageView.userInteractionEnabled = YES;
            imageView.tag = 100 + i;
            [scrollView addSubview:imageView];
            [imageView addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
                [self tap:gestureRecoginzer];
            }];

            
            UILabel *label = [[UILabel alloc]init];
            label.text = array[i];
            label.textColor = [UIColor blueColor];
            label.font = [UIFont systemFontOfSize:13];
            label.backgroundColor = [UIColor whiteColor];
            [label sizeToFit]; // 在计算之前加，不然无法计算
            label.tag = 100 +i;
            label.centerX = imageView.centerX;
            label.y = CGRectGetMaxY(imageView.frame) + verticalSpace;
            [label addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
                [self tap:gestureRecoginzer];
            }];
            
            
            switch (i) {
                case 0:
                    imageView.image = [UIImage imageNamed:@"share_weibo"];
                    break;
                case 1:
                    imageView.image = [UIImage imageNamed:@"share_weixin"];
                    break;
                case 2:
                    imageView.image = [UIImage imageNamed:@"share_icon_pengyouquan"];
                    break;
                case 3:
                    imageView.image = [UIImage imageNamed:@"share_icon_qq"];
                    break;
                    
                default:
                    break;
            }
            
            [scrollView addSubview:label];
            
        }
        
    }
    return self;
}


#pragma mark - 取消分享

- (void)cancel:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(tapCancelButtom)]) {
        [_delegate tapCancelButtom];
    }
}


#pragma mark - 分享类型

- (void)tap:(UIGestureRecognizer *)ges {
    switch (ges.view.tag-100) {
        case 0:
            YLLog(@"微博");
            [self.delegate shareWithSNSType:UMShareToSina];
            break;
        case 1:
            YLLog(@"微信");
             [self.delegate shareWithSNSType:UMShareToWechatSession];
            break;
        case 2:
            YLLog(@"朋友圈");
             [self.delegate shareWithSNSType:UMShareToWechatTimeline];
            break;
        case 3:
            YLLog(@"QQ");
             [self.delegate shareWithSNSType:UMShareToQQ];
            break;
            
        default:
            break;
    }
}




#pragma mark - get

- (UILabel *)shareWhereLabel {
    if (!_shareWhereLabel) {
        _shareWhereLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, YLScreenW, normalHeight)];
        _shareWhereLabel.text = @"分享到";
        _shareWhereLabel.textColor = [UIColor blueColor];
        _shareWhereLabel.font = [UIFont systemFontOfSize:13];
        _shareWhereLabel.textAlignment = NSTextAlignmentCenter;
        _shareWhereLabel.backgroundColor = [UIColor orangeColor];
    }
    return _shareWhereLabel;
}


#pragma mark - get

- (UIButton *)cancelBtn {
    if (!_cancelBtn) {
        _cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, self.height-50, YLScreenW, normalHeight)];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cancelBtn setBackgroundColor:[UIColor yellowColor]];
        _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_cancelBtn addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _cancelBtn;
}





@end

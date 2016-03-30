//
//  AppDelegate.m
//  BSCustomShareSDK
//
//  Created by 李胜兵 on 16/3/30.
//  Copyright © 2016年 李胜兵. All rights reserved.
//

#import "AppDelegate.h"
#import "BSBaseViewController.h"
#import "UMSocial.h"

#import "UMSocialSinaSSOHandler.h"
#import "UMSocialQQHandler.h"
#import "UMSocialWechatHandler.h"

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    BSBaseViewController *vc = [[BSBaseViewController alloc]init];
    
    self.window.rootViewController = vc;
    
    [self.window makeKeyAndVisible];
    
    
    
    //  友盟分享
    
    
    // 1.设置友盟AppKey
    //[UMSocialData setAppKey:@"输入你自己的友盟应用的appKey"];

     //添加新浪微博
//    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"你在新浪微博注册应用获取到的一个appKey"
//                                              secret:@"你在新浪微博注册应用获取到的一个appSecret"
//                                         RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
//    
//    // 分享到qq
//    [UMSocialQQHandler setQQWithAppId:@"你在QQ注册应用获取到的一个appID" appKey:@"你在QQ注册应用获取到的一个appKey" url:@"http://my.oschina.net/zhaodacai?fromerr=jOWmk8NJ"];
//
//    
//    // 分享到微信
//    [UMSocialWechatHandler setWXAppId:@"你在微信注册应用获取到的一个appid" appSecret:@"你在微信注册应用获取到的一个appKey" url:@"http://my.oschina.net/zhaodacai?fromerr=jOWmk8NJ"];
//    
    
    
    // 温馨提示：
    /**
     *  1.获取到在所有平台上的一个appkey和appSecret 或者appID和appSecret，你需要配置一下
        2.点击你的项目-----info------url Types-点击+-----然后按照友盟文档上的步骤配置一下，这里不方便注明，望谅解！
        3.配置完以后你就可以使用了，恭喜你成功分享你的东西！
     */
    
    
    //1.之前大家说下载下来不能运行，所以我就知道问题出现在pch文件路径下，所以删除掉以后就好了
    //2.大家在没有配置友盟分享的一些地方的时候，上面那些注释掉的代码建议不要打开，等你们配置好了再打开吧！谢谢
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

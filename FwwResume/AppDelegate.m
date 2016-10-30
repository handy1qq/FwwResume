//
//  AppDelegate.m
//  FwwResume
//
//  Created by fengwenwei on 16/10/23.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import "AppDelegate.h"
#import <UMSocialCore/UMSocialCore.h>
#import "UMSocialSinaHandler.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    [ [UMSocialManager defaultManager] openLog:YES];
//    
//    //设置友盟appkey
//    [[UMSocialManager defaultManager] setUmSocialAppkey:@"580d627a9f06fd080d000fca"];
//    //设置新浪的appKey和appSecret
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:@"580d627a9f06fd080d000fcal"  appSecret:@"580d627a9f06fd080d000fcall" redirectURL:nil];

    
    self.window = [ [UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
     self.window.backgroundColor = [UIColor whiteColor];
    [self setUI];
    [self.window makeKeyAndVisible];
    
    
    
    
    return YES;
}

- (void)setUI {
    
    UITabBarController *controller = [ [UITabBarController alloc] init];
    controller.tabBar.tintColor = [UIColor colorWithRed:56.0/255.0 green:177.0/255.0 blue:223.0/255.0 alpha:1];
    
    
    UIStoryboard *resume = [UIStoryboard storyboardWithName:@"Resume" bundle:nil];
    UINavigationController *resumeNav = resume.instantiateInitialViewController;
    resumeNav.tabBarItem.image = [UIImage imageNamed:@"tab_icon_collect_normal"];
    resumeNav.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_icon_collect_pressed"];
    resumeNav.tabBarItem.title = @"简历";
    
    UIStoryboard *project = [UIStoryboard storyboardWithName:@"Project" bundle:nil];
    UINavigationController *projectNav = project.instantiateInitialViewController;
    projectNav.tabBarItem.image = [UIImage imageNamed:@"tab_icon_main_normal"];
    projectNav.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_icon_main_pressed"];
    projectNav.tabBarItem.title = @"个人项目";
    
    UIStoryboard *messgaeMe = [UIStoryboard storyboardWithName:@"MessageMe" bundle:nil];
    UINavigationController *messageNa = messgaeMe.instantiateInitialViewController;
    messageNa.tabBarItem.image = [UIImage imageNamed:@"tab_icon_personal_normal"];
    messageNa.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_icon_personal_pressed"];
    messageNa.tabBarItem.title = @"联系方式";
    
    
    controller.viewControllers = @[resumeNav, projectNav, messageNa];
    self.window.rootViewController = controller;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
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

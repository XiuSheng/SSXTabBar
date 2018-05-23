//
//  SSXAppDelegate.m
//  SSXTabBar
//
//  Created by sishengxiu@gmail.com on 05/23/2018.
//  Copyright (c) 2018 sishengxiu@gmail.com. All rights reserved.
//

#import "SSXAppDelegate.h"
#import "SSXTabBar.h"
#import "SSXViewController.h"
@implementation SSXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    SSXTabBar *tabBar = [[SSXTabBar alloc] init];
    NSArray *titleArr = @[@"首页",@"消息",@"联系人",@"工作台",@"关注",@"我的"];
    NSArray *imageArr = @[@"home",@"msg",@"contacts",@"app",@"attention",@"about"];
    NSArray *imageSelArr = @[@"home_sel",@"msg_sel",@"contacts_sel",@"app_sel",@"attention_sel",@"about_sel"];
    NSMutableArray *navArr = [[NSMutableArray alloc] initWithCapacity:titleArr.count];
    for (int i = 0; i<titleArr.count; i++) {
        UIViewController *vc;
        if (i>=4) {
            vc = [[SSXViewController alloc] init];
        }else{
            vc = [[UIViewController alloc] init];
        }
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:titleArr[i] image:[UIImage imageNamed:imageArr[i]] selectedImage:[UIImage imageNamed:imageSelArr[i]]];
        [navArr addObject:nav];
    }
    tabBar.viewControllers = navArr;
    [self.window setRootViewController:tabBar];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

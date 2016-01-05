//
//  AppDelegate.m
//  welPageChange-master
//
//  Created by 刘家男 on 16/1/4.
//  Copyright © 2016年 刘家男. All rights reserved.
//

#import "AppDelegate.h"
#import "welcomPage.h"
#import "ViewController.h"
#define WHITH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface AppDelegate ()
@property (strong, nonatomic) UIView *welView;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    ViewController * view=[ViewController new];
    self.window.rootViewController =view;
    [self.window makeKeyAndVisible];
    //读取图片
    NSString *fullPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/welcome.jpg"];
    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
     if(savedImage){
         _welView =[UIView new];
         _welView=[[NSBundle mainBundle ]loadNibNamed:@"LaunchScreen" owner:nil options:nil][0];
         _welView.frame = CGRectMake(0, 0, self.window.screen.bounds.size.width, self.window.screen.bounds.size.height);
         [self.window addSubview:_welView];
         UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WHITH, HEIGHT)];

         imageV.image=savedImage;
         [_welView addSubview:imageV];
         [self.window bringSubviewToFront:_welView];
         
         [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(removeWelPage) userInfo:nil repeats:NO];
    
     }
    // Override point for customization after application launch.
    return YES;
}
-(void)removeWelPage
{
    //设置消失扩散渐淡动画效果
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView animateWithDuration:1.0f animations:^{
        [_welView.layer setTransform:CATransform3DMakeScale(3.0, 3.0, 1.0)];
        _welView.alpha = 0.0;
    }completion:^(BOOL finished) {
        [_welView removeFromSuperview];
        [UIView commitAnimations];
    }];
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

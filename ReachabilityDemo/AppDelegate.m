//
//  AppDelegate.m
//  ReachabilityDemo
//
//  Created by mikosick on 2014/07/06.
//  Copyright (c) 2014年 InasePictures. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // MainViewControllerを基点のControllerに設定
    _mainViewController = [[MainViewController alloc] init];
    _mainViewController.view.frame = _window.frame;
    [_window setRootViewController:_mainViewController];
    
    [_window makeKeyAndVisible];
    
    return YES;
}

@end

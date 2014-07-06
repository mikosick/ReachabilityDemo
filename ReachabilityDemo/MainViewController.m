//
//  MainViewController.m
//  ReachabilityDemo
//
//  Created by mikosick on 2014/07/06.
//  Copyright (c) 2014年 InasePictures. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

// 接続状況確認ラベル
@property (nonatomic) UILabel *networkReachabilityLabel;
@property (strong, nonatomic) Reachability *currentReachability;


@end


@implementation MainViewController

@synthesize networkReachabilityLabel;
@synthesize currentReachability;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 接続状況確認ラベル
    networkReachabilityLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, 280, 50)];
    [self.view addSubview:networkReachabilityLabel];
    networkReachabilityLabel.textAlignment = NSTextAlignmentCenter;
    
    // 確認ボタン
    UIButton *networkCheckButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    networkCheckButton.frame = CGRectMake(50, 100, 220, 50);
    [networkCheckButton setTitle:@"接続状況確認" forState:UIControlStateNormal];
    [networkCheckButton addTarget:self action:@selector(checkReachability) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:networkCheckButton];
    
}

- (void)checkReachability
{
    
    // ネット接続状態確認
    currentReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus netStatus = [currentReachability currentReachabilityStatus];
    
    switch (netStatus)
    {
        case NotReachable:        {
            // 圏外の場合
            networkReachabilityLabel.text = @"圏外";
            break;
        }
        case ReachableViaWWAN:        {
            // 携帯回線に接続可能な場合
            networkReachabilityLabel.text = @"携帯回線に接続中";
            break;
        }
        case ReachableViaWiFi:        {
            // wifiに接続可能な場合
            networkReachabilityLabel.text = @"wifiに接続中";
            break;
        }
    }
}


@end

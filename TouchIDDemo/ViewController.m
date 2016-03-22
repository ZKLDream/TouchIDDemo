//
//  ViewController.m
//  TouchIDDemo
//
//  Created by 千锋 on 16/3/22.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    //创建本地验证的上下文环境
    LAContext *lax=[[LAContext alloc]init];
    
    //判断是否支持Touch ID
    
//    LAPolicyDeviceOwnerAuthenticationWithBiometrics 只支持Touch ID
//    LAPolicyDeviceOwnerAuthentication  即支持Touch ID 也可以输入密码
    NSError *error;
    if ([lax canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        
        //使用Touch ID
        [lax evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"通过HOme验证有指纹" reply:^(BOOL success, NSError * _Nullable error) {
            if (success) {
                NSLog(@"手感不错");
            }
            else{
                NSLog(@"%@",error.localizedDescription);
            }
        }];
        
    }else{
        NSLog(@"不支持 %@",error.localizedDescription);
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

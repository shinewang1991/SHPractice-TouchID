//
//  ViewController.m
//  SHPractice-TouchID
//
//  Created by Shine on 31/03/2018.
//  Copyright © 2018 yixia. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self touchIDTest];
}

- (void)touchIDTest{
    //判断设备是否支持指纹识别. iPhone5S以后以及iOS8系统以后才支持
    LAContext *context = [[LAContext alloc] init];
    if([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:NULL]){
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"需要指纹登录" reply:^(BOOL success, NSError * _Nullable error) {
            NSLog(success ? @"指纹验证成功" : @"指纹验证失败%@",error);
        }];
    }
    else{
        NSLog(@"不支持指纹识别");
    }
    
    
}


@end

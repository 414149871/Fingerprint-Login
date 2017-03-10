//
//  ShowFingerTool.m
//   
//
//  Created by 刘嘉豪 on 2016/12/9.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "ShowFingerTool.h"
#import <LocalAuthentication/LAContext.h>

@implementation ShowFingerTool

#pragma mark    指纹验证方法
- (void)showFingerPrintTouchSuccessBlock:(SuccessBlock)block ErrorBlock:(ErrorBlock)errorBlock{
    
    LAContext *myContext = [[LAContext alloc] init];
    NSError *authError = nil;
    NSString *myLocalizedReasonString = @"通过Home键验证已有手机指纹";
    
    //判断设备是否支持指纹识别
    if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
        
        //指纹识别只判断当前用户是否是机主
        [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:myLocalizedReasonString reply:^(BOOL success, NSError * _Nullable error) {
            
            if (success) {
                
                NSLog(@"指纹认证成功");
                block();
            }
            else{
                
                NSLog(@"指纹认证失败,%@",[@(error.code) stringValue]);
                // 错误码 error.code
                // -1: 连续三次指纹识别错误
                // -2: 在TouchID对话框中点击了取消按钮
                // -3: 在TouchID对话框中点击了输入密码按钮
                // -4: TouchID对话框被系统取消，例如按下Home或者电源键
                // -8: 连续五次指纹识别错误，TouchID功能被锁定，下一次需要输入系统密码
                
                switch (error.code) {
                    case -1:
                        NSLog(@"连续三次指纹识别错误");
                        break;
                    case -2:
                        NSLog(@"在TouchID对话框中点击了取消按钮");
                        break;
                    case -3:
                        NSLog(@"在TouchID对话框中点击了输入密码按钮");
                        break;
                    case -4:
                        NSLog(@"TouchID对话框被系统取消，例如按下Home或者电源键");
                        break;
                    case -8:
                        NSLog(@"连续五次指纹识别错误，TouchID功能被锁定，下一次需要输入系统密码");
                        break;
                }
                
                errorBlock(error);
            }
        }];
    }
    else if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:nil]){
        
        [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:@"密码解锁" reply:^(BOOL success, NSError * _Nullable error) {
            
            NSLog(@"LAPolicyDeviceOwnerAuthentication -- %@", error);
        }];
    }
    else{
        
        NSLog(@"TouchID设备不可用");
    }
}


@end

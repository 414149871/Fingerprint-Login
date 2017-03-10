//
//  ViewController.m
//  指纹支付登录
//
//  Created by 刘嘉豪 on 2016/12/8.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LAContext.h>
#import "VerifyView.h"
#import "ShowFingerTool.h"

#define VertifyKey @"VertifyKey"
@interface ViewController ()<VerifyViewDelegate>

//指纹解锁Switch
@property (weak, nonatomic) IBOutlet UISwitch *lockSwitch;

@property (nonatomic,strong)VerifyView  *verifyView;
@property (nonatomic,strong)ShowFingerTool *showFinger;

@end

@implementation ViewController
//提示验证View
- (VerifyView *)verifyView{
    
    if(!_verifyView){
        
        _verifyView = [[[NSBundle mainBundle] loadNibNamed:@"VerifyView" owner:nil options:nil] lastObject];
        _verifyView.frame = self.view.bounds;
        _verifyView.delegate = self;
    }
    return _verifyView;
}

//验证功能
- (ShowFingerTool *)showFinger{
    
    if(!_showFinger){
        
        _showFinger = [ShowFingerTool new];
    }
    return _showFinger;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    BOOL flag = [[NSUserDefaults standardUserDefaults] boolForKey:VertifyKey];
    if (flag) {
        [[[UIApplication sharedApplication].windows lastObject] addSubview:self.verifyView];
        [self showFingerPrintTouch];
    }
    self.lockSwitch.on = flag;
}

#pragma mark VerifyViewDelegate
- (void)verify:(UIButton *)sender{
    
   [self showFingerPrintTouch];
}

- (void)showFingerPrintTouch{

    [self.showFinger showFingerPrintTouchSuccessBlock:^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.verifyView setHidden:YES];
        });
    } ErrorBlock:^(NSError *err) {
        switch (err.code) {
            case -1:
                NSLog(@"连续三次指纹识别错误");
                break;
            case -3:
            {
                NSLog(@"在TouchID对话框中点击了输入密码按钮");
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"设置密码未开通,请继续使用指纹登录" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                [alertController addAction:action];
                [self presentViewController:alertController animated:YES completion:nil];
                
                break;
            }
            case -8:
            {
                {
                    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"连续五次指纹识别错误，TouchID功能被锁定，下一次需要输入系统密码" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                    [alertController addAction:action];
                    [self presentViewController:alertController animated:YES completion:nil];
                    break;
                }
            }
        }
    }];
}

- (IBAction)lockSwitchChange:(UISwitch *)sender {
    
    [[NSUserDefaults standardUserDefaults] setBool:sender.on forKey:VertifyKey];
    //写入磁盘
    [[NSUserDefaults standardUserDefaults] synchronize];
}


@end























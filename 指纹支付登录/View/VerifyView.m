//
//  VerifyView.m
//  指纹支付登录
//
//  Created by 刘嘉豪 on 2016/12/9.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "VerifyView.h"

@implementation VerifyView

//点击 "点击进行指纹解锁识别" 响应事件
- (IBAction)VerifyAction:(TopButton *)sender {
    
    if ([self.delegate conformsToProtocol:@protocol(VerifyViewDelegate)]) {
        
        [self.delegate verify:sender];
    }
}

@end

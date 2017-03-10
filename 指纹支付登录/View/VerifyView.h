//
//  VerifyView.h
//  指纹支付登录
//
//  Created by 刘嘉豪 on 2016/12/9.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopButton.h"

@protocol VerifyViewDelegate <NSObject>

- (void)verify:(UIButton *)sender;
@end

@interface VerifyView : UIView

@property (nonatomic,weak)id <VerifyViewDelegate>  delegate;

@end

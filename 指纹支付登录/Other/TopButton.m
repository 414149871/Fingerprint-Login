//
//  TopButton.m
//  UI_08_04
//
//  Created by 刘嘉豪 on 16/10/9.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "TopButton.h"
#import "UIView+UIViewExtension.h"

@implementation TopButton

- (void)awakeFromNib{
    
    [super awakeFromNib];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    self.imageView.RL_y = 10;
    self.imageView.RL_centerX = self.RL_Width*0.5;
    
    self.titleLabel.RL_x = 0;
    self.titleLabel.RL_y = self.imageView.RL_bottom;
    self.titleLabel.RL_Width = self.RL_Width;
    self.titleLabel.RL_Height = self.RL_Height - self.imageView.RL_Height;
}


@end









































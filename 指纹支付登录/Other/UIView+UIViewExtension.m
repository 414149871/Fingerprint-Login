//
//  UIView+UIViewExtension.m
//  UIViewExtension
//
//  Created by 刘嘉豪 on 16/10/9.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "UIView+UIViewExtension.h"

@implementation UIView (UIViewExtension)

- (CGFloat)RL_Width{
    return self.frame.size.width;
}

- (void)setRL_Width:(CGFloat)RL_Width{
    CGRect frame = self.frame;
    frame.size.width = RL_Width;
    self.frame = frame;
}

- (CGFloat)RL_Height{
    return self.frame.size.height;
}

- (void)setRL_Height:(CGFloat)RL_Height{
    CGRect frame = self.frame;
    frame.size.height = RL_Height;
    self.frame = frame;
}

- (CGFloat)RL_x{
    return self.frame.origin.x;
}

- (void)setRL_x:(CGFloat)RL_x{
    CGRect frame = self.frame;
    frame.origin.x = RL_x;
    self.frame = frame;
}

- (CGFloat)RL_y{
    return self.frame.origin.y;
}

- (void)setRL_y:(CGFloat)RL_y{
    CGRect frame = self.frame;
    frame.origin.y = RL_y;
    self.frame = frame;
}

- (CGFloat)RL_centerX{
    return self.center.x;
}

- (void)setRL_centerX:(CGFloat)RL_centerX{
    CGPoint center = self.center;
    center.x = RL_centerX;
    self.center = center;
}

- (CGFloat)RL_centerY{
    return self.center.y;
}

- (void)setRL_centerY:(CGFloat)RL_centerY{
    CGPoint center = self.center;
    center.y = RL_centerY;
    self.center = center;
}

- (CGFloat)RL_right{
    return self.RL_x + self.RL_Width;
}

- (void)setRL_right:(CGFloat)RL_right{
    
    self.RL_x = RL_right - self.RL_Width;
}

- (CGFloat)RL_bottom{
    return self.RL_y + self.RL_Height;
}

- (void)setRL_bottom:(CGFloat)RL_bottom{
    self.RL_y = RL_bottom - self.RL_Height;
}

- (CGSize)RL_size{
    return self.frame.size;
}

- (void)setRL_size:(CGSize)RL_size{
    CGRect frame = self.frame;
    frame.size = RL_size;
    self.frame = frame;
}

@end









































































































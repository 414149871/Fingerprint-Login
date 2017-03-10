//
//  ShowFingerTool.h
//   
//
//  Created by 刘嘉豪 on 2016/12/9.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

//成功返回block
typedef void(^SuccessBlock)();
//错误返回block
typedef void(^ErrorBlock)(NSError *err);

@interface ShowFingerTool : NSObject

@property (nonatomic,copy)SuccessBlock  block;
@property (nonatomic,copy)ErrorBlock  errorBlock;

//指纹验证方法
- (void)showFingerPrintTouchSuccessBlock:(SuccessBlock)block ErrorBlock:(ErrorBlock)errorBlock;
@end

//
//  sidedView.h
//  networking
//
//  Created by slcf888 on 2017/12/14.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface sidedView : UIView

@property (nonatomic, strong) UIView *topView;     //顶部
@property (nonatomic, strong) UIView *bottomView;  //底部

// 旋转
- (void)turnWithDuration:(NSTimeInterval)duration completion:(void(^)(void))completion;

@end

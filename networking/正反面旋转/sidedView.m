
//
//  sidedView.m
//  networking
//
//  Created by slcf888 on 2017/12/14.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "sidedView.h"

@implementation sidedView

- (void)setTopView:(UIView *)topView
{
    _topView =topView;
    
    [self addSubview:topView];
    [self bringSubviewToFront:_topView];
}
- (void)setBottomView:(UIView *)bottomView
{
    _bottomView =bottomView;
    
    [self addSubview:bottomView];
    [self sendSubviewToBack:_bottomView];
    //旋转
    CATransform3D transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
    _bottomView.layer.transform = transform;
}

- (void)turnWithDuration:(NSTimeInterval)duration completion:(void (^)(void))completion
{
    if (!self.topView || !self.bottomView) {
        NSAssert(NO, @"为设置topView or bottomView");
    } // 动画进行到一半的时候将bottonview移到上层
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration/2*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self bringSubviewToFront:self.bottomView];
    });
    //翻转180
    [UIView animateWithDuration:duration animations:^{
        CATransform3D transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
        self.layer.transform = transform;
    } completion:^(BOOL finished) {
        if (completion) {
            completion();
        }
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  UIImageView+SDWebImage.m
//  networking
//
//  Created by slcf888 on 2017/12/13.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "UIImageView+SDWebImage.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (SDWebImage)

- (void)downloadImage:(NSString *)url placeholder:(NSString *)imageName
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:imageName] options:SDWebImageRetryFailed|SDWebImageLowPriority];
}

@end

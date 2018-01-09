//
//  UIImageView+SDWebImage.h
//  networking
//
//  Created by slcf888 on 2017/12/13.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (SDWebImage)

- (void)downloadImage:(NSString *)url placeholder:(NSString *)imageName;

@end

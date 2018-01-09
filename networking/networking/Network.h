//
//  Network.h
//  networking
//
//  Created by slcf888 on 2017/12/13.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Netblock) (id info);

@interface Network : NSObject

@property (nonatomic, copy) Netblock Block;

- (void)getDataWithUrlString:(NSString *)urlString;

@end

//
//  TableViewCell.h
//  networking
//
//  Created by slcf888 on 2017/12/13.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Model;

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;

@property (nonatomic, copy) Model *model;
@end

//
//  TableViewCell.m
//  networking
//
//  Created by slcf888 on 2017/12/13.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "TableViewCell.h"
#import "Model.h"
#import "UIImageView+SDWebImage.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(Model *)model
{
    _model =model;
    _title.text =model.title;
    _title.numberOfLines =0;
    
    NSString *imageName =model.image;
    NSURL *url =[NSURL URLWithString:imageName];
    
    [_image downloadImage:model.image placeholder:@""];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

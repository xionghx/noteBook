//
//  CustomCollectionViewCell.m
//  account book
//
//  Created by xionghuanxin on 6/19/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "CustomCollectionViewCell.h"

@implementation CustomCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.label];
    }
    return self;
}
-(UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]init];
        _imageView.bounds = CGRectMake(0, 0, 30, 25);
        _imageView.center = CGPointMake(30, 20);
    }
    return _imageView;
}
-(UILabel *)label
{
    if (_label == nil) {
        _label =[[UILabel alloc]init];
        _label.bounds = CGRectMake(0, 30, 70, 30);
        _label.center = CGPointMake(30, 60);
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:10];
//        _label.backgroundColor = [UIColor blackColor];
    }
    return _label;
}

@end

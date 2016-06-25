//
//  DisplayView.m
//  account book
//
//  Created by xionghuanxin on 6/19/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "DisplayView.h"

@implementation DisplayView
-(void)layoutSubviews
{
    [self addSubview:self.typeImage];
    [self addSubview:self.typeLabel];
//    [self addSubview:self.decribeLabel];
    [self addSubview:self.amountLabel];
}



#pragma mark --get
-(UILabel *)typeLabel
{
    if (_typeLabel == nil) {
        _typeLabel =[[UILabel alloc]initWithFrame:CGRectMake(60, 0, 60, 60)];
    }
    return _typeLabel;
}
-(UIImageView *)typeImage
{
    if (_typeImage == nil) {
        _typeImage =[[UIImageView alloc]initWithFrame:CGRectMake(0, 15, 30, 30)];
    }
    return _typeImage;
}
-(UILabel *)decribeLabel
{
    if (_decribeLabel == nil) {
        _decribeLabel =[[UILabel alloc]initWithFrame:CGRectMake(315, 0, 60, 0)];
        _decribeLabel.textColor = [UIColor grayColor];
    }
    return _decribeLabel;
}
-(UILabel *)amountLabel
{
    if (_amountLabel == nil) {
        _amountLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_W -195, 0, 180, 60)];
        _amountLabel.textAlignment = NSTextAlignmentRight;
    }
    return _amountLabel;
}
@end

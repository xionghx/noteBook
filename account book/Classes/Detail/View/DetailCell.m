//
//  DetailCell.m
//  account book
//
//  Created by xionghuanxin on 6/16/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "DetailCell.h"
@interface DetailCell ()


@end

@implementation DetailCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
        
    }
    return self;
}


-(void)setupUI
{
    [self addSubview:self.incomeLabel];
    [self addSubview:self.costLabel];
    [self addSubview:self.icomImageView];
}

#pragma mark -get

-(UILabel *)incomeLabel
{
    if (_incomeLabel == nil) {
        _incomeLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0.4 *SCREEN_W, 60)];
        _incomeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _incomeLabel;
}
-(UILabel *)costLabel
{
    if (_costLabel == nil) {
        _costLabel =[[UILabel alloc]initWithFrame:CGRectMake(0.6 * SCREEN_W, 0, 0.4 *SCREEN_W, 60)];
        _costLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _costLabel;
}
-(UIImageView *)icomImageView
{
    if (_icomImageView == nil) {
        _icomImageView = [[UIImageView alloc]init];
        _icomImageView.bounds = CGRectMake(0, 0, 30, 30);
        _icomImageView.center =CGPointMake(0.5 * SCREEN_W, 30);
    }
    return _icomImageView;
}

@end

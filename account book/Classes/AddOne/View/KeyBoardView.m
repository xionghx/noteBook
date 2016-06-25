//
//  KeyBoardView.m
//  account book
//
//  Created by xionghuanxin on 6/17/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "KeyBoardView.h"
#define PICKER_WIDTH  80
#define PICKER_HIGHT  80
//#define asdfaasddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddsdf    20

@interface KeyBoardView ()<UIPickerViewDataSource,UIPickerViewDelegate>
//@property(nonatomic,assign)CGFloat amount;
//@property(nonatomic,strong)NSString *decribe;
@property(nonatomic,strong)UIPickerView *typePicker;

@end


@implementation KeyBoardView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
    }
    return self;
}
-(void)layoutSubviews
{
    NSArray * buttonText = @[@"7",@"8",@"9",@"←",@"4",@"5",@"6",@"备注",@"1",@"2",@"3",@"OK",@"",@"0",@".",@""];
    for (NSInteger index = 0; index< 16 ; index ++) {
        UIButton  *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.bounds = CGRectMake(0,0,(self.width-PICKER_WIDTH)/4-1, self.height/4-1);
//        button.center = CGPointMake((PICKER_WIDTH +(self.width -PICKER_WIDTH)/8 +(self.width -PICKER_WIDTH)/4*(index % 4))-1,(index/4)*(self.height/4)+self.height/8);
        button.frame = CGRectMake((index%4) *self.width/4 ,PICKER_HIGHT + (self.height-PICKER_HIGHT)/4*(index/4), self.width/4-1, (self.height-PICKER_HIGHT)/4-1);
        [button setTitle:buttonText[index] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor grayColor];
        button.alpha = 0.8;
        button.tag = 200 +index;
        [self addSubview:button];
        [button addTarget:self action:@selector(keyBoardButtonTapped:) forControlEvents:UIControlEventTouchUpInside];

    }
    [self viewWithTag:211].frame = CGRectMake([self viewWithTag:211].frame.origin.x, [self viewWithTag:211].frame.origin.y, [self viewWithTag:211].frame.size.width, [self viewWithTag:211].frame.size.height * 2 +2);
    [[self viewWithTag:215] removeFromSuperview];
    
    [self addSubview:self.typePicker];
    
    
}


#pragma mark --get
-(UIPickerView *)typePicker
{
    if (_typePicker ==nil) {
        _typePicker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, self.width, PICKER_HIGHT)];
        _typePicker.dataSource =self;
        _typePicker.delegate = self;
        _typePicker.backgroundColor = [UIColor clearColor];
//        _typePicker.  = [UIColor grayColor];
    }
    return _typePicker;
}

-(void)keyBoardButtonTapped:(UIButton *)sender
{
    switch (sender.tag -200) {
        case 0:
            NSLog(@"keyboard_button_tapped%ld",sender.tag);
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;
        case 5:
            
            break;
        case 6:
            
            break;
        case 7:
            
            break;
        case 8:
            
            break;
        case 9:
            
            break;
        case 10:
            
            break;
        case 11:
            
            break;
        case 12:
            
            break;
        case 13:
            
            break;
        case 14:
            
            break;
            
        default:
            break;
    }
}



// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 3;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return @"a";
}
@end


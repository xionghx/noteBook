//
//  CaculatorViewController.h
//  account book
//
//  Created by xionghuanxin on 6/18/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CaculatorViewController : UIViewController
@property(retain,nonatomic)UIButton *button;
@property(retain,nonatomic)UILabel *label;
@property(retain,nonatomic)NSMutableString *string;
@property(assign,nonatomic)double num1,num2;
@property(assign,nonatomic)NSString *str;
@end

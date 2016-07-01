//
//  InputTextViewController.m
//  account book
//
//  Created by xionghuanxin on 7/1/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "InputTextViewController.h"

@interface InputTextViewController ()
@property(nonatomic,strong)UITextField *accountField;
@property(nonatomic,strong)UITextField *passWrodField;
@property(nonatomic,strong)UIButton*    logInButton;


@end

@implementation InputTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.accountField];
    [self.view addSubview:self.passWrodField];
}



-(UITextField *)accountField
{
    if (_accountField == nil) {
        _accountField = [[UITextField alloc]initWithFrame:CGRectMake(0, 200, SCREEN_W, 100)];
        
    }
    return _accountField;
}

-(UITextField *)passWrodField
{
    if (_passWrodField == nil) {
        _passWrodField = [[UITextField alloc]initWithFrame:CGRectMake(0, 320, SCREEN_W, 100)];

    }
    return _passWrodField;
}

@end

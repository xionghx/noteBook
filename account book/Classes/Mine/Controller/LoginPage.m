//
//  LoginPage.m
//  account book
//
//  Created by xionghuanxin on 7/1/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "LoginPage.h"

@interface LoginPage ()
@property(nonatomic,strong)UITextField *accountField;
@property(nonatomic,strong)UITextField *passwrodField;
@property(nonatomic,strong)UIButton*    loginButton;


@end

@implementation LoginPage

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.accountField];
    [self.view addSubview:self.passwrodField];
}
-(UIButton *)loginButton
{
    if (_loginButton == nil) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.frame = CGRectMake(0.5*(SCREEN_W-120), 500, 120, 50);
    }
    return _loginButton;
}
-(UITextField *)accountField
{
    if (_accountField == nil) {
        _accountField =[[UITextField alloc]initWithFrame:CGRectMake(0, 200, SCREEN_W, 50)];
        _accountField.backgroundColor = [UIColor redColor];
    }
    return _accountField;
}
-(UITextField *)passwrodField
{
    if (_passwrodField == nil) {
        _passwrodField =[[UITextField alloc]initWithFrame:CGRectMake(0, 300, SCREEN_W, 50)];
        _passwrodField.backgroundColor = [UIColor redColor];
    }
    return _passwrodField;
}

@end

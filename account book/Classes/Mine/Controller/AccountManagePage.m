//
//  AccountManagePage.m
//  account book
//
//  Created by xionghuanxin on 7/1/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "AccountManagePage.h"
#import "RegistPage.h"
#import "LoginPage.h"

@interface AccountManagePage ()
@property(nonatomic,strong)UITextField *accountField;
@property(nonatomic,strong)UITextField *passwrodField;
@property(nonatomic,strong)UIButton *   loginButton;
@property(nonatomic,strong)UIButton*    getBackPasswordButton;
@property(nonatomic,strong)UIButton*    registButton;

@end

@implementation AccountManagePage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.registButton];
    [self.view addSubview:self.getBackPasswordButton];
    [self.view addSubview:self.accountField];
    [self.view addSubview:self.passwrodField];
}
-(UIButton *)getBackPasswordButton
{
    if (_getBackPasswordButton == nil) {
        _getBackPasswordButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _getBackPasswordButton.frame = CGRectMake(0, SCREEN_H - 50, 0.5 * SCREEN_W, 50);
        _getBackPasswordButton.backgroundColor = [UIColor redColor];
        [_getBackPasswordButton setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_getBackPasswordButton addTarget:self action:@selector(getBackPassWord) forControlEvents:UIControlEventTouchUpInside];
    }
    return _getBackPasswordButton;
}
-(UIButton *)registButton
{
    if (_registButton == nil) {
        _registButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _registButton.frame = CGRectMake(0.5 * SCREEN_W, SCREEN_H - 50, 0.5 * SCREEN_W, 50);
        _registButton.backgroundColor = [UIColor redColor];
        [_registButton addTarget:self action:@selector(accountRegist) forControlEvents:UIControlEventTouchUpInside];
        [_registButton setTitle:@"注册账号" forState:UIControlStateNormal];
        
    }
    return _registButton;
}

-(UITextField *)accountField
{
    if (_accountField == nil) {
        _accountField =[[UITextField alloc]initWithFrame:CGRectMake(0, 200, SCREEN_W, 80)];
        _accountField.backgroundColor = [UIColor redColor];
        _accountField.placeholder = @"请输入账号";
        [_accountField addTarget:self action:@selector(beginEdit) forControlEvents:UIControlEventEditingDidBegin];
    }
    return _accountField;
}
-(UITextField *)passwrodField
{
    if (_passwrodField == nil) {
        _passwrodField =[[UITextField alloc]initWithFrame:CGRectMake(0, 300, SCREEN_W, 80)];
        _passwrodField.backgroundColor = [UIColor redColor];
        _passwrodField.placeholder =@"请输入密码";
        [_passwrodField addTarget:self action:@selector(beginEdit) forControlEvents:UIControlEventEditingDidBegin];

    }
    return _passwrodField;
}

-(void)beginEdit
{
    LoginPage *newPage = [[LoginPage alloc]init];
    [self presentViewController:newPage animated:YES completion:nil];
}

-(void)getBackPassWord
{
    
}
-(void)accountRegist
{
    RegistPage *newPage = [RegistPage new];
    [self.navigationController pushViewController:newPage animated:YES];
}

@end

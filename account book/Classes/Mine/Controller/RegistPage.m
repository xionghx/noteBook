//
//  RegistPage.m
//  account book
//
//  Created by xionghuanxin on 7/1/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "RegistPage.h"
#import "RegistPageSecondStep.h"
#import <AVOSCloud/AVOSCloud.h>

@interface RegistPage ()
@property(nonatomic,strong)UIButton *nextStepButton;
@property(nonatomic,strong)UITextField *phoneNumberTextField;

@end

@implementation RegistPage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.phoneNumberTextField];
    [self.view addSubview:self.nextStepButton];
}

-(UITextField *)phoneNumberTextField
{
    if (_phoneNumberTextField == nil) {
        _phoneNumberTextField =[[UITextField alloc]initWithFrame:CGRectMake(0, 200, SCREEN_W, 100)];
        _phoneNumberTextField.backgroundColor = [UIColor redColor];
        
    }
    return _phoneNumberTextField;
}

-(UIButton *)nextStepButton
{
    if (_nextStepButton == nil) {
        _nextStepButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextStepButton.frame = CGRectMake(200, 320, 0.2 * SCREEN_W, 50);
        _nextStepButton.backgroundColor = [UIColor redColor];
        [_nextStepButton addTarget:self action:@selector(nextStepButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextStepButton;
}

-(void)nextStepButtonTaped:(UIButton *)sender
{
//    NSLog(@"%@" ,[AVOSCloud getApplicationId]);
//    NSLog(@"%@",[AVOSCloud getClientKey]);
//    [AVOSCloud requestSmsCodeWithPhoneNumber:@"13106085483" callback:^(BOOL succeeded, NSError *error) {
//        if (succeeded) {
            RegistPageSecondStep * newPage = [[RegistPageSecondStep alloc]init];
            newPage.phoneNumeber = @"";
            [self.navigationController pushViewController:newPage animated:YES];
//        }else{
//            NSLog(@"%@",error);
//        }
//    }];
//    
//    
//    [AVUser signUpOrLoginWithMobilePhoneNumberInBackground:@"13577778888" smsCode:@"123456" block:^(AVUser *user, NSError *error) {
//        // 如果 error 为空就可以表示登录成功了，并且 user 是一个全新的用户
//    }];
//    
}
@end

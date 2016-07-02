//
//  RegistPageSecondStep.m
//  account book
//
//  Created by xionghuanxin on 7/1/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "RegistPageSecondStep.h"
#import "XAlertViewHelper.h"
#import <AVOSCloud/AVOSCloud.h>

@interface RegistPageSecondStep ()
//@property(nonatomic,strong)UIButton *testButton;

@end

@implementation RegistPageSecondStep

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton  *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake(0, 0, 100, 100);
    button.center = CGPointMake(200, 200);
    [button setTitle:@"asdfasd" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(taped) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];

    
}

-(void)taped
{
    [XAlertViewHelper showAlertViewWithMessage:@"请输入验证码" target:self block:^(NSString * _Nonnull text) {
        NSLog(@"%@",text);
        [AVUser verifyMobilePhone:text withBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                NSLog(@"%@",[AVUser currentUser]);
            }else{
                NSLog(@"%@",error);
            }
        }];
        [AVUser signUpOrLoginWithMobilePhoneNumberInBackground:self.phoneNumeber smsCode:text block:^(AVUser *user, NSError *error) {
            if (error) {
                NSLog(@"%@",error);
            }else{
                NSLog(@"%@",user);
                [AVUser currentUser].password = @"";
                
            }
        }];

    }];
//    [AVUser signUpOrLoginWithMobilePhoneNumberInBackground:self.phoneNumeber smsCode:@"" block:^(AVUser *user, NSError *error) {
//        user.username = @"";
//        user.password = @"";
//    }];
//    
//        [AVUser signUpOrLoginWithMobilePhoneNumberInBackground:@"13577778888" smsCode:@"123456" block:^(AVUser *user, NSError *error) {
//        // 如果 error 为空就可以表示登录成功了，并且 user 是一个全新的用户
//    }];

}

@end

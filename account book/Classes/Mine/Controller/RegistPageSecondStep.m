//
//  RegistPageSecondStep.m
//  account book
//
//  Created by xionghuanxin on 7/1/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "RegistPageSecondStep.h"
#import "XAlertViewHelper.h"

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
    XAlertViewHelper *aHelper = [[XAlertViewHelper alloc]init];
    [aHelper showAlertViewWithMessage:@"test"];
}

@end

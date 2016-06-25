//
//  WalletViewController.m
//  account book
//
//  Created by xionghuanxin on 6/14/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "WalletViewController.h"

@interface WalletViewController ()

@end

@implementation WalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    
    
    UIView *aView = [[UIView alloc]init];
    aView.center = self.view.center;
    aView.bounds = CGRectMake(100, 100, 100, 100);
    aView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:aView];
//    NSLog(@"aView.frame %@",NSStringFromCGRect(aView.frame));
    
    
    
    UIView *bView = [[UIView alloc]init];
    bView.bounds = CGRectMake(0, 0, 100, 100);
    bView.center = CGPointMake(50, 50);
    bView.backgroundColor = [UIColor redColor];
//    NSLog(@"bView.frame %@",NSStringFromCGRect(bView.frame));

    [aView addSubview:bView];
    

}


@end

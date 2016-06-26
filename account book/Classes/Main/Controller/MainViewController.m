//
//  MainViewController.m
//  account book
//
//  Created by xionghuanxin on 6/14/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "MainViewController.h"
#import "MineViewController.h"
#import "WalletViewController.h"
#import "DetailViewController.h"
#import "AddOneViewController.h"
#import "GraphViewController.h"
#import "XTabBar.h"
#import "XNavigationController.h"
@interface MainViewController ()<XTabBarDelegate>
@property(nonatomic,strong)AddOneViewController *addOneVC;
@property(nonatomic,strong)DetailViewController *detailVC;
@end

@implementation MainViewController
-(void)viewDidAppear:(BOOL)animated
{
    if (self.addOneVC.parentViewIsTranslation ==YES) {
        self.selectedIndex = 0;
        [self.detailVC.detailTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];

    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.detailVC.view.backgroundColor = [UIColor redColor];
//    NSLog(@"na %f",self.navigationController.navigationBar.frame.size.height);
//    NSLog(@"tab %f",self.tabBarController.tabBar.frame.size.height);
//
//    UITabBar *stabBar = self.tabBarController.tabBar;
//    [stabBar setTintColor:[UIColor colorWithRed:0.0 green:176.0/255.0 blue:226.0/255.0 alpha:1.0]];
//    stabBar.selectedImageTintColor = [UIColor clearColor];

    NSArray *viewControllers = @[self.detailVC,[WalletViewController new],[GraphViewController new],[MineViewController new]];
    NSArray *titles =@[@"账单",@"账簿",@"分析",@"设置"];
    NSArray *imageNames =@[@"账单",@"账簿",@"分析",@"设置"];
    NSArray *selectedImageNames =@[@"mingxi_open",@"qianbao_open",@"baobiao_open",@"wode_open"];
    
    for (NSInteger index = 0; index < viewControllers.count; index ++) {
        [self addChildViewController:viewControllers[index] withTitle:titles[index] andImage:[self imageInMainBundleWithName:imageNames[index] andType:@"png" andDirectory:@"image/32dpi"] andSelectedImage:[UIImage imageNamed:selectedImageNames[index]]];
    }
    XTabBar *tabBar = [[XTabBar alloc]init];
    tabBar.xDelegate = self;
    [self setValue:tabBar forKey:@"tabBar"];
//    self.tabBar.barTintColor = [UIColor redColor];

   }
-(void)addChildViewController:(UIViewController *)childController
                    withTitle:(NSString *)title
                     andImage:(UIImage *)image
             andSelectedImage:(UIImage *)selectedImage;
{
    XNavigationController *NVC = [[XNavigationController alloc]initWithRootViewController:childController];
//    childController.title = title;
    childController.tabBarItem.title = title;
    childController.view.backgroundColor = [UIColor whiteColor];
    childController.tabBarItem.image =image ;

//    childController.tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    childController.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:NVC];
}


-(void)tabBarDidClickPlusButton:(XTabBar *)tabBar
{
    NSLog(@"addOneButton tapped!");
    [self presentViewController:self.addOneVC animated:YES completion:nil];
}


-(AddOneViewController *)addOneVC
{
    if (_addOneVC == nil) {
        _addOneVC = [[AddOneViewController alloc]init];
    }
    return _addOneVC;
}

-(DetailViewController *)detailVC
{
    
    if (_detailVC == nil) {
        _detailVC = [[DetailViewController alloc]init];
        _detailVC.view.backgroundColor = [UIColor redColor];
    }
    return _detailVC;
        
}
@end

//
//  NewfeatureViewController.m
//  account book
//
//  Created by xionghuanxin on 6/14/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "NewfeatureViewController.h"
#import "MainViewController.h"
#define NewfeatureCount 4

@interface NewfeatureViewController () <UIScrollViewDelegate>

@property (nonatomic, weak) UIPageControl *pageControl;

@end

@implementation NewfeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.创建scrollView
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    
    // 2.添加图片到scrollView中
    CGFloat scrollW = scrollView.width;
    CGFloat scrollH = scrollView.height;
    for (int i = 0; i < NewfeatureCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(i * scrollW, 0, scrollW, scrollH);
        imageView.image = [self imageInMainBundleWithName:@"2" andType:@"jpg" andDirectory:@"image/other" ];
        [scrollView addSubview:imageView];
        
        if (i == NewfeatureCount - 1) {
            [self setupLastImageView:imageView];
        }
    }
    
    // 3.设置scrollView属性
    scrollView.contentSize = CGSizeMake(NewfeatureCount * scrollW, 0);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.bounces = NO;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    
    // 4.添加pageControl，用于分页
    
    
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = NewfeatureCount;
    pageControl.currentPageIndicatorTintColor = RGBColor(253, 98, 42);
    pageControl.pageIndicatorTintColor = RGBColor(189, 189, 189);
    pageControl.centerX = scrollW * 0.5;
    pageControl.centerY = scrollH - 50;
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
}

- (void)setupLastImageView:(UIImageView *)imageView
{
    // 开启交互
    imageView.userInteractionEnabled = YES;
    
    // 1.分享给大家
    UIButton *shareBtn = [[UIButton alloc] init];
    [shareBtn setImage:[UIImage imageNamed:@"分享"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"分享"] forState:UIControlStateSelected];
    [shareBtn setTitle:@"分享给大家" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    shareBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    shareBtn.size = CGSizeMake(200, 30);
    shareBtn.centerX = imageView.width * 0.5;
    shareBtn.centerY = imageView.height * 0.65;
    [shareBtn addTarget:self action:@selector(shareClick:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:shareBtn];
    
    // EdgeInsets(自切):top left bottom right，其数值分别是相对于当前位置分别距离上，左，下，右的偏移量
    // contentEdgeInsets:会影响按钮内部的所有内容（里面的imageView和titleLabel）
    
    shareBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
    shareBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 5);
    
    // 2.开始微博
    UIButton *startBtn = [[UIButton alloc] init];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"关闭"] forState:UIControlStateNormal];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"关闭"] forState:UIControlStateHighlighted];
//    startBtn.size = CGSizeMake(100, 30);
//    startBtn.centerX = imageView.centerX;
//    startBtn.centerY = imageView.height * 0.75;
    startBtn.frame = CGRectMake(200, 500, 100, 60);
    
    startBtn.backgroundColor = [UIColor redColor];
    [startBtn setTitle:@"开始记账" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(startClick) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:startBtn];
}

- (void)shareClick:(UIButton *)shareBtn
{
    // 状态取反
    shareBtn.selected = !shareBtn.isSelected;
}

- (void)startClick
{
    /*
     切换控制器的手段
     1.push：依赖于UINavigationController，控制器的切换是可逆的，比如A切换到B，B又可以回到A
     2.modal：控制器的切换是可逆的，比如A切换到B，B又可以回到A
     3.切换window的rootViewController
     */
    
    // 切换到MainViewController，NewfeatureViewController会被销毁
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = [[MainViewController alloc] init];
    
}

#pragma mark - UIScrollViewDelegate
// 该代理方法能监听当前scroll的更多属性
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    double page = scrollView.contentOffset.x / scrollView.width;
    // 四舍五入计算出页码
    // 1.3四舍五入 1.3 + 0.5 = 1.8 强转为整数(int)1.8= 1
    // 1.5四舍五入 1.5 + 0.5 = 2.0 强转为整数(int)2.0= 2
    // 1.6四舍五入 1.6 + 0.5 = 2.1 强转为整数(int)2.1= 2
    // 0.7四舍五入 0.7 + 0.5 = 1.2 强转为整数(int)1.2= 1
    self.pageControl.currentPage = (int)(page + 0.5);
}

/*
 1.程序启动会自动加载叫做Default的图片
 1> 3.5inch 非retain屏幕：Default.png
 2> 3.5inch retina屏幕：Default@2x.png
 3> 4.0inch retain屏幕: Default-568h@2x.png
 
 2.只有程序启动时自动去加载的图片, 才会自动在4inch retina时查找-568h@2x.png
 */

/*
 一个控件用肉眼看不见，有哪些可能
 1.根本没有创建实例化这个控件
 2.没有设置尺寸
 3.控件的颜色跟父控件的背景色一样（实际上已经显示了，只不过用肉眼看不见）
 4.透明度alpha <= 0.01
 5.hidden = YES
 6.没有添加到父控件中
 7.被其他控件挡住了
 8.位置不对
 9.父控件发生了以上情况
 10.特殊情况
 * UIImageView没有设置image属性，或者设置的图片名不对
 * UILabel没有设置文字，或者文字颜色和跟父控件的背景色一样
 * UITextField没有设置文字，或者没有设置边框样式borderStyle
 * UIPageControl没有设置总页数，不会显示小圆点
 * UIButton内部imageView和titleLabel的frame被篡改了，或者imageView和titleLabel没有内容
 * .....
 
 添加一个控件的建议（调试技巧）：
 1.最好设置背景色和尺寸
 2.控件的颜色尽量不要跟父控件的背景色一样
 */


@end

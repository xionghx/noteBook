//
//  XTabBar.h
//  account book
//
//  Created by xionghuanxin on 6/14/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XTabBar;
@protocol XTabBarDelegate<UITabBarDelegate>

@optional
-(void)tabBarDidClickPlusButton:(XTabBar *)tabBar;
@end


@interface XTabBar : UITabBar

@property(nonatomic,weak)id<XTabBarDelegate> xDelegate;

@end

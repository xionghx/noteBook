//
//  DetailViewController.h
//  account book
//
//  Created by xionghuanxin on 6/14/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property(nonatomic,strong)UITableView *detailTable;

+(instancetype)detailViewControllerWithHiddenNavigationController:(BOOL)hidden;
@end

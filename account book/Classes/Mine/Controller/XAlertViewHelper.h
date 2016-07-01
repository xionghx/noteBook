//
//  XAlertViewHelper.h
//  account book
//
//  Created by xionghuanxin on 7/1/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^XAlertViewHelperFinishBlock)(BOOL confirm, NSString *text);



@interface XAlertViewHelper : UIViewController

- (void)showInputAlertViewWithMessage:(NSString *)message block:(XAlertViewHelperFinishBlock)block;

- (void)showConfirmAlertViewWithMessage:(NSString *)message block:(XAlertViewHelperFinishBlock)block;

- (void)showAlertViewWithMessage:(NSString *)message;


@end

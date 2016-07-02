//
//  XAlertViewHelper.h
//  account book
//
//  Created by xionghuanxin on 7/1/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^XAlertViewHelperFinishBlock)(NSString * _Nonnull text);



@interface XAlertViewHelper : NSObject

+(void)showAlertViewWithMessage:(NSString * _Nonnull)message target:(id _Nonnull)target block:(XAlertViewHelperFinishBlock _Nonnull)block;
//- (void)showInputAlertViewWithMessage:(NSString *)message block:(XAlertViewHelperFinishBlock)block;
//
//- (void)showConfirmAlertViewWithMessage:(NSString *)message block:(XAlertViewHelperFinishBlock)block;
//
//- (void)showAlertViewWithMessage:(NSString *)message;


@end

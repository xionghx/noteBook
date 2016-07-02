//
//  XAlertViewHelper.m
//  account book
//
//  Created by xionghuanxin on 7/1/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "XAlertViewHelper.h"


@interface XAlertViewHelper()

@property (nonatomic, copy) XAlertViewHelperFinishBlock finishBlock;

@property (nonatomic, assign) UIAlertViewStyle alertViewStyle;

@property (nonatomic, strong) NSString *inputText;

@property (nonatomic, assign) BOOL result;

@end

@implementation XAlertViewHelper

+(void)showAlertViewWithMessage:(NSString * _Nonnull)message target:(id _Nonnull)target block:(XAlertViewHelperFinishBlock _Nonnull)block{
 //    aHelper.finishBlock = block;
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//    self.alertViewStyle = style;
//    alertView.alertViewStyle = style;
//    [alertView show];
    
    //IOS9.0后
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
   
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        aHelper.result = YES;
//        aHelper.finishBlock(aHelper.result, aHelper.inputText);
//        aHelper.inputText = alertController.textFields[0].text;
//        aHelper.finishBlock = nil;
//        aHelper.result = NO;
        
        block(alertController.textFields[0].text);
        
    }];
    [alertController addAction:sureAction];
    
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        aHelper.inputText = nil;
//        aHelper.finishBlock = nil;
//        aHelper.result = NO;
    }];
    [alertController addAction:cancelAction];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
    }];
        [target presentViewController:alertController animated:YES completion:^{
        
    }];
    
//    [self presentViewController:alertController animated:YES completion:^{
//    }];

}

//- (void)showInputAlertViewWithMessage:(NSString *)message block:(XAlertViewHelperFinishBlock)block {
//    [self showAlertViewWithMessage:message type:UIAlertViewStylePlainTextInput block:block];
//}
//
//- (void)showConfirmAlertViewWithMessage:(NSString *)message block:(XAlertViewHelperFinishBlock)block {
//    [self showAlertViewWithMessage:message type:UIAlertViewStyleDefault block:block];
//}
//
//- (void)showAlertViewWithMessage:(NSString *)message {
////    [[[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil] show];
//    
//    [self showAlertViewWithMessage:message type:UIAlertViewStyleDefault block:nil];
//}

//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
//    if (buttonIndex == 1) {
//        self.result = YES;
//        if (self.alertViewStyle == UIAlertViewStylePlainTextInput) {
//            self.inputText = [alertView textFieldAtIndex:0].text;
//        }
//    }
//}
//
//- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
//    if (self.finishBlock) {
//        self.finishBlock(self.result, self.inputText);
//    }
//    self.inputText = nil;
//    self.finishBlock = nil;
//    self.result = NO;
//}

@end


//
//  ShareData.h
//  account book
//
//  Created by xionghuanxin on 6/17/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShareData : NSObject
@property(nonatomic,strong)NSMutableDictionary *AccountBook;
@property(nonatomic,strong)NSMutableDictionary *Account;
+(instancetype)shareData;

@end

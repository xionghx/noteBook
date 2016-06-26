//
//  ShareData.m
//  account book
//
//  Created by xionghuanxin on 6/17/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "ShareData.h"

@implementation ShareData
+(instancetype)shareData

{
    static ShareData *instance = nil;
    if (instance ==nil) {
        instance = [[ShareData alloc]init];
    }
    return instance;
}

@end

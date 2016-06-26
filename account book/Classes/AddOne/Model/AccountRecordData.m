//
//  AccountRecordData.m
//  account book
//
//  Created by xionghuanxin on 6/19/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "AccountRecordData.h"

@implementation AccountRecordData
+(instancetype)shareData

{
    static AccountRecordData *instance = nil;
    if (instance ==nil) {
        instance = [[AccountRecordData alloc]init];
        instance.allRecord = @{}.mutableCopy;
        instance.recordTimeKey = @[].mutableCopy;
    }
    return instance;
}

@end

//
//  AccountRecordData.h
//  account book
//
//  Created by xionghuanxin on 6/19/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Record.h"

@interface AccountRecordData : NSObject
@property(nonatomic,strong)NSMutableArray *recordTimeKey;
@property(nonatomic,strong)NSMutableDictionary *allRecord;
+(instancetype)shareData;
@end

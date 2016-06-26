//
//  Record.h
//  account book
//
//  Created by xionghuanxin on 6/19/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Record : NSObject<NSCoding>
@property(nonatomic,strong)NSString * amountOfMoney;
@property(nonatomic,strong)NSString * reMark;
@property(nonatomic,strong)NSString *imageName;
@property(nonatomic,strong)NSString *recordDate;
@property(nonatomic,strong)NSString *type;
@property(nonatomic,strong)NSString *account;


@property ( nonatomic, retain) NSDate *date;
@property ( nonatomic, retain) NSString *accountType;
@property ( nonatomic, retain) NSString *describe;
@property ( nonatomic, retain) NSString *recordType;
@property ( nonatomic, retain) NSNumber *money;
@property ( nonatomic, retain) NSString *remark;
@property ( nonatomic, retain) NSString *remarkPictureName;

@end

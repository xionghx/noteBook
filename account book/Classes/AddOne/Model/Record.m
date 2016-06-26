//
//  Record.m
//  account book
//
//  Created by xionghuanxin on 6/19/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "Record.h"
@interface Record()
@end

@implementation Record


- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_amountOfMoney forKey:@"amountOfMoney"];
    [aCoder encodeObject:_reMark forKey:@"reMark"];
    [aCoder encodeObject:_imageName forKey:@"imageName"];
    [aCoder encodeObject:_recordDate forKey:@"recordDate"];
    [aCoder encodeObject:_type forKey:@"type"];
    [aCoder encodeObject:_account forKey:@"account"];
    [aCoder encodeObject:_describe forKey:@"describe"];

}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder // NS_DESIGNATED_INITIALIZER
{
    self = [super init];
    if (self) {
        _amountOfMoney = [aDecoder decodeObjectForKey:@"amountOfMoney"];
        _reMark = [aDecoder decodeObjectForKey:@"reMark"];
        _imageName = [aDecoder decodeObjectForKey:@"imageName"];
        _recordDate = [aDecoder decodeObjectForKey:@"recordDate"];
        _type = [aDecoder decodeObjectForKey:@"type"];
        _account = [aDecoder decodeObjectForKey:@"account"];
        _describe = [aDecoder decodeObjectForKey:@"describe"];
        
    }
    return self;

}

-(NSString *)description
{
    return [NSString stringWithFormat:@"amountOfMoney = %@  reMark = %@  imageName = %@ recordDate = %@ type = %@  account = %@  describe = %@",_amountOfMoney,_reMark,_imageName,_recordDate,_type,_account,_describe];
}

@end

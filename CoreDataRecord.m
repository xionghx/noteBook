//
//  CoreDataRecord.m
//  account book
//
//  Created by xionghuanxin on 6/21/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "CoreDataRecord.h"

@implementation CoreDataRecord
+(NSString *)entityName
{
    return @"CoreDataRecord";
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"%@  %@ %@",self.recordType, self.date,self.describe];
}
@end

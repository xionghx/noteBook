//
//  IncomeDescribe.m
//  account book
//
//  Created by xionghuanxin on 6/22/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "IncomeDescribe.h"

@implementation IncomeDescribe

// Insert code here to add functionality to your managed object subclass
+(NSString *)entityName
{
    return @"IncomeDescribe";
}
-(NSString *)description
{
    return [NSString stringWithFormat:@"%@  %@",self.describe,self.imageName];
}
@end

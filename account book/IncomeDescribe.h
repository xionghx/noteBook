//
//  IncomeDescribe.h
//  account book
//
//  Created by xionghuanxin on 6/22/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface IncomeDescribe : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
+(NSString *)entityName;

@end

NS_ASSUME_NONNULL_END

#import "IncomeDescribe+CoreDataProperties.h"

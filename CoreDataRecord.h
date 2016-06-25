//
//  CoreDataRecord.h
//  account book
//
//  Created by xionghuanxin on 6/21/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataRecord : NSManagedObject
+(NSString *)entityName;
// Insert code here to declare functionality of your managed object subclass

@end

NS_ASSUME_NONNULL_END

#import "CoreDataRecord+CoreDataProperties.h"

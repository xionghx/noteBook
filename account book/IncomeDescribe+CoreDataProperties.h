//
//  IncomeDescribe+CoreDataProperties.h
//  account book
//
//  Created by xionghuanxin on 6/22/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "IncomeDescribe.h"

NS_ASSUME_NONNULL_BEGIN

@interface IncomeDescribe (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *describe;
@property (nullable, nonatomic, retain) NSString *imageName;

@end

NS_ASSUME_NONNULL_END

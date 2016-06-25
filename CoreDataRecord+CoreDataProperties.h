//
//  CoreDataRecord+CoreDataProperties.h
//  account book
//
//  Created by xionghuanxin on 6/21/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CoreDataRecord.h"

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataRecord (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSString *accountType;
@property (nullable, nonatomic, retain) NSString *describe;
@property (nullable, nonatomic, retain) NSString *recordType;
@property (nullable, nonatomic, retain) NSNumber *money;
@property (nullable, nonatomic, retain) NSString *remark;
@property (nullable, nonatomic, retain) NSString *remarkPictureName;
@property (nonatomic, assign) Boolean hidden;

@end

NS_ASSUME_NONNULL_END

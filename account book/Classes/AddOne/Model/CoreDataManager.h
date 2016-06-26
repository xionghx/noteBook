//
//  CoreDataManager.h
//  CoreDataLearnDemo
//
//  Created by Iracle Zhang on 6/8/16.
//  Copyright © 2016 Iracle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataManager : NSObject
//存
+ (BOOL)saveObjectWithParameters:(NSDictionary *)info entityName:(NSString *)entityName;
//查询
+ (NSArray *)searchWithEntityName:(NSString *)entityName predicateString:(NSString *)predicateString;

//删除
+ (BOOL)removeWithEntityName:(NSString *)entityName predicateString:(NSString *)predicateString;

@end













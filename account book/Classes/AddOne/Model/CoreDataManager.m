//
//  CoreDataManager.m
//  CoreDataLearnDemo
//
//  Created by Iracle Zhang on 6/8/16.
//  Copyright © 2016 Iracle. All rights reserved.
//

#import "CoreDataManager.h"
#import "AppDelegate.h"

@implementation CoreDataManager

+ (NSManagedObjectContext *)getObjectContext {
    return [(AppDelegate *)[UIApplication sharedApplication].delegate managedObjectContext];
}

+ (BOOL)saveObjectWithParameters:(NSDictionary *)info entityName:(NSString *)entityName {
    if (entityName.length == 0) {
        return nil;
    }
    //获取上下文
    NSManagedObjectContext *context = [self getObjectContext];
    //用实体名初始化模型对象
    NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:context];
    //存储数据
    for (NSString *key in info) {
        [object setValue:info[key] forKey:key];
    }
    //把数据存入实体(表)
    BOOL success = [context save:nil];
    
    return success;
}

+ (NSArray *)searchWithEntityName:(NSString *)entityName predicateString:(NSString *)predicateString {
    if (entityName.length == 0) {
        return nil;
    }
    NSManagedObjectContext *context = [self getObjectContext];

    //用实体名初始化查询类
    NSFetchRequest *fetchRequest= [NSFetchRequest fetchRequestWithEntityName:entityName];
    //判断查询条件
    if (predicateString.length > 0) {
        fetchRequest.predicate = [NSPredicate predicateWithFormat:predicateString];
    }
    //执行查询
    NSArray *resuts = [context executeFetchRequest:fetchRequest error:nil];
    
    return resuts;
}

+ (BOOL)removeWithEntityName:(NSString *)entityName predicateString:(NSString *)predicateString {
    
    NSManagedObjectContext *context = [self getObjectContext];

    //查询
    NSArray *resuts = [self searchWithEntityName:entityName predicateString:predicateString];
    //数据对象的删除
    for (id object in resuts) {
        [context deleteObject:object];
    }
    //同步
    BOOL success =  [context save:nil];
    return success;
}
@end






















//
//  NSObject+FileWithBundle.h
//  account book
//
//  Created by xionghuanxin on 6/18/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (FileWithBundle)


-(UIImage *)imageInMainBundleWithName:(NSString *)name
                              andType:(NSString *)type
                         andDirectory:(NSString *)directory;


-(NSDictionary *)dictionaryFromDirectory:(NSString *)directory
                            withFileName:(NSString *)name
                                 andType:(NSString *)type;
-(NSDictionary *)dictionaryByUserDefaultsWithKey:(NSString *)key;

-(NSArray *)arrayByUserDefaultsWithKey:(NSString *)key;


@end

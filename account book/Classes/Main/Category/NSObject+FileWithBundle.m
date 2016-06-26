//
//  NSObject+FileWithBundle.m
//  account book
//
//  Created by xionghuanxin on 6/18/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "NSObject+FileWithBundle.h"

@implementation NSObject (FileWithBundle)
-(UIImage *)imageInMainBundleWithName:(NSString *)name
                              andType:(NSString *)type
                         andDirectory:(NSString *)directory
{
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:type inDirectory:directory];
//    NSLog(@"%@",[NSBundle mainBundle]);
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    return image;
}

-(NSDictionary *)dictionaryFromDirectory:(NSString *)directory
                            withFileName:(NSString *)name
                                 andType:(NSString *)type
{
    return [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:type inDirectory:directory]];
}

-(NSDictionary *)dictionaryByUserDefaultsWithKey:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:key];
}

-(NSArray *)arrayByUserDefaultsWithKey:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:key];
}
@end

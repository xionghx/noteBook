//
//  MineViewController.m
//  account book
//
//  Created by xionghuanxin on 6/14/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    [self learnSandbox];
  

}
- (void)learnSandbox {
    //获取沙盒路径
    //1.主路径
    NSString *homeString = NSHomeDirectory();
//    NSLog(@"主路径：%@",homeString);
    //2.Documents 路径
    NSString *documentsString = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//    NSLog(@"%@",NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) );
//    NSLog(@"Documents:%@",documentsString);
    //3.Library 路径
    NSString *libraryString = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
//    NSLog(@"Library:%@",libraryString);
    //4.tmp 路径
    NSString *tmpString = NSTemporaryDirectory();
//    NSLog(@"tmp:%@",tmpString);
    
    //保存图片到沙盒
    //1.保存图片的路径
    NSString *saveImagePath = [documentsString stringByAppendingString:@"/p"];
    //2.获取图片对象
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"2" ofType:@"jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
//    NSLog(@"%p",image);
    //3.把图片转换为data
    NSData *data = UIImagePNGRepresentation(image);
    //4.把图片数据(data)写入沙盒
    NSFileManager *manager = [NSFileManager defaultManager];
//    if (![manager fileExistsAtPath:saveImagePath]) {
        //如果文件不存在，保存
//        BOOL success = [manager createFileAtPath:saveImagePath contents:data attributes:nil];
//        NSLog(@"图片是否保存成功：%d path:%@", success,saveImagePath);
    
//    }
    
//    //读取沙盒文件
    UIImageView *imageView =[[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageWithContentsOfFile:saveImagePath];
    [self.view addSubview: imageView];
//
//    //删除沙盒文件
//    NSError *error = nil;
//        BOOL removed = [manager removeItemAtPath:saveImagePath error:&error];
//         NSLog(@"是否删除：%d", removed);
    
    
}

-(BOOL)cleanValueInDirectory:(NSString *)directory
{
    return YES;
}
- (BOOL)cleanValueWithPath:(NSString *)path
                    andName:(NSString *)name
{
    //1.获取路径
    NSString *plistPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    plistPath = [plistPath stringByAppendingString:[NSString stringWithFormat:@"/%@",name]];
    //2.从沙盒移除数据
    NSFileManager *manager = [NSFileManager defaultManager];
    
    BOOL success =  [manager removeItemAtPath:plistPath error:nil];
    
    //NSUserDefaults 简单的数据持久化技术
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"c"];
    return success;
    
}

- (void)nsstringFromPath:(NSString *)path
                withName:(NSString *)name

{
//    //1.获取路径
//    NSString *plistPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//    plistPath = [plistPath stringByAppendingString:@"/data.plist"];
//    //2.读取数据
//    NSArray *results = [NSArray arrayWithContentsOfFile:plistPath];
//    //3.解档
//    NSData *data = results[0];
//    Contact *aContact = [NSKeyedUnarchiver unarchiveObjectWithData:data];
//    NSLog(@"解档都的联系人：%@",aContact);
//    
//    //NSUserDefaults 简单的数据持久化技术
//    NSDictionary *dic = [[NSUserDefaults standardUserDefaults] objectForKey:@"c"];
//    NSLog(@"联系人字典：%@",dic);
    
    
    
}


@end

//
//  DetailViewController.m
//  account book
//
//  Created by xionghuanxin on 6/14/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailCell.h"
#import "Record.h"
#import "CoreDataRecord.h"
#import "AppDelegate.h"
#import "IncomeDescribe.h"

#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H [UIScreen mainScreen].bounds.size.height
#define TABBAR_H 49.00
#define NAVIGATIONBAR_H 44.00

@interface DetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UIScrollView *displayScroll;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *totalIncomeLabel;
@property(nonatomic,strong)UILabel *toatlCostLabel;
@property(nonatomic,strong)UIImageView *MonthlyBudgetImageView;
@property(nonatomic,strong)NSMutableArray *dataSource;
@property(nonatomic,strong)NSFetchRequest *fetchRequest;
@end

@implementation DetailViewController
{
    NSManagedObjectContext *_context;

}
+(instancetype)detailViewControllerWithHiddenNavigationController:(BOOL)hidden
{
    DetailViewController *detailViewController = [[DetailViewController alloc]init];
    detailViewController.navigationController.navigationBarHidden = hidden;
    return detailViewController;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _context = [(AppDelegate *)[UIApplication sharedApplication].delegate managedObjectContext];

    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.detailTable reloadData];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"%d",self.navigationController.navigationBarHidden);
//    [self.detailTable scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
//    [self.detailTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view addSubview:[[UIImageView alloc]initWithImage:[self imageInMainBundleWithName:@"2" andType:@"jpg" andDirectory:@"image/other" ]]];

    self.navigationController.navigationBarHidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.displayScroll];
//    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[self imageInMainBundleWithName:@"2" andType:@"jpg" andDirectory:@"image/other" ]]];

    
}


#pragma mark -- <UITableViewDataSource,UITableViewDelegate>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = self.dataSource.count -indexPath.row-1;
    
    if (indexPath.row ==49) {
        UITableViewCell *cell = [[UITableViewCell alloc]init];
        cell.textLabel.text = @"11234";
        return cell;
    }
    static NSString *reUseMark = @"DetailPageCell";
    DetailCell * cell = [tableView dequeueReusableCellWithIdentifier:reUseMark];
    if (cell == nil) {
        cell = [[DetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reUseMark];
    }
 
    Record * aRecord = self.dataSource[index];
    if ([aRecord.type isEqualToString:@"income"]) {
        cell.incomeLabel.text = [NSString stringWithFormat:@"%@ %@元",aRecord.describe,aRecord.amountOfMoney];
        cell.costLabel.text = @"";
        cell.icomImageView.image = [self imageInMainBundleWithName:aRecord.imageName andType:@"png" andDirectory:@"image/incomeIcon"];
    }else
    {
        [self recordFromCoreData];
        cell.incomeLabel.text =@"";
//        cell.incomeLabel.text = [NSString stringWithFormat:@"%@",[self recordFromCoreData][0][@"money"]];
        cell.icomImageView.image = [self imageInMainBundleWithName:aRecord.imageName andType:@"png" andDirectory:@"image/costIcon"];
        cell.costLabel.text = [NSString stringWithFormat:@"%@元 %@",aRecord.amountOfMoney,aRecord.describe];
    }
    
      cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [self.navigationController pushViewController:[super init] animated:YES];
//    NSLog(@"self%@",self.navigationController);
}


#pragma mark --get
-(UIImageView *)MonthlyBudgetImageView
{
    if (_MonthlyBudgetImageView == nil) {
        _MonthlyBudgetImageView = [[UIImageView alloc]init];
        _MonthlyBudgetImageView.bounds = CGRectMake(0, 0, 100, 100) ;
        _MonthlyBudgetImageView.center = CGPointMake(0.5 * SCREEN_W, 50);
    }
    return _MonthlyBudgetImageView;
}
-(UITableView *)detailTable
{
    if (_detailTable == nil) {
        _detailTable = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVIGATIONBAR_H + 100, SCREEN_W, SCREEN_H-TABBAR_H-100) style:UITableViewStylePlain];
        _detailTable.dataSource = self;
        _detailTable.delegate = self;
        _detailTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _detailTable.backgroundColor = [UIColor clearColor];

    }
    return _detailTable;
}

-(UILabel *)titleLabel
{
    if (_titleLabel ==nil) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, NAVIGATIONBAR_H, SCREEN_W, 100)];
        _titleLabel.text = @"月统计:";
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.backgroundColor = [UIColor clearColor];
        [_titleLabel addSubview:self.MonthlyBudgetImageView];
        [_titleLabel addSubview:self.totalIncomeLabel];
        [_titleLabel addSubview:self.toatlCostLabel];
    }
    return _titleLabel;
}
-(NSFetchRequest *)fetchRequest
{
    if (_fetchRequest ==nil) {
        _fetchRequest =[NSFetchRequest fetchRequestWithEntityName:[CoreDataRecord entityName]];
    }
    return _fetchRequest;
}

-(UIScrollView *)displayScroll
{
    if (_displayScroll == nil) {
        _displayScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0, SCREEN_W, SCREEN_H-TABBAR_H)];
        _displayScroll.contentSize = CGSizeMake(SCREEN_W, 1.001*SCREEN_H-TABBAR_H);
        [_displayScroll addSubview:self.titleLabel];
        [_displayScroll addSubview:self.detailTable];

    }
    return _displayScroll;
}
-(NSMutableArray *)dataSource
{
    if (_dataSource ==nil) {
        _dataSource =@[].mutableCopy;
        
    }
    NSMutableString *plistPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject].mutableCopy;
    [plistPath appendString:@"/record.plist"];
    
    NSArray *results = [NSArray arrayWithContentsOfFile:plistPath];
    [_dataSource removeAllObjects];
    for (NSData *data in results) {
        Record *aRecord = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        [_dataSource addObject:aRecord];
//        NSLog(@"%@",aRecord);
        
    }
    return _dataSource;

}


-( void)recordFromCoreData
{
    NSError *error = nil;
    
    NSArray *records = [_context executeFetchRequest:[NSFetchRequest fetchRequestWithEntityName:[CoreDataRecord entityName]] error:&error];
    NSLog(@"%@",records);
//    return records[0][@"name"];
    
    NSArray *describs =[_context executeFetchRequest:[NSFetchRequest fetchRequestWithEntityName:[IncomeDescribe entityName]] error:&error];
    NSLog(@"%@",describs);
}

@end

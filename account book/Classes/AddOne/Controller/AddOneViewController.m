//
//  AddOneViewController.m
//  account book
//
//  Created by xionghuanxin on 6/14/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "AddOneViewController.h"
#import "AppDelegate.h"
#import "IncomeCollection.h"
#import "CostCollection.h"
#import "CaculatorViewController.h"
#import "KeyBoardView.h"
#import "Record.h"
#import "AccountRecordData.h"
#import "DisplayView.h"
#import "CoreDataRecord.h"
#define KEYBOARD_TITLE 80


@interface AddOneViewController ()<IncomeCollectionGusture,CostCollectionGusture,UIScrollViewDelegate>
@property(nonatomic,strong)UISegmentedControl *typeSegment;
//@property(nonatomic,strong)UILabel *displayLabel;
@property(nonatomic,strong)UIScrollView *iconsView;
@property(nonatomic,strong)UIButton *backButton;
@property(nonatomic,strong)UIView *keyBoardView;
@property(nonatomic,strong)IncomeCollection *incomeCollection;
@property(nonatomic,strong)CostCollection *costCollection;
@property(nonatomic,assign)double amountOfMoney;
@property(nonatomic,strong)NSMutableString *amount;
@property(nonatomic,strong)DisplayView *displayView;
@property(nonatomic,assign)NSInteger selectedRowInIncome;
@property(nonatomic,assign)NSInteger selectedRowInCost;
@property(nonatomic,strong)UIDatePicker *datePicker;

@end

@implementation AddOneViewController
{
    NSManagedObjectContext *_context;

}
static NSString *cellReUseMark = @"collectionViewCell";


- (instancetype)init
{
    self = [super init];
    if (self) {
        _amount = [[NSMutableString alloc]init];
        _context = [(AppDelegate *)[UIApplication sharedApplication].delegate managedObjectContext];

    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.parentViewIsTranslation = NO;

}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.typeSegment];
    [self.view addSubview:self.displayView];
    [self.view addSubview:self.iconsView];
    [self.view addSubview:self.keyBoardView];
    [self.view addSubview:self.backButton];

    
}




#pragma mark --get
-(UIButton *)backButton
{
    if (_backButton ==nil) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backButton.bounds = CGRectMake(0, 0, 40, 40);
        _backButton.center = CGPointMake(350, 45);
        [_backButton setImage:[self imageInMainBundleWithName:@"向下" andType:@"png" andDirectory:@"image/other"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//        _backButton.backgroundColor = [UIColor redColor];

    }
    return _backButton;
}
-(DisplayView *)displayView
{
    if (_displayView == nil) {
        _displayView = [[DisplayView alloc]initWithFrame:CGRectMake(0, 80, SCREEN_W, 60)];
//        _displayView.amountLabel.text =@"0.00";
//        self.amount = @"0.00".mutableCopy;
        [self updateDisplayValue];
 
    }
        return _displayView;
}

-(UIView *)keyBoardView
{
    if (_keyBoardView ==nil) {
        _keyBoardView = [[UIView alloc]initWithFrame:CGRectMake(0, 400, self.view.width, 267)];
        NSArray * buttonText = @[@"7",@"8",@"9",@"←",@"4",@"5",@"6",@"备注",@"1",@"2",@"3",@"OK",@"X",@"0",@".",@""];
        for (NSInteger index = 0; index< 16 ; index ++) {
            UIButton  *button = [UIButton buttonWithType:UIButtonTypeCustom];
            //        button.bounds = CGRectMake(0,0,(self.width-PICKER_WIDTH)/4-1, self.height/4-1);
            //        button.center = CGPointMake((PICKER_WIDTH +(self.width -PICKER_WIDTH)/8 +(self.width -PICKER_WIDTH)/4*(index % 4))-1,(index/4)*(self.height/4)+self.height/8);
            button.frame = CGRectMake((index%4) *_keyBoardView.width/4 , KEYBOARD_TITLE+ (_keyBoardView.height-KEYBOARD_TITLE)/4*(index/4), _keyBoardView.width/4-1, (_keyBoardView.height-KEYBOARD_TITLE)/4-1);
            [button setTitle:buttonText[index] forState:UIControlStateNormal];
            button.backgroundColor = [UIColor grayColor];
            button.alpha = 0.8;
            button.tag = 200 +index;
            [_keyBoardView addSubview:button];
            [button addTarget:self action:@selector(keyBoardButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        [_keyBoardView viewWithTag:211].frame = CGRectMake([_keyBoardView viewWithTag:211].frame.origin.x, [_keyBoardView viewWithTag:211].frame.origin.y, [_keyBoardView viewWithTag:211].frame.size.width, [_keyBoardView viewWithTag:211].frame.size.height * 2 +2);
//        [(UIButton *)[_keyBoardView viewWithTag:211] addTarget:self action:@selector(AddARecord:) forControlEvents:UIControlEventTouchUpInside ];
        [[_keyBoardView viewWithTag:215] removeFromSuperview];
        
//        [_keyBoardView addSubview:_keyBoardView.typePicker];

    }
    return _keyBoardView;
}
//-(KeyBoardView *)keyboardView
//{
//    if (_keyboardView ==nil) {
//        _keyboardView = [[KeyBoardView alloc]initWithFrame:CGRectMake(0, 400, self.view.width, 267)];
//        
//    }
//    return _keyboardView;
//}
-(UISegmentedControl *)typeSegment
{
    if (_typeSegment ==nil) {
        _typeSegment = [[UISegmentedControl alloc]initWithItems:@[@"收入",@"支出",@"转账"]];
        _typeSegment.center = self.view.center;
        _typeSegment.y = 30;
        _typeSegment.tintColor = [UIColor grayColor];
        [_typeSegment addTarget:self action:@selector(typeSegmentTaped:) forControlEvents:UIControlEventValueChanged];
        _typeSegment.selectedSegmentIndex = 1;

    }
    return _typeSegment;
}

//
//-(UILabel *)displayLabel
//{
//    if (_displayLabel ==nil) {
//        _displayLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 60,self.view.width, 55)];
//        _displayLabel.backgroundColor = [UIColor grayColor];
//    }
//    return _displayLabel;
//}

-(UIScrollView *)iconsView
{
    if (_iconsView ==nil) {
        _iconsView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 150, self.view.width, 600)];
        _iconsView.contentSize = CGSizeMake(3*self.view.width, 300);
        _iconsView.pagingEnabled = YES;
        [_iconsView addSubview:self.incomeCollection];
        [_iconsView addSubview:self.costCollection];
        _iconsView.delegate = self;
        [_iconsView setContentOffset:CGPointMake( SCREEN_W, 0) animated:YES];
        
    }
    return _iconsView;
}

-(IncomeCollection *)incomeCollection
{
    if (_incomeCollection == nil) {
        _incomeCollection = [[IncomeCollection alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 600) collectionViewLayout:[self layout]];
        
    }
    _incomeCollection.GestureDelegate = self;
    return _incomeCollection;
}
-(CostCollection *)costCollection
{
    if (_costCollection == nil) {
        _costCollection = [[CostCollection alloc]initWithFrame:CGRectMake(self.view.width, 0, self.view.width, 600) collectionViewLayout:[self layout]];
        _costCollection.GestureDelegate = self;
        
    }
    return _costCollection;
}

-(UICollectionViewFlowLayout *)layout//设置布局
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //配置item的尺寸
    layout.itemSize = CGSizeMake(60, 80);
    //item 之间的最小间距
    layout.minimumInteritemSpacing = 20;
    //item 每一行之间的最小间距
    layout.minimumLineSpacing = 20;
    //header
    layout.headerReferenceSize = CGSizeMake(20, 20);
    //footer
    layout.footerReferenceSize = CGSizeMake(20, 20);
    return layout;
}

//---------------------------------------------selector
-(void)typeSegmentTaped:(UISegmentedControl *)sender
{
    switch (sender.selectedSegmentIndex) {
        case 0:
            [self.iconsView setContentOffset:CGPointMake(0, 0) animated:YES];
            break;
        case 1:
            [self.iconsView setContentOffset:CGPointMake( SCREEN_W, 0) animated:YES];
            
            break;
        case 2:
            [self.iconsView setContentOffset:CGPointMake(2*SCREEN_W, 0) animated:YES];
            
            break;
            
        default:
            break;
    }
}


-(void)keyBoardButtonTapped:(UIButton *)sender
{
    NSRange rangeOfPoint = [self.amount rangeOfString:@"."];
    static NSString *str = @"";
    static NSInteger length = 7;
//    CaculatorViewController *caculator = [[CaculatorViewController alloc]init];

    
    switch (sender.tag - 200) {
        case 11:
            [self addARecord];  //保存
            [self updateDisplayValue];

            return;
        case 3:
            if (self.amount.length<=1) {  //防止删除字符崩溃
                self.amount =@"".mutableCopy;
                self.displayView.amountLabel.text = self.amount;
                [self updateDisplayValue];

                return;
            }
            [self.amount deleteCharactersInRange:NSMakeRange(self.amount.length - 1, 1)];//删除字符

            if ([self.amount rangeOfString:@"."].length ==1&&[self.amount substringFromIndex:[self.amount rangeOfString:@"."].location].length==1) {
                [self.amount deleteCharactersInRange:NSMakeRange(self.amount.length - 1, 1)];//再删一个
              }
            [self updateDisplayValue];
            break;
        case 12:
            self.amount = @"".mutableCopy;
            [self updateDisplayValue];
            return;
            
        default:
            break;
    }
    
    
    switch (rangeOfPoint.length) {
        case 0:
            if (self.amount.length > length&&sender.tag!=214) {//整数部分最多输入8位
                return;
            }
            break;
        case 1:
            str = [self.amount substringFromIndex:rangeOfPoint.location];//小数部分最多输入2位
            if (str.length > 2 ) {
                return;
            }

        default:
            break;
    }
    
     switch (sender.tag -200) {
        case 0:
            [self.amount appendFormat:@"7"];
            break;
        case 1:
            [self.amount appendFormat:@"8"];
            break;
        case 2:
            [self.amount appendFormat:@"9"];
            break;
        case 3:
            [self.amount deleteCharactersInRange:NSMakeRange(self.amount.length -1, 0)];
            break;
        case 4:
            [self.amount appendFormat:@"4"];
            break;
        case 5:
            [self.amount appendFormat:@"5"];
            break;
        case 6:
            [self.amount appendFormat:@"6"];
            break;
        case 7:
            
            break;
        case 8:
            [self.amount appendFormat:@"1"];
            break;
        case 9:
            [self.amount appendFormat:@"2"];
            break;
        case 10:
            [self.amount appendFormat:@"3"];
            break;
        case 11:
            [self addARecord];
            break;
        case 12:
             [self dismissViewControllerAnimated:YES completion:^{
                 
             }];
            break;
        case 13:
            [self.amount appendFormat:@"0"];
             if (self.amount.length>1&&[[self.amount substringToIndex:1]isEqualToString:@"0"]&&![[self.amount substringWithRange:NSMakeRange(1, 1)]isEqualToString:@"."]) {
                 [self.amount deleteCharactersInRange:NSMakeRange(0, 1)];
             }

            break;
        case 14:
            if (rangeOfPoint.length) {//只能输入一个小数点
                break;
            }
            [self.amount appendFormat:@"."];

             if ([self.amount rangeOfString:@"."].location ==0) {
                 self.amount = [NSString stringWithFormat:@"0%@",self.amount].mutableCopy;//自动补全小数点前边的零
             }

            break;
            
        default:
            break;
    }
    if ([[self.amount substringToIndex:0]isEqualToString:@"0"]) {
        [self.amount deleteCharactersInRange:NSMakeRange(0, 1)];//删除第一位多次输入的零
    }
    self.displayView.amountLabel.text = self.amount;
    [self updateDisplayValue];
}


-(NSDictionary *)recordInformation
{
    NSMutableDictionary *recordDictionary = [NSMutableDictionary dictionary];
    [recordDictionary setObject: [NSNumber numberWithFloat:self.amount.floatValue] forKey:@"money"];
    NSLog(@"%@",[NSNumber numberWithFloat: self.amount.floatValue ]);
    if ([self.datePicker date]!= nil) {
        [recordDictionary setObject:[self.datePicker date] forKey:@"date"];

    }
    if ([self.datePicker date]!= nil) {
        [recordDictionary setObject:@"" forKey:@"accountType"];

    }
    if ([self.datePicker date]!= nil) {
        [recordDictionary setObject:@"" forKey:@"remarkPictureName"];

    }
    if ([self.datePicker date]!= nil) {
        [recordDictionary setObject:@"" forKey:@"remark"];

    }
    switch (self.typeSegment.selectedSegmentIndex) {
        case 0:
//            aRecord.type =@"income";
            [recordDictionary setObject:@"income" forKey:@"recordType"];
            [recordDictionary setObject:@"" forKey:@"describe"];
//            aRecord.imageName =[NSString stringWithFormat:@"incomeIcon_%ld",self.selectedRowInIncome+1];
//            aRecord.describe =[self dictionaryByUserDefaultsWithKey:@"describePlist"][@"IncomeDescribe"][self.selectedRowInIncome];
//            
            break;
        case 1:
//            aRecord.type =@"cost";
            [recordDictionary setObject:@"cost" forKey:@"recordType"];
            [recordDictionary setObject:@""forKey:@"describe"];

//            aRecord.imageName =[NSString stringWithFormat:@"costIcon_%ld",self.selectedRowInCost+1];
//            aRecord.describe =[self dictionaryByUserDefaultsWithKey:@"describePlist"][@"CostDescribe"][self.selectedRowInCost];
            
        case 2:
        default:
            break;
    }

    
    
    
    return recordDictionary;
}

-(void)saveRecord
{
    NSDictionary *recordDictionary = [self recordInformation];
    CoreDataRecord *aRecordData = [NSEntityDescription insertNewObjectForEntityForName:[CoreDataRecord entityName] inManagedObjectContext:_context];
    for (NSString *key in recordDictionary.allKeys) {
        [aRecordData setValue:recordDictionary[key] forKey:key];
        NSLog(@"11asdfs%@",recordDictionary[key]);

    }
    NSLog(@"11%@",aRecordData);
    
    NSError *error = nil;
    BOOL success = [_context save:&error];
    NSLog(@"存储成功 : %d",success);
}
-(void)addARecord
{
    
    Record *aRecord = [[Record alloc]init];
    aRecord.amountOfMoney = self.amount;
    aRecord.reMark = @"123";
    aRecord.recordDate = [NSString stringWithFormat:@"%@" ,[NSDate date]];
//    NSLog(@"%@",aRecord.recordDate);
//    aRecord.type = [self.typeSegment.selectedSegmentIndex == 1] ? [NSString stringWithFormat:@"cost"]:[NSString stringWithFormat:@"income"] ;

    switch (self.typeSegment.selectedSegmentIndex) {
        case 0:
            aRecord.type =@"income";
            aRecord.imageName =[NSString stringWithFormat:@"incomeIcon_%ld",self.selectedRowInIncome+1];
            aRecord.describe =[self dictionaryByUserDefaultsWithKey:@"describePlist"][@"IncomeDescribe"][self.selectedRowInIncome];

            break;
        case 1:
            aRecord.type =@"cost";
            aRecord.imageName =[NSString stringWithFormat:@"costIcon_%ld",self.selectedRowInCost+1];
            aRecord.describe =[self dictionaryByUserDefaultsWithKey:@"describePlist"][@"CostDescribe"][self.selectedRowInCost];

        case 2:
        default:
            break;
    }
    NSMutableString *plistPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject].mutableCopy;
    [plistPath appendString:@"/record.plist"];
    

    NSMutableArray *recordLists = [NSMutableArray arrayWithArray:[NSArray arrayWithContentsOfFile:plistPath]];
    
    
    NSData *recordData = [NSKeyedArchiver archivedDataWithRootObject:aRecord];
    
    
    [recordLists addObject:recordData];
    
    
    BOOL success = [recordLists writeToFile:plistPath atomically:YES];
 

    
//    
//    // 新建一块可变数据区
//    NSMutableData *data = [NSMutableData data];
//    // 将数据区连接到一个NSKeyedArchiver对象
//    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
//    // 开始存档对象，存档的数据都会存储到NSMutableData中
//    [archiver encodeObject:aRecord forKey:[NSString stringWithFormat:@"%@",aRecord.recordDate]];
//    // 存档完毕(一定要调用这个方法，调用了这个方法，archiver才会将encode的数据存储到NSMutableData中)
//    [archiver finishEncoding];
//    // 将存档的数据写入文件

    NSLog(@"数据是否保存成功      %d\naddress%@",success,plistPath);
//
//    // 从文件中读取数据
//    NSData *readData = [NSData dataWithContentsOfFile:plistPath];
//    // 根据数据，解析成一个NSKeyedUnarchiver对象
//    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:readData];
//    NSArray *dataArray = [unarchiver decodeDataObject];
//    Record *readRecord = [unarchiver decodeObjectForKey:[NSString stringWithFormat:@"%@",aRecord.recordDate]];
//    // 恢复完毕(这个方法调用之后，unarchiver不能再decode对象，而且会通知unarchiver的代理调用unarchiverWillFinish:和unarchiverDidFinish:方法)
//    [unarchiver finishDecoding];
//    NSLog(@"%@",readRecord);

    
    self.parentViewIsTranslation =YES;
    [self.amount deleteCharactersInRange:NSMakeRange(0, self.amount.length)] ;
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    [self saveRecord];
}


-(void)updateDisplayValue;
{
    static NSString *apendString = @"";
     switch ([self.amount rangeOfString:@"."].length) {
        case 0:
            apendString = @".00元";
            break;
        case 1:
            switch ([self.amount substringFromIndex:[self.amount rangeOfString:@"."].location].length) {
                case 1:
                    apendString = @"00元";
                    NSLog(@"%ld",[self.amount substringFromIndex:[self.amount rangeOfString:@"."].location].length);

                    break;
                case 2:
                    apendString = @"0元";
                    NSLog(@"%ld",[self.amount substringFromIndex:[self.amount rangeOfString:@"."].location].length);
                    break;
                default:
                    break;
            }
            break;
            
        default:
            break;
    }
    if ([self.amount isEqualToString:@""]) {
        apendString =@"0.00元";
    }
    switch (self.typeSegment.selectedSegmentIndex) {
        case 0:
            self.displayView.typeImage.image =[self imageInMainBundleWithName:[NSString stringWithFormat:@"incomeIcon_%ld",self.selectedRowInIncome+1] andType:@"png" andDirectory:@"image/incomeIcon"];
            self.displayView.typeLabel.text = [self dictionaryByUserDefaultsWithKey:@"describePlist"][@"IncomeDescribe"][self.selectedRowInIncome];
            self.displayView.amountLabel.text = [self.amount stringByAppendingString:apendString];

            break;
        case 1:
            self.displayView.typeImage.image =[self imageInMainBundleWithName:[NSString stringWithFormat:@"costIcon_%ld",self.selectedRowInCost+1] andType:@"png" andDirectory:@"image/costIcon"];
            self.displayView.typeLabel.text = [self dictionaryByUserDefaultsWithKey:@"describePlist"][@"CostDescribe"][self.selectedRowInCost];
            self.displayView.amountLabel.text = [self.amount stringByAppendingString:apendString];


            break;
        case 2:
            self.displayView.typeImage.image = [UIImage imageNamed:@""];
            self.displayView.typeLabel.text = @"";
            self.displayView.amountLabel.text = @"";
            break;
        default:
            break;
    }
    
    apendString =@"元";


}


-(void)back
{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}
#pragma mark--<IncomeCollectionGusture,CostCollectionGusture>

-(void)swipedUp:(UISwipeGestureRecognizer *)sender
{
    self.keyBoardView.hidden = YES;

}
-(void)swipedDown:(UISwipeGestureRecognizer *)sender
{
    self.keyBoardView.hidden = NO;

}
-(void)selectedIcon:(NSInteger)selectedRow;

{
    switch (self.typeSegment.selectedSegmentIndex) {
        case 0:
            self.selectedRowInIncome = selectedRow;
            break;
        case 1:
            self.selectedRowInCost = selectedRow;
        default:
            break;
    }
    [self updateDisplayValue];
}
#pragma mark --<UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    /**
     *  round(): 四舍五入
     *  ceil():  如果参数是小数，则求最大整数
     floor(): 如果参数是小数，则求最小整数
     */
    NSInteger currentPageNumber = (NSInteger)round(scrollView.contentOffset.x/SCREEN_W);
    self.typeSegment.selectedSegmentIndex = currentPageNumber;
    [self updateDisplayValue];
}





@end

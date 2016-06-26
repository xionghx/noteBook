//
//  IncomeCollection.m
//  account book
//
//  Created by xionghuanxin on 6/18/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "IncomeCollection.h"
#import "CustomCollectionViewCell.h"

@interface IncomeCollection ()
@property(nonatomic,strong)NSArray *describe;

@end

@implementation IncomeCollection
static NSString *cellReUseMark = @"income_cell_reuse";


- (instancetype)initWithFrame:(CGRect)frame
         collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:cellReUseMark];
        self.backgroundColor = [UIColor clearColor];
        [self addGestureRecognizer:[self swipeUpGesture]];
        [self addGestureRecognizer:[self swipeDownGesture]];
        self.describe = [self dictionaryByUserDefaultsWithKey:@"describePlist"][@"IncomeDescribe"];
    }
    return self;
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellReUseMark forIndexPath:indexPath];
    cell.imageView.image = [self imageInMainBundleWithName:[NSString stringWithFormat:@"incomeIcon_%ld",indexPath.row+1] andType:@"png" andDirectory:@"image/incomeIcon"];
    cell.label.text = [self dictionaryByUserDefaultsWithKey:@"describePlist"][@"IncomeDescribe"][indexPath.row];
    return cell;
}



-(UISwipeGestureRecognizer *)swipeUpGesture
{
    UISwipeGestureRecognizer *swipeUpGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(delegateActionGestureUp:)];
    swipeUpGesture.direction = UISwipeGestureRecognizerDirectionUp;
    return swipeUpGesture;
}


-(UISwipeGestureRecognizer *)swipeDownGesture
{
    if (_GestureDelegate&&[_GestureDelegate respondsToSelector:@selector(swipedDown:)]) {

        
    }
    
    UISwipeGestureRecognizer *swipeDownGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(delegateActionGestureDown:)];
    swipeDownGesture.direction = UISwipeGestureRecognizerDirectionDown;

    return swipeDownGesture;
}

#pragma mark --调用协议方法
-(void)delegateActionGestureUp:(UISwipeGestureRecognizer *)sender
{
    if (_GestureDelegate&&[_GestureDelegate respondsToSelector:@selector(swipedUp:)]) {
        [self.GestureDelegate swipedUp:sender];
        
    }
}



-(void)delegateActionGestureDown:(UISwipeGestureRecognizer *)sender
{
    
    if (_GestureDelegate&&[_GestureDelegate respondsToSelector:@selector(swipedDown:)]) {
        [self.GestureDelegate swipedDown:sender];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.GestureDelegate selectedIcon:indexPath.row];
}

@end

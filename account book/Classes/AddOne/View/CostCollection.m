//
//  CastCollection.m
//  account book
//
//  Created by xionghuanxin on 6/18/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "CostCollection.h"
#import "CustomCollectionViewCell.h"

@implementation CostCollection
static NSString *cellReUseMark = @"income_cell_reuse";


- (instancetype)initWithFrame:(CGRect)frame
         collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor clearColor];

        [self registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:cellReUseMark];
        [self addGestureRecognizer:[self swipeUpGesture]];
        [self addGestureRecognizer:[self swipeDownGesture]];

    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 15;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellReUseMark forIndexPath:indexPath];
    cell.imageView.image = [self imageInMainBundleWithName:[NSString stringWithFormat:@"costIcon_%ld",indexPath.row+1] andType:@"png" andDirectory:@"image/costIcon"];
    cell.label.text = [self dictionaryByUserDefaultsWithKey:@"describePlist"][@"CostDescribe"][indexPath.row];
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

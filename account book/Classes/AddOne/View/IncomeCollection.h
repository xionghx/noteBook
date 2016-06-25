//
//  IncomeCollection.h
//  account book
//
//  Created by xionghuanxin on 6/18/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol IncomeCollectionGusture <NSObject>
-(void)swipedUp:(UISwipeGestureRecognizer *)sender;
-(void)swipedDown:(UISwipeGestureRecognizer *)sender;
-(void)selectedIcon:(NSInteger)selectedRow;


@end

@interface IncomeCollection : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,assign)id<IncomeCollectionGusture> GestureDelegate;
@property(nonatomic,assign)NSInteger selectedRow;
@end

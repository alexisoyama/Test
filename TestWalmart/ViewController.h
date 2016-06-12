//
//  ViewController.h
//  TestWalmart
//
//  Created by Alexis Oyama on 6/11/16.
//  Copyright © 2016 AlexisOyama. All rights reserved.
//

#import "WLTConfig.h"
#import "WLTProductCell.h"

@interface ViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray *products;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic) NSInteger pageSize;
@property (nonatomic) NSInteger pageNumber;



@end


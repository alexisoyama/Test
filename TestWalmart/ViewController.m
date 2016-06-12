//
//  ViewController.m
//  TestWalmart
//
//  Created by Alexis Oyama on 6/11/16.
//  Copyright © 2016 AlexisOyama. All rights reserved.
//

#import "ViewController.h"
#import "WLTProductViewController.h"

static NSString *productCellIdentifier = @"productCellIdentifier";

@interface ViewController ()

@property (nonatomic) BOOL isFetching;

@end

@implementation ViewController

- (id)init {
    self = [super init];
    if (!self) return nil;
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Datas
    self.pageNumber = 1;
    self.pageSize = 15;
    self.products = [NSMutableArray new];
    self.isFetching = NO;
    
    // Collection View
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 20, self.view.width, self.view.height-20) collectionViewLayout:[UICollectionViewFlowLayout new]];
    [self.collectionView registerClass:[WLTProductCell class] forCellWithReuseIdentifier:productCellIdentifier];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor colorFromHex:0xCDCDCD];
    self.collectionView.contentInset = UIEdgeInsetsMake(1, 0, 1, 0);
    [self.view addSubview:self.collectionView];
    
    return  self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self fetchProducts];
}

- (void)fetchProducts{
    self.isFetching = YES;
    
    // Fetch
    NSString *URL = [NSString stringWithFormat:@"/walmartproducts/%@/%ld/%ld", kAPIKey, (long)self.pageNumber, (long)self.pageSize];
    [WLTNetwork GET:URL success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray *productsResult = [MTLJSONAdapter modelsOfClass:[WLTProduct class] fromJSONArray:responseObject[@"products"] error:nil];
        self.isFetching = NO;
        [self.products addObjectsFromArray:productsResult];
        [self.collectionView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *Error) {
        self.isFetching = NO;
    }];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.products.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WLTProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:productCellIdentifier forIndexPath:indexPath];
    cell.product = self.products[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat cellWidth = (self.view.width - 2) / 3 ;
    return CGSizeMake(cellWidth, [WLTProductCell cellHeight:cellWidth]);
}

- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 1.0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    WLTProductViewController *productController = [[WLTProductViewController alloc] init];
    productController.product = self.products[indexPath.row];
    productController.productIndex = indexPath.row;
    productController.products = self.products;
    [self presentViewController:productController animated:YES completion:nil];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentSize.height - scrollView.contentOffset.y < scrollView.height + 10 && !self.isFetching) {
        self.pageNumber++;
        [self fetchProducts];
    }
}


@end

//
//  WLTProductViewController.m
//  TestWalmart
//
//  Created by Alexis Oyama on 6/11/16.
//  Copyright © 2016 AlexisOyama. All rights reserved.
//

#import "WLTProductViewController.h"
#import "ViewController.h"

@interface WLTProductViewController ()

@property (nonatomic, strong) WLTProductDetailView *tempDetailView;

@end

@implementation WLTProductViewController

- (id)init {
    self = [super init];
    if (!self) return nil;
    
    // Back Button
    self.backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.height-40, self.view.width, 40)];
    self.backButton.backgroundColor = [UIColor colorFromHex:0xBABABA];
    [self.backButton setTitle:@"Return to List" forState:UIControlStateNormal];
    [self.backButton setImage:[UIImage imageNamed:@"DownArrow"] forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(backButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    self.backButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
    [self.view addSubview:self.backButton];
    
    // ScrollView
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, self.view.width, self.view.height-60)];
    self.scrollView.contentSize = CGSizeMake(self.view.width*3, self.scrollView.height);
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentOffset = CGPointMake(self.view.width, 0);
    [self.view addSubview:self.scrollView];
    
    
    // DetailView
    self.detailView = [[WLTProductDetailView alloc] initWithFrame:self.scrollView.bounds];
    [self.scrollView addSubview:self.detailView];
    
    // Temp DetailView
    self.tempDetailView = [[WLTProductDetailView alloc] initWithFrame:self.scrollView.bounds];
    self.tempDetailView.x = 0;
    [self.scrollView addSubview:self.tempDetailView];
    
    return  self;
}

- (void)setProduct:(WLTProduct *)product {
    _product = product;
    self.detailView.product = product;
}

- (void)backButtonTapped {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // Assign Temp DetailView
    if (scrollView.contentOffset.x > scrollView.width) {
        self.tempDetailView.x = scrollView.width*2;
        self.tempDetailView.product = [self productWithIndex:self.productIndex+1];
    } else {
        self.tempDetailView.x = 0;
        self.tempDetailView.product = [self productWithIndex:self.productIndex-1];
    }
    
    // Disable Paginating on edge case
    if (!self.tempDetailView.product) {
        self.scrollView.contentOffset = CGPointMake(scrollView.width, 0);
    }
    
    // Finish Left Pagination
    if (scrollView.contentOffset.x <= 0 && self.productIndex != 0 ) {
        self.detailView.product = self.tempDetailView.product;
        self.scrollView.contentOffset = CGPointMake(scrollView.width, 0);
        self.productIndex--;
    }
    
    // Finish Right Pagination
    if (scrollView.contentOffset.x >= scrollView.width*2 && self.productIndex != self.products.count ) {
        self.detailView.product = self.tempDetailView.product;
        self.scrollView.contentOffset = CGPointMake(scrollView.width, 0);
        self.productIndex++;
    }
}

- (WLTProduct *)productWithIndex : (NSInteger)index {
    if (!self.products || index < 0 || index >= self.products.count) {
        return nil;
    }
    
    return self.products[index];
}

@end

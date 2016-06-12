//
//  WLTProductViewController.h
//  TestWalmart
//
//  Created by Alexis Oyama on 6/11/16.
//  Copyright © 2016 AlexisOyama. All rights reserved.
//

#import "WLTConfig.h"
#import "WLTProductDetailView.h"

@interface WLTProductViewController : UIViewController<UIScrollViewDelegate>

@property (nonatomic, strong) WLTProduct *product;

@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) WLTProductDetailView *detailView;
@property (nonatomic, strong) UIScrollView *scrollView;

// Pagination
@property (nonatomic) NSInteger productIndex;
@property (nonatomic, weak) NSArray *products;

@end

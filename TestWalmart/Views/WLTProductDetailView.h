//
//  WLTProductDetailView.h
//  TestWalmart
//
//  Created by Alexis Oyama on 6/11/16.
//  Copyright © 2016 AlexisOyama. All rights reserved.
//

#import "WLTConfig.h"
#import "WLTProduct.h"
#import "WLTRatingView.h"

@interface WLTProductDetailView : UIView

@property (nonatomic, strong) WLTProduct *product;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) WLTRatingView *ratingView;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *inStockLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *shortDescriptionLabel;
@property (nonatomic, strong) UILabel *longDescriptionLabel;


@end

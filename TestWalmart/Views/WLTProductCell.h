//
//  WLTProductCell.h
//  TestWalmart
//
//  Created by Alexis Oyama on 6/11/16.
//  Copyright © 2016 AlexisOyama. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLTProduct.h"
#import "WLTRatingView.h"

@interface WLTProductCell : UICollectionViewCell

@property (nonatomic, strong) WLTProduct *product;

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) WLTRatingView *ratingView;

+ (CGFloat)cellHeight : (CGFloat)width;

@end

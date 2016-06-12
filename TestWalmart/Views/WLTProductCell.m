//
//  WLTProductCell.m
//  TestWalmart
//
//  Created by Alexis Oyama on 6/11/16.
//  Copyright © 2016 AlexisOyama. All rights reserved.
//

#import "WLTProductCell.h"

@implementation WLTProductCell

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return self;
    self.backgroundColor = [UIColor whiteColor];
    
    // ImageView
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, self.width-10, self.width-10)];
    [self addSubview:self.imageView];
    
    // Title
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, self.imageView.bottomY, self.width-10, 35)];
    self.nameLabel.font = [UIFont systemFontOfSize:14];
    self.nameLabel.numberOfLines = -1;
    [self addSubview:self.nameLabel];
    
    // Price
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, self.nameLabel.bottomY+5, self.width-10, 20)];
    self.priceLabel.font = [UIFont boldSystemFontOfSize:17];
    self.priceLabel.textColor = [UIColor colorFromHex:0xFF8C2D];
    [self addSubview:self.priceLabel];
    
    // RatingView
    self.ratingView = [[WLTRatingView alloc] initWithFrame:CGRectMake(5, self.priceLabel.bottomY+2, self.width-20, 15)];
    [self addSubview:self.ratingView];
    
    return self;
}

- (void)setProduct:(WLTProduct *)product {
    _product = product;
    
    [self.imageView setImageWithURL:[NSURL URLWithString:product.productImage]];
    self.nameLabel.text = product.productName;
    self.priceLabel.text = product.price;
    self.ratingView.rating = product.reviewRating;
    self.ratingView.count = product.reviewCount;
}

+ (CGFloat)cellHeight : (CGFloat)width {
    return width - 10 + 40 + 5 + 20 + 15 + 5;
}

@end

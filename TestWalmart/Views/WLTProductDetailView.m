//
//  WLTProductDetailView.m
//  TestWalmart
//
//  Created by Alexis Oyama on 6/11/16.
//  Copyright © 2016 AlexisOyama. All rights reserved.
//

#import "WLTProductDetailView.h"

@implementation WLTProductDetailView

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return self;
    self.backgroundColor = [UIColor whiteColor];
    
    // Rating View
    self.ratingView = [[WLTRatingView alloc] initWithFrame:CGRectMake(10, 16, 80, 15)];
    self.ratingView.x = self.width / 2 - self.ratingView.width / 2;
    [self addSubview:self.ratingView];
    
    // Price
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.width-20, 44)];
    self.priceLabel.font = [UIFont boldSystemFontOfSize:18];
    self.priceLabel.textColor = [UIColor colorFromHex:0xFF8C2D];
    [self addSubview:self.priceLabel];
    
    // InStock
    self.inStockLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.width-20, 44)];
    self.inStockLabel.font = [UIFont systemFontOfSize:17];
    self.inStockLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.inStockLabel];
    
    // Line
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 44, self.width, 0.5)];
    line.backgroundColor = [UIColor colorFromHex:0xCDCDCD];
    [self addSubview:line];
    
    // ScrollView
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, line.bottomY, self.width, self.height-line.bottomY)];
    [self addSubview:self.scrollView];
    
    // ImageView
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, self.width-20, self.width-20)];
    [self.scrollView addSubview:self.imageView];
    
    // Name
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.imageView.bottomY, self.width-20, 30)];
    self.nameLabel.font = [UIFont systemFontOfSize:17];
    self.nameLabel.numberOfLines = -1;
    [self.scrollView addSubview:self.nameLabel];
    
    // Short Description
    self.shortDescriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.nameLabel.bottomY, self.width-20, 50)];
    self.shortDescriptionLabel.font = [UIFont systemFontOfSize:14];
    self.shortDescriptionLabel.numberOfLines = -1;
    [self.scrollView addSubview:self.shortDescriptionLabel];
    
    // Long Description
    self.longDescriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.shortDescriptionLabel.bottomY, self.width-20, 50)];
    self.longDescriptionLabel.font = [UIFont systemFontOfSize:12];
    self.longDescriptionLabel.numberOfLines = -1;
    [self.scrollView addSubview:self.longDescriptionLabel];
    
    return self;
}

- (void)setProduct:(WLTProduct *)product {
    _product = product;
    
    // Assign Values
    self.ratingView.rating = product.reviewRating;
    self.ratingView.count = product.reviewCount;
    self.priceLabel.text = product.price;
    self.inStockLabel.text = product.inStock ? @"In Stock" : @"Out of Stock";
    self.inStockLabel.textColor = product.inStock ? [UIColor colorFromHex:0x64B633] : [UIColor colorFromHex:0x9B9B9B];
    self.nameLabel.text = product.productName;
    self.shortDescriptionLabel.attributedText = [WLTProductDetailView attributedStringFrom:product.shortDescription font:self.shortDescriptionLabel.font];
    self.longDescriptionLabel.attributedText = [WLTProductDetailView attributedStringFrom:product.longDescription font:self.longDescriptionLabel.font];
    [self.imageView setImageWithURL:[NSURL URLWithString:product.productImage]];
    
    // Recalculate Layout
    self.nameLabel.height = [self.nameLabel sizeThatFits:CGSizeMake(self.nameLabel.width, CGFLOAT_MAX)].height;
    self.shortDescriptionLabel.y = self.nameLabel.bottomY+10;
    self.shortDescriptionLabel.height = [self.shortDescriptionLabel sizeThatFits:CGSizeMake(self.shortDescriptionLabel.width, CGFLOAT_MAX)].height;
    self.longDescriptionLabel.y = self.shortDescriptionLabel.bottomY;
    self.longDescriptionLabel.height = [self.longDescriptionLabel sizeThatFits:CGSizeMake(self.longDescriptionLabel.width, CGFLOAT_MAX)].height;
    self.scrollView.contentSize = CGSizeMake(self.scrollView.width, self.longDescriptionLabel.bottomY);
}

+ (NSAttributedString *)attributedStringFrom : (NSString *)HTMLString font:(UIFont *)font {
    return [[NSAttributedString alloc] initWithData:[HTMLString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSFontAttributeName:font} documentAttributes:nil error:nil];
}

@end

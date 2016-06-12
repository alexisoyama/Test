//
//  WLTRatingView.m
//  TestWalmart
//
//  Created by Alexis Oyama on 6/12/16.
//  Copyright © 2016 AlexisOyama. All rights reserved.
//

#import "WLTRatingView.h"

@interface WLTRatingView ()

@property (nonatomic, strong) NSMutableArray *starImageViews;

@end

@implementation WLTRatingView

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return self;
    _starWidth = 13;
    
    // Create Stars
    self.starImageViews = [NSMutableArray new];
    for (int i=0; i<5; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*self.starWidth, 0, self.starWidth, self.starWidth)];
        imageView.image = [UIImage imageNamed:@"GrayStar"];
        [self addSubview:imageView];
        [self.starImageViews addObject:imageView];
    }
    
    // Count
    self.countLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.starWidth*5 + 3, 0, 50, self.starWidth)];
    self.countLabel.font = [UIFont systemFontOfSize:10];
    self.countLabel.text = @"(0)";
    self.countLabel.textColor = [UIColor colorFromHex:0x9B9B9B];
    self.countLabel.width = [self.countLabel sizeThatFits:CGSizeMake(CGFLOAT_MAX, self.starWidth)].width;
    [self addSubview:self.countLabel];
    
    self.height = self.starWidth;
    self.width = self.countLabel.rightX;
    
    return self;
}

- (id)initWithFrame:(CGRect)frame rating:(CGFloat)rating count:(NSInteger)count {
    self = [self initWithFrame:frame];
    if (!self) return self;
    
    self.rating = rating;
    self.count = count;
    
    return self;
}

- (void)setRating:(CGFloat)rating {
    _rating = rating;
    [self.starImageViews enumerateObjectsUsingBlock:^(UIImageView * _Nonnull imageView, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx+1 <= rating + 0.01) {
            imageView.image = [UIImage imageNamed:@"Star"];
        } else if (idx+0.5 <= rating + 0.01) {
            imageView.image = [UIImage imageNamed:@"HalfStar"];
        } else {
            imageView.image = [UIImage imageNamed:@"GrayStar"];
        }
    }];
}

- (void)setCount:(NSInteger)count {
    _count = count;
    self.countLabel.text = [NSString stringWithFormat:@"(%ld)", (long)count];
    self.countLabel.width = [self.countLabel sizeThatFits:CGSizeMake(CGFLOAT_MAX, self.starWidth)].width;
    self.width = self.countLabel.rightX;
}

- (void)setStarWidth:(CGFloat)starWidth {
    _starWidth = starWidth;
    [self.starImageViews enumerateObjectsUsingBlock:^(UIImageView * _Nonnull imageView, NSUInteger idx, BOOL * _Nonnull stop) {
        imageView.frame = CGRectMake(idx*starWidth, 0, starWidth, starWidth);
    }];
    self.countLabel.x = starWidth * 5;
    self.height = self.countLabel.height = starWidth;
}

@end

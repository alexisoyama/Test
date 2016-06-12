//
//  WLTRatingView.h
//  TestWalmart
//
//  Created by Alexis Oyama on 6/12/16.
//  Copyright © 2016 AlexisOyama. All rights reserved.
//

#import "WLTConfig.h"

@interface WLTRatingView : UIView

@property (nonatomic) CGFloat rating;
@property (nonatomic) NSInteger count;
@property (nonatomic) CGFloat starWidth;

@property (nonatomic, strong) UILabel *countLabel;

- (id)initWithFrame:(CGRect)frame rating:(CGFloat)rating count:(NSInteger)count;

@end

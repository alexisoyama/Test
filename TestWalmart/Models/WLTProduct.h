//
//  WLTProduct.h
//  TestWalmart
//
//  Created by Alexis Oyama on 6/11/16.
//  Copyright © 2016 AlexisOyama. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "WLTConfig.h"

@interface WLTProduct : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *productId;
@property (nonatomic, copy) NSString *productName;
@property (nonatomic, copy) NSString *shortDescription;
@property (nonatomic, copy) NSString *longDescription;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *productImage;
@property (nonatomic) CGFloat reviewRating;
@property (nonatomic) NSInteger reviewCount;
@property (nonatomic) BOOL inStock;

@end

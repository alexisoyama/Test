//
//  WLTProduct.m
//  TestWalmart
//
//  Created by Alexis Oyama on 6/11/16.
//  Copyright © 2016 AlexisOyama. All rights reserved.
//

#import "WLTProduct.h"

@implementation WLTProduct

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"productId":@"productId",
             @"productName":@"productName",
             @"shortDescription":@"shortDescription",
             @"longDescription":@"longDescription",
             @"price":@"price",
             @"productImage":@"productImage",
             @"reviewRating":@"reviewRating",
             @"reviewCount":@"reviewCount",
             @"inStock":@"inStock",};
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self == nil) return nil;
    
    // Convert nil to empty string
    if (!self.productId) self.productId = @"";
    if (!self.productName) self.productName = @"";
    if (!self.shortDescription) self.shortDescription = @"";
    if (!self.longDescription) self.longDescription = @"";
    if (!self.price) self.price = @"";
    if (!self.productImage) self.productImage = @"";
    
    return self;
}


@end

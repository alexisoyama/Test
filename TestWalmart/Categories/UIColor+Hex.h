//
//  UIColor+Hex.h
//  TestWalmart
//
//  Created by Alexis Oyama on 6/11/16.
//  Copyright © 2016 AlexisOyama. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *)colorFromHex:(int)hexValue;
+ (UIColor *)colorFromHex:(int)hexValue alpha:(CGFloat)alpha;
+ (UIColor *)colorFromHexString:(NSString *)hexString;

@end

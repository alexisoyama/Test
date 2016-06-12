//
//  UIColor+Hex.m
//  TestWalmart
//
//  Created by Alexis Oyama on 6/11/16.
//  Copyright © 2016 AlexisOyama. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor *)colorFromHex:(int)hexValue {
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0];
}

+ (UIColor *)colorFromHex:(int)hexValue alpha:(CGFloat)alpha {
    return [[UIColor colorFromHex:hexValue] colorWithAlphaComponent:alpha];
}

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    if ([hexString hasPrefix:@"#"]) {
        hexString = [hexString substringFromIndex:1];
    }
    unsigned hexValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner scanHexInt:&hexValue];
    return [UIColor colorFromHex:hexValue];
}

+ (UIColor *)colorFromHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    return [[UIColor colorFromHexString:hexString] colorWithAlphaComponent:alpha];
}

@end

//
//  UIView+Frame.m
//  TestWalmart
//
//  Created by Alexis Oyama on 6/11/16.
//  Copyright © 2016 AlexisOyama. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (CGFloat) x {
    return self.frame.origin.x;
}

- (CGFloat) y {
    return self.frame.origin.y;
}

- (CGFloat) width {
    if ([self isKindOfClass:[UITableViewCell class]]) {
        return [[UIScreen mainScreen] bounds].size.width;
    }
    return self.frame.size.width;
}

- (CGFloat) height {
    return self.frame.size.height;
}

- (void) setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void) setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void) setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void) setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat) bottomY {
    return self.y + self.height;
}

- (CGFloat) rightX {
    return self.x + self.width;
}

@end

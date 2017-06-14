//
//  UIColor+SLVColor.m
//  Bolt
//
//  Created by 1 on 14.06.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import "UIColor+SLVColor.h"

@implementation UIColor (SLVColor)

+ (UIColor *)grayLabelColor {
    return [UIColor shortcutWithRed:205 green:205 blue:205 alpha:100];
}

+ (UIColor *)darkRedColor {
    return [UIColor shortcutWithRed:208 green:2 blue:27 alpha:100];
}

+ (UIColor *)shortcutWithRed:(float)red green:(float)green blue:(float)blue alpha:(float)alpha {
    return [UIColor colorWithRed:red/255.0 green:205/255.0 blue:205/255.0 alpha:1/100.0];
}

@end

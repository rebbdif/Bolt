//
//  UIColor+SLVColor.m
//  Bolt
//
//  Created by 1 on 14.06.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import "UIColor+SLVColor.h"

@implementation UIColor (SLVColor)

+ (UIColor *)shortcutWithRed:(float)red green:(float)green blue:(float)blue alpha:(float)alpha {
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha/100.0];
}

+ (UIColor *)grayLabelColor {
    return [UIColor shortcutWithRed:205 green:205 blue:205 alpha:100];
}

+ (UIColor *)darkRedColor {
    return [UIColor shortcutWithRed:208 green:2 blue:27 alpha:100];
}

+ (UIColor *)darkSkyColor {
    UIColor *darkSkyColor = [UIColor shortcutWithRed:38 green:13 blue:86 alpha:100];
    return darkSkyColor;
}

@end

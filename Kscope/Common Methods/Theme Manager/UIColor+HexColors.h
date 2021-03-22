//
//  UIColor+HexColors.h
//  ShopHop
//
//  Created by on 20/06/16.
//  Copyright © 2016 appledelegate. All rights reserved.
//

@interface UIColor (HexColors)

+(UIColor *)colorFromHexString:(NSString *)hexString;
+(NSString *)hexValuesFromUIColor:(UIColor *)color;
+ (UIColor *)colorWithHexString:(NSString *)hexString;

@end

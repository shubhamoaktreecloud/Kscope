//
//  ThemImageView.h
//  ShopHop
//
//  Created by on 5/10/18.
//  Copyright © 2018 appledelegate. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface ThemeImageView : UIImageView <ThemeUpdateProtocol>

/**
 
 *
 - 0: Primary Tint iamge: PRIMARY_COLOR
 
 *
 - 1: White Tint image: WHITE_COLOR
 
 */
@property (nonatomic)IBInspectable int type;

+ (UIImageView *)setTintImage:(UIImageView *)imgVw withColor:(UIColor *)color;
@end

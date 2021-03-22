//
//  ThemeTextField.h
//  ShopHop
//
//  Created by on 4/30/18.
//  Copyright © 2018  All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThemeManager.h"

IB_DESIGNABLE
@interface ThemeTextField : UITextField <ThemeUpdateProtocol>

/**
 
 *
 - 0: Primary Text Field: SHOPHOP_PRIMARY_FONT, fSize2, PRIMARY_COLOR_TEXT
 
 *
 - 1: PopUp Text Field: SHOPHOP_PRIMARY_FONT, fSize2, PRIMARY_COLOR_TEXT
 
 *
 - Color: 0: PRIMARY_COLOR
 1: PRIMARY_COLOR_DARK
 2: PRIMARY_COLOR_TEXT
 3: SECONDARY_COLOR_TEXT
 4: WHITE_COLOR
 5: RED_COLOR
 6: GREEN_COLOR

 */
@property (nonatomic)IBInspectable int type;

@end

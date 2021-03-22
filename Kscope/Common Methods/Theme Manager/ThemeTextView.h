//
//  ThemeTextView.h
//  ShopHop
//
//  Created by on 5/12/18.
//  Copyright © 2018 appledelegate. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface ThemeTextView : UITextView <ThemeUpdateProtocol>
/**
 
 *
 - 0: Primary Text View: SHOPHOP_PRIMARY_FONT, fSize2, PRIMARY_COLOR_TEXT

 */
@property (nonatomic)IBInspectable int type;

@end

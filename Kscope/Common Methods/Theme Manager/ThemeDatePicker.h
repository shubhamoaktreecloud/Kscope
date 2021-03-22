//
//  ThemeDatePicker.h
//  ShopHop
//
//  Created by on 5/9/18.
//  Copyright © 2018 appledelegate. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface ThemeDatePicker : UIDatePicker <ThemeUpdateProtocol>

@property (nonatomic)IBInspectable int type;

@end

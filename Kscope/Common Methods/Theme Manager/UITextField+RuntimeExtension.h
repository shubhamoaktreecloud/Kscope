//
//  UITextField+RuntimeExtension.h
//  ShopHop
//
//  Created by on 20/06/16.
//  Copyright © 2016 appledelegate. All rights reserved.
//


@interface UITextField (RuntimeExtension)

- (void)customRightViewWithImage:(NSString *)image width:(int)width height:(int)height;
- (void)customRightButtonWithImage:(id)target image:(NSString *)image selector:(SEL)selector;
- (void)leftMargin:(int)width;
- (void)placeholderColor;
- (void)errorRightView;
- (void)setTextFieldFont:(NSString *)font color:(UIColor *)color size:(float)size;

@end

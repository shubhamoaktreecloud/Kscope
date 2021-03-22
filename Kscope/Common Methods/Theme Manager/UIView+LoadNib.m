//
//  UIView+LoadNib.m
//  ShopHop
//
//  Created by on 29/07/16.
//  Copyright © 2016 appledelegate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+LoadNib.h"

@implementation UIView (LoadNib)

+(UIView*)loadFromNibNamed:(NSString *)NibName{
    return  (UIView *)[[NSBundle mainBundle] loadNibNamed:NibName owner:self options:nil][0];
}

@end

//
//  ThemImageView.m
//  ShopHop
//
//  Created by on 5/10/18.
//  Copyright © 2018 appledelegate. All rights reserved.
//

#import "ThemeManager.h"
#import "ThemeImageView.h"

@implementation ThemeImageView


#pragma mark -
#pragma mark - init methods

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self _init];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self _init];
    }
    return self;
}

- (id)init {
    if (self = [super init]) {
        [self _init];
    }
    return self;
}

- (void)_init {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeDidChangeNotification:) name:ThemeManagerDidChangeThemes object:nil];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self applyTheme];
}

- (void)dealloc {
    @try {
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
    @catch (NSException *exception) {
        // do nothing, only unregistering self from notifications
    }
}


#pragma mark -
#pragma mark - set theme

- (void)applyTheme {
    
    UIColor *color;
    if (_type == 0 ) {
        color = [[ThemeManager sharedManager] colorForKey:@"Secondary_Color1"];
    }
    
    UIImage *img = [self.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.tintColor = color;
    self.image = img;
    
    if (_type == 0) {
        UIImage *img = [self.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        self.tintColor = color;
        self.image = img;
    }
}

+ (UIImageView *)setTintImage:(UIImageView *)imgVw withColor:(UIColor *)color {
    UIImage *img = [imgVw.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    imgVw.tintColor = color;
    imgVw.image = img;
    
    return imgVw;
}


#pragma mark -
#pragma mark - set observer for change theme

- (void)themeDidChangeNotification:(NSNotification *)notification {
    [self applyTheme];
}

@end

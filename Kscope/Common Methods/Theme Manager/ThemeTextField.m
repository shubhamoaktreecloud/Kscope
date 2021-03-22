//
//  ThemeTextField.m
//  ShopHop
//
//  Created by on 4/30/18.
//  Copyright © 2018  All rights reserved.
//

#import "ThemeTextField.h"


#pragma mark -
#pragma mark - init methods

@implementation ThemeTextField

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
#pragma mark - apply theme

- (void)applyTheme {
    UIFont *font = nil;
    if (_type == 0) {
        font = [[ThemeManager sharedManager] fontForKey:@"font1" withSizeKey:@"fSize2"];
    }
    else if (_type == 1) {
        font = [[ThemeManager sharedManager] fontForKey:@"font1" withSizeKey:@"fSize2"];
    }
    else if (_type == 2) {
        font = [[ThemeManager sharedManager] fontForKey:@"font0" withSizeKey:@"fSize5"];
    }
    
    self.font = font;
    
    UIColor *textColor, *pColor = nil;
    if (_type == 0 || _type == 2) {
        textColor = [[ThemeManager sharedManager] colorForKey:@"Primary_Default_Color"];
        pColor = [[ThemeManager sharedManager] colorForKey:@"pColor0"];
    }
    else if (_type == 1) {
        textColor = [[ThemeManager sharedManager] colorForKey:@"Secondary_Color1"];
        pColor = [[ThemeManager sharedManager] colorForKey:@"pColor0"];
    }
    
    self.textColor = textColor;
    
    if (self.placeholder == nil) {
        self.placeholder = @" ";
    }
    
    //Theme1
    UIFont *Themefont = nil;
    if (_type == 3) {
        Themefont = [[ThemeManager sharedManager] fontForKey:@"font1" withSizeKey:@"fSize2"];
    }
    else if (_type == 4 || _type == 5 || _type == 6) {
        Themefont = [[ThemeManager sharedManager] fontForKey:@"ThemeFont1" withSizeKey:@"fSize2"];
    }
    else if (_type == 7) {
        Themefont = [[ThemeManager sharedManager] fontForKey:@"ThemeFont2" withSizeKey:@"fSize3"];
    }
    self.font = Themefont;
    
    UIColor *ThemetextColor, *ThemepColor = nil;
    if (_type == 3) {
        ThemetextColor = [[ThemeManager sharedManager] colorForKey:@"ThemeTextColor"];
        ThemepColor = [[ThemeManager sharedManager] colorForKey:@"ThemeTextColor"];
    }
    else if (_type == 4) {
        ThemetextColor = [[ThemeManager sharedManager] colorForKey:@"ThemeTextColor"];
        ThemepColor = [[ThemeManager sharedManager] colorForKey:@"ThemeTextColor"];
    }
    else if (_type == 5) {
        ThemetextColor = [[ThemeManager sharedManager] colorForKey:@"Theme4PrimaryColor"];
    }
    else if (_type == 6) {
        ThemetextColor = [[ThemeManager sharedManager] colorForKey:@"ThemeSecondartTextColor"];
    }
    
    // Taxi Booking
    
    else if (_type == 7) {
        ThemetextColor = [[ThemeManager sharedManager] colorForKey:@"ThemeTextColor"];
        ThemepColor = [[ThemeManager sharedManager] colorForKey:@"ThemeTextColor"];
    }
    
    self.textColor = ThemetextColor;
}


#pragma mark -
#pragma mark - set observer for change theme

- (void)themeDidChangeNotification:(NSNotification *)notification {
    [self applyTheme];
}

@end

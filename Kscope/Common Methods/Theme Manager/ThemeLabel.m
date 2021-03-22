//
//  ThemeLabel.m
//  ShopHop
//
//  Created by on 4/30/18.
//  Copyright © 2018  All rights reserved.
//

#import "ThemeLabel.h"

@implementation ThemeLabel


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
#pragma mark - apply theme

- (void)applyTheme {
    
    // Shophop
    
    UIFont *font = nil;
    if(_type == 0 || _type == 15) {
        font = [[ThemeManager sharedManager] fontForKey:@"font0" withSizeKey:@"fSize4"];
    }
    if (_type == 1 || _type == 2 || _type == 10) {
        font = [[ThemeManager sharedManager] fontForKey:@"font1" withSizeKey:@"fSize2"];
    }
    else if (_type == 3) {
        font = [[ThemeManager sharedManager] fontForKey:@"font0" withSizeKey:@"fSize7"];
    }
    else if (_type == 4 || _type == 7) {
        font = [[ThemeManager sharedManager] fontForKey:@"font2" withSizeKey:@"fSize2"];
    }
    else if (_type == 5) {
        font = [[ThemeManager sharedManager] fontForKey:@"font2" withSizeKey:@"fSize3"];
    }
    else if (_type == 6) {
        font = [[ThemeManager sharedManager] fontForKey:@"font2" withSizeKey:@"fSize4"];
    }
    else if (_type == 8) {
        font = [[ThemeManager sharedManager] fontForKey:@"font1" withSizeKey:@"fSize1"];
    }
    else if (_type == 9 ||_type == 11 ||_type == 12 || _type == 15) {
        font = [[ThemeManager sharedManager] fontForKey:@"font2" withSizeKey:@"fSize3"];
    }
    else if (_type == 10 || _type == 13 || _type == 14) {
        font = [[ThemeManager sharedManager] fontForKey:@"font1" withSizeKey:@"fSize2"];
    }
    else if (_type == 14) {
        font = [[ThemeManager sharedManager] fontForKey:@"font1" withSizeKey:@"fSize0"];
    }
    self.font = font;
    
    UIColor *textColor = nil;
    if (_type == 0){
        textColor = [[ThemeManager sharedManager] colorForKey:@"Secondary_Color2"];
    }
    if (_type == 1 || _type == 3 || _type == 4 || _type == 6 || _type == 7 || _type == 11 || _type == 12) {
    }
    else if (_type == 2 || _type == 8) {
        textColor = [[ThemeManager sharedManager] colorForKey:@"color4"];
    }
    else if (_type == 3) {
        textColor = [[ThemeManager sharedManager] colorForKey:@"Secondary_Color2"];
    }
    else if (_type == 5) {
        textColor = [[ThemeManager sharedManager] colorForKey:@"Primary_Default_Color"];
    }
    else if ( _type == 10|| _type == 13) {
        textColor = [[ThemeManager sharedManager] colorForKey:@"color9"];
    }
    else if ( _type == 12 ) {
        textColor = [[ThemeManager sharedManager] colorForKey:@"Primary_Default_Color"];
    }
    else if (_type == 13 ) {
        textColor = [[ThemeManager sharedManager] colorForKey:@"color6"];
    }
    else if (_type == 15 ) {
        textColor = [[ThemeManager sharedManager] colorForKey:@"background"];
    }
    else if (_type == 14 || _type == 15) {
        textColor = [[ThemeManager sharedManager] colorForKey:@"textColorSecondary"];
    }

    [self setTextColor:textColor];
    
    UIColor *backgroundColor = nil;
    
    [self setBackgroundColor:backgroundColor];
    
    
    // Theme
    
    UIFont *fontTheme1 = nil;
    if(_type == 16 || _type == 58 || _type == 75 || _type == 132) {
        fontTheme1 = [[ThemeManager sharedManager] fontForKey:@"ThemeFont0" withSizeKey:@"fSize8"];
    }
    else if (_type == 21 || _type == 45 || _type == 96 || _type == 97 || _type == 142 || _type == 147) {
        fontTheme1 = [[ThemeManager sharedManager] fontForKey:@"ThemeFont2" withSizeKey:@"fSize5"];
    }
    else if (_type == 22 || _type == 17 || _type == 33 || _type == 35 || _type == 42 || _type == 88 || _type == 91 || _type == 125 || _type == 130 || _type == 146) {
        fontTheme1 = [[ThemeManager sharedManager] fontForKey:@"ThemeFont2" withSizeKey:@"fSize4"];
    }
    else if (_type == 19 || _type == 23 || _type == 24 || _type == 30 || _type == 37 || _type == 41 || _type == 49 || _type == 54 || _type == 55 || _type == 89 || _type == 104 || _type == 122 || _type == 133 ) {
        fontTheme1 = [[ThemeManager sharedManager] fontForKey:@"ThemeFont1" withSizeKey:@"fSize3"];
    }
    else if (_type == 20 || _type == 48) {
        fontTheme1 = [[ThemeManager sharedManager] fontForKey:@"ThemeFont2" withSizeKey:@"fSize8"];
    }
    else if (_type == 25 || _type == 28 || _type == 39 || _type == 43 || _type == 90 || _type == 94 || _type == 123 || _type == 124 || _type == 128 || _type == 137) {
        fontTheme1 = [[ThemeManager sharedManager] fontForKey:@"ThemeFont2" withSizeKey:@"fSize3"];
    }
    else if (_type == 26 || _type == 87 || _type == 95) {
        fontTheme1 = [[ThemeManager sharedManager] fontForKey:@"ThemeFont2" withSizeKey:@"fSize2"];
    }
    else if (_type == 29 || _type == 27 || _type == 38 || _type == 47|| _type == 68 || _type == 86 || _type == 92 || _type == 105 || _type == 131 || _type == 138 || _type == 145) {
        fontTheme1 = [[ThemeManager sharedManager] fontForKey:@"ThemeFont1" withSizeKey:@"fSize2"];
    }
    else if (_type == 31 || _type == 18 || _type == 36 || _type == 40 || _type == 53 || _type == 56 || _type == 93) {
        fontTheme1 = [[ThemeManager sharedManager] fontForKey:@"ThemeFont0" withSizeKey:@"fSize5"];
    }
    else if (_type == 32) {
        fontTheme1 = [[ThemeManager sharedManager] fontForKey:@"ThemeFont1" withSizeKey:@"fSize1"];
    }
    else if (_type == 34 || _type == 57) {
        fontTheme1 = [[ThemeManager sharedManager] fontForKey:@"ThemeFont0" withSizeKey:@"fSize9"];
    }
    else if (_type == 44) {
        fontTheme1 = [[ThemeManager sharedManager] fontForKey:@"ThemeFont1" withSizeKey:@"fSize8"];
    }
    else if (_type == 46 || _type == 50) {
        fontTheme1 = [[ThemeManager sharedManager] fontForKey:@"ThemeFont1" withSizeKey:@"fSize5"];
    }
    else if (_type == 51 || _type == 52 || _type == 77 || _type == 78 || _type == 98 || _type == 127 || _type == 134 || _type == 140) {
        fontTheme1 = [[ThemeManager sharedManager] fontForKey:@"ThemeFont1" withSizeKey:@"fSize4"];
    }
    else if (_type == 69 || _type == 76 || _type == 99 || _type == 100 || _type == 101 || _type == 126 || _type == 135 || _type == 136 || _type == 139 || _type == 144) {
        fontTheme1 = [[ThemeManager sharedManager] fontForKey:@"ThemeFont1" withSizeKey:@"fSize3"];
    }
    else if(_type == 85) {
        fontTheme1 = [[ThemeManager sharedManager] fontForKey:@"ThemeFont0" withSizeKey:@"fSize4"];
    }
    else if(_type == 102 || _type == 149) {
        fontTheme1 = [[ThemeManager sharedManager] fontForKey:@"ThemeFont2" withSizeKey:@"fSize7"];
    }
    else if(_type == 103) {
        fontTheme1 = [[ThemeManager sharedManager] fontForKey:@"ThemeFont0" withSizeKey:@"fSize7"];
    }
    
    // Doctor Plus

    if (_type == 121) {
        fontTheme1 = [[ThemeManager sharedManager] fontForKey:@"ThemeFont2" withSizeKey:@"fSize9"];
    }
    
    
    //Banking
    
    if (_type == 129) {
        fontTheme1 = [[ThemeManager sharedManager] fontForKey:@"ThemeFont0" withSizeKey:@"fSize8"];
    }
    else if (_type == 141 || _type == 148) {
        fontTheme1 = [[ThemeManager sharedManager] fontForKey:@"ThemeFont1" withSizeKey:@"fSize4"];
    }
    
    // Fitness App
    
    if(_type == 143) {
        fontTheme1 = [[ThemeManager sharedManager] fontForKey:@"ThemeFont2" withSizeKey:@"fSize6"];
    }
    
    self.font = fontTheme1;
    
    UIColor *textColorTheme1 = nil;
    if (_type == 16 || _type == 17 || _type == 18 || _type == 20 || _type == 24 || _type == 26 || _type == 29 || _type == 28 || _type == 45 || _type == 46 || _type == 51 || _type == 89 || _type == 99 || _type == 105 || _type == 124){
        textColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"ThemeTextColor"];
    }
    else if (_type == 19) {
        textColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"ThemeLightGrayColor"];
    }
    else if (_type == 21 || _type == 25 || _type == 27 || _type == 41 || _type == 52) {
        textColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"ThemeSecondartTextColor"];
    }
    else if (_type == 22 || _type == 23) {
        textColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"Theme1PrimaryColor"];
    }
    else if (_type == 30 || _type == 31 || _type == 32 || _type == 33 || _type == 34 || _type == 38 || _type == 39 || _type == 44 || _type == 48 || _type == 85 || _type == 87 || _type == 88 || _type == 93 || _type == 102 || _type == 103 || _type == 129 || _type == 139 || _type == 140 || _type == 143 || _type ==  144 || _type == 147 || _type == 146) {
        textColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"ThemeWhiteColor"];
    }
    else if (_type == 35 || _type == 36) {
        textColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"Theme3PrimaryColor2"];
    }
    else if (_type == 37 || _type == 43) {
        textColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"Theme4PrimaryColor"];
    }
    else if (_type == 40 || _type == 42) {
        textColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"Theme7PrimaryColor1"];
    }
    else if (_type == 47 || _type == 49 || _type == 50) {
        textColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"Theme11PrimaryColor"];
    }
    else if (_type == 53 || _type == 54) {
        textColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"Theme10PrimaryColor"];
    }
    else if (_type == 55 || _type == 56) {
        textColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"FoodPrimaryColor"];
    }
    else if (_type == 57 || _type == 58) {
        textColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"DatinnPrimaryColor"];
    }
    
    //SOICAL
       
       else if (_type == 68) {
           textColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"Social_TextColorSecondary"];
       }
       else if (_type == 69) {
           textColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"Social_TextColorPrimary"];
       }
    
    //THEME12
       
       else if (_type == 75) {
           textColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"Theme12PrimaryColor"];
       }
       else if (_type == 76) {
           textColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"Social_TextColorSecondary"];
       }
       else if (_type == 77) {
           textColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"Social_TextColorSecondary"];
       }
       else if (_type == 78) {
           textColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"Theme12PrimaryColor"];
       }
    
    // Taxi Booking
    else if (_type == 86 || _type == 90 || _type == 91 || _type == 92 || _type == 95 || _type == 97 || _type == 98 || _type == 101 || _type == 104) {
        textColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"ThemeBlackColor"];
    }
    else if (_type == 94 || _type == 96 || _type == 122) {
        textColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"Theme2labelColor1"];
    }
    else if (_type == 100) {
        textColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"TaxiBookingPrimaryColor"];
    }
    
    
    // Doctor Plus
    
    else if (_type == 121) {
        textColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"DoctorPatientPrimaryColor"];
    }
    
    else if (_type == 123 || _type == 125 ||  _type == 126 || _type == 127 || _type == 128) {
        textColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"DoctorPatientBlueColor"];
    }
    
    //Banking App
//    129 used
    
    else if(_type == 130 || _type == 132 || _type == 133 || _type == 134 || _type == 136 || _type == 137 || _type == 138 || _type == 141 || _type == 142 || _type == 149) {
        textColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"Banking_TextColorPrimary"];
    }
    else if(_type == 131 || _type == 135 || _type == 145) {
        textColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"Banking_TextColorSecondary"];
    }

    // Fitness app
    //142,143,144,145,146,,147,148,149 used
    
    else if(_type == 148) {
        textColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"Fitness_ColorPrimary"];
    }
    
    
    [self setTextColor:textColorTheme1];
    
    UIColor *backgroundColorTheme1 = nil;
    [self setBackgroundColor:backgroundColorTheme1];
    
     
}

#pragma mark -
#pragma mark - set observer for change theme

- (void)themeDidChangeNotification:(NSNotification *)notification {
    [self applyTheme];
}
@end

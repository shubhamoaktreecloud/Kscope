//
//  ThemeView.m
//  ShopHop
//
//  Created by on 4/30/18.
//  Copyright © 2018  All rights reserved.
//

#import "ThemeView.h"

@implementation ThemeView
#define OBJ_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


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
    
    //ShopHop
    UIColor *backgroundColor = nil;
    if (_type == 1) {
        backgroundColor = [[ThemeManager sharedManager] colorForKey:@"Secondary_Color2"];
        if (OBJ_IPAD) {
            self.layer.cornerRadius = 30.0;
        }else {
            self.layer.cornerRadius = 25.0;
        }
    }
    else if (_type == 2) {
        self.layer.borderWidth = 1;
        self.layer.borderColor = UIColor.groupTableViewBackgroundColor.CGColor;
    }
    else if (_type == 3) {
        backgroundColor = [[ThemeManager sharedManager] colorForKey:@"header_color"];
        self.layer.shadowColor =  UIColor.groupTableViewBackgroundColor.CGColor;
        self.layer.shadowOpacity = 2.0;
        self.layer.shadowRadius = 2.0;
        self.layer.shadowOffset = CGSizeMake(0.0, 2.0);
    }
    else if (_type == 4) {
        backgroundColor = [[ThemeManager sharedManager] colorForKey:@"ThemeWhiteColor"];
        if (OBJ_IPAD) {
            self.layer.cornerRadius = 30.0;
        }else {
            self.layer.cornerRadius = 25.0;
        }
        self.layer.borderWidth = 1;
        self.layer.borderColor = UIColor.lightGrayColor.CGColor;
        
    }
    else if (_type == 5) {
        self.layer.borderWidth = 1;
        self.layer.borderColor = UIColor.groupTableViewBackgroundColor.CGColor;
        if (OBJ_IPAD) {
            self.layer.cornerRadius = 10.0;
        }else {
            self.layer.cornerRadius = 5.0;
        }
    }
    
    else if (_type == 0) {
        self.layer.cornerRadius = self.frame.size.height/2;
        self.layer.masksToBounds = YES;
    }
    
    self.backgroundColor = backgroundColor;
    
    //Theme1
    
    UIColor *backgroundColorTheme1 = nil;
    if (_type == 16) {
        backgroundColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"ThemeLightBackgroundColor"];
        if (OBJ_IPAD) {
            self.layer.cornerRadius = 30.0;
        }else {
            self.layer.cornerRadius = self.frame.size.height / 2;
        }
    }
    else if (_type == 17) {
        backgroundColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"Theme7PrimaryColor1"];
        self.layer.cornerRadius = 10.0;
    }
    else if (_type == 36) {
    //   if (OBJ_IPAD) {
    //      self.layer.cornerRadius = 30.0;
    //   }else {
        self.layer.cornerRadius = 10.0;
        self.layer.borderColor = UIColor.lightGrayColor.CGColor;
        self.layer.borderWidth = 1.0;
    //    }
    }
    else if (_type == 26) {
        backgroundColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"Theme4primaryLightColor"];
    //   if (OBJ_IPAD) {
    //      self.layer.cornerRadius = 30.0;
    //   }else {
            self.layer.cornerRadius = self.frame.size.height / 2;
    //    }
    }
    
    //SOCIAL
       
       else if (_type == 40) {
           backgroundColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"ThemeWhiteColor"];
           self.layer.cornerRadius = 10.0;
           self.layer.masksToBounds = true;
       }
       
       else if (_type == 41) {
           self.layer.borderWidth = 1.0;
           self.layer.borderColor = [[ThemeManager sharedManager] colorForKey:@"Social_TextColorSecondary"].CGColor;
           self.layer.cornerRadius = 10.0;
           self.layer.masksToBounds = true;
       }
       
       else if (_type == 42) {
           backgroundColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"ThemeWhiteColor"];
           self.layer.shadowColor = [[ThemeManager sharedManager] colorForKey:@"Common_Shadow_Color"].CGColor;
           self.layer.masksToBounds = false;
           self.layer.shadowOffset = CGSizeMake(1.0, 2.0);
           self.layer.shadowOpacity = 0.3;
           self.layer.shadowRadius = 2.0;
       }
    
    // Doctor Plus
    
    else if (_type == 43) {
        backgroundColor = [[ThemeManager sharedManager] colorForKey:@"DoctorAppBackGroundColor"];
        if (OBJ_IPAD) {
            self.layer.cornerRadius = 15.0;
        }else {
            self.layer.cornerRadius = 10.0;
        }
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = [[ThemeManager sharedManager] colorForKey:@"ThemeSecondartTextColor"].CGColor;
    }
    
    else if (_type == 44) {
        backgroundColor = [[ThemeManager sharedManager] colorForKey:@"DoctorAppBackGroundColor"];
        self.layer.cornerRadius = self.layer.frame.size.height / 2;
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [[ThemeManager sharedManager] colorForKey:@"ThemeSecondartTextColor"].CGColor;
    }
    
    else if (_type == 45) {
        backgroundColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"ThemeWhiteColor"];
        self.layer.shadowColor = [[ThemeManager sharedManager] colorForKey:@"Common_Shadow_Color"].CGColor;
        self.layer.cornerRadius = 5.0;
        self.layer.masksToBounds = false;
        self.layer.shadowOffset = CGSizeMake(1.0, 2.0);
        self.layer.shadowOpacity = 0.3;
        self.layer.shadowRadius = 2.0;
    }
    
    else if (_type == 51) {
        backgroundColorTheme1 = [[ThemeManager sharedManager] colorForKey:@"ThemeWhiteColor"];
        self.layer.shadowColor = [[ThemeManager sharedManager] colorForKey:@"Common_Shadow_Color"].CGColor;
        self.layer.cornerRadius = 10.0;
        self.layer.masksToBounds = false;
        self.layer.shadowOffset = CGSizeMake(0, 0);
        self.layer.shadowOpacity = 0.10;
        self.layer.shadowRadius = 4.0;
    }
       
    self.backgroundColor = backgroundColorTheme1;
}


#pragma mark -
#pragma mark - set observer for change theme

- (void)themeDidChangeNotification:(NSNotification *)notification {
    [self applyTheme];
}

@end

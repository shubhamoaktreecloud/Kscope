//
//  ThemeButton.m
//  ShopHop
//
//  Created by on 4/30/18.
//  Copyright © 2018 . All rights reserved.
//

#import "ThemeButton.h"
#import "ThemeManager.h"

@implementation ThemeButton
#define OBJ_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


#pragma mark -
#pragma mark - initialization Methods

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
#pragma mark - Apply Theme to Controll

- (void)applyTheme {

    //set Font
    UIFont *font = nil;
    if(_type == 0 || _type == 1 || _type == 2 || _type == 9 ||  _type == 13) {
        font = [[ThemeManager sharedManager] fontForKey:@"font0" withSizeKey:@"fSize3"];
    }
    
    else if ( _type == 7 || _type == 8 || _type == 11 || _type == 12) {
        font = [[ThemeManager sharedManager] fontForKey:@"font1" withSizeKey:@"fSize2"];
    }
    self.titleLabel.font = font;
   
    //set text color
    UIColor *textColor = nil;
    if (_type == 0 || _type == 9) {
        textColor = [[ThemeManager sharedManager] colorForKey:@"ThemeWhiteColor"];
    }
    else if (_type == 1 || _type == 2 || _type == 11 || _type == 12) {
        textColor = [[ThemeManager sharedManager] colorForKey:@"Primary_Default_Color"];
    }
    else if (_type == 7) {
        textColor = [[ThemeManager sharedManager] colorForKey:@"color7"];
    }
    else if (_type == 8) {
        textColor = [[ThemeManager sharedManager] colorForKey:@"color8"];
    }
    else if (_type == 13) {
        textColor = [[ThemeManager sharedManager] colorForKey:@"Secondary_Color1"];
    }
    else {
        textColor = [[ThemeManager sharedManager] colorForKey:@"Secondary_Color1"];
    }
    [self setTitleColor:textColor forState:UIControlStateNormal];
    
    //set background color
    UIColor *backgroundColor, *primaryTintColor = nil;
    if (_type == 0) {
        backgroundColor = [[ThemeManager sharedManager] colorForKey:@"Primary_Default_Color"];
        if (OBJ_IPAD) {
            self.layer.cornerRadius = 30.0;
        }else {
            self.layer.cornerRadius = 25.0;
        }
        self.layer.shadowColor = [[[ThemeManager sharedManager] colorForKey:@"Primary_Default_Color"] CGColor];
        self.layer.shadowOpacity = 0.8;
        self.layer.shadowRadius = 3.0;
        self.layer.shadowOffset = CGSizeMake(2.0, 2.0);
    }
    else if ( _type == 1) {
        backgroundColor = [[ThemeManager sharedManager] colorForKey:@"ThemeWhiteColor"];
        if (OBJ_IPAD) {
            self.layer.cornerRadius = 30.0;
        }else {
            self.layer.cornerRadius = 25.0;
        }
        self.layer.borderColor = [[[ThemeManager sharedManager] colorForKey:@"Primary_Mono_Color"]CGColor];
        self.layer.borderWidth = 1;
    }
    else if(_type == 3) {
        backgroundColor = [[ThemeManager sharedManager] colorForKey:@"color6"];
    }
    else if (_type == 4) {
        backgroundColor = [[ThemeManager sharedManager] colorForKey:@"color7"];
    }
    else if (_type == 5) {
        backgroundColor = [[ThemeManager sharedManager] colorForKey:@"color8"];
    }
    else if (_type == 9) {
        backgroundColor = [[ThemeManager sharedManager] colorForKey:@"Primary_Default_Color"];
    }
    else if (_type == 12) {
        backgroundColor = [[ThemeManager sharedManager] colorForKey:@"ThemeWhiteColor"];
        if (OBJ_IPAD) {
            self.layer.cornerRadius = 25.0;
        }else {
            self.layer.cornerRadius = 20.0;
        }
        self.layer.borderColor = [[[ThemeManager sharedManager] colorForKey:@"Primary_Mono_Color"]CGColor];
        self.layer.borderWidth = 1;
    }
    else if ( _type == 13) {
        backgroundColor = [[ThemeManager sharedManager] colorForKey:@"ThemeWhiteColor"];
        if (OBJ_IPAD) {
            self.layer.cornerRadius = 30.0;
        }else {
            self.layer.cornerRadius = 25.0;
        }
        self.layer.borderColor = UIColor.groupTableViewBackgroundColor.CGColor;
        self.layer.borderWidth = 1;
    }
    
    self.backgroundColor = backgroundColor;
    
    if (_type == 3 || _type == 4 || _type == 5) {
        primaryTintColor = [[ThemeManager sharedManager] colorForKey:@"ThemeWhiteColor"];
        if (OBJ_IPAD) {
            self.layer.cornerRadius = 25.0;
        }else {
            self.layer.cornerRadius = 20.0;
        }
        [self setImage:[self.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:self.state];
        [self setTintColor:primaryTintColor];
    }
    else if (_type == 6) {
        primaryTintColor = [[ThemeManager sharedManager] colorForKey:@"Secondary_Color2"];
        [self setImage:[self.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:self.state];
        [self setTintColor:primaryTintColor];
    }
    else if (_type == 7) {
        primaryTintColor = [[ThemeManager sharedManager] colorForKey:@"color9"];
        [self setImage:[self.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:self.state];
        [self setTintColor:primaryTintColor];
    }
    else if (_type == 10) {
        primaryTintColor = [[ThemeManager sharedManager] colorForKey:@"Primary_Default_Color"];
        [self setImage:[self.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:self.state];
        [self setTintColor:primaryTintColor];
    }
    
    else if (_type == 1) {
        primaryTintColor = [[ThemeManager sharedManager] colorForKey:@"color4"];
        [self setImage:[self.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:self.state];
        [self setTintColor:primaryTintColor];
    }
    else if (_type == 15) {
        primaryTintColor = [[ThemeManager sharedManager] colorForKey:@"Secondary_Color1"];
        [self setImage:[self.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:self.state];
        [self setTintColor:primaryTintColor];
    }
    
    //Theme1
    
    UIFont *Theme1font = nil;
       if(_type == 16 || _type == 18 || _type == 19 || _type == 20  || _type == 22 || _type == 25 || _type == 26 || _type == 27 || _type == 28 || _type == 29 || _type == 30 || _type == 31 || _type == 32 || _type == 33 || _type == 34 || _type == 35 || _type == 36 || _type == 37) {
           Theme1font = [[ThemeManager sharedManager] fontForKey:@"ThemeFont2" withSizeKey:@"fSize3"];
       }
    else if(_type == 21) {
        Theme1font = [[ThemeManager sharedManager] fontForKey:@"ThemeFont1" withSizeKey:@"fSize2"];
    }
    
    //Taxi Booking
    
    else if (_type == 45 || _type == 46 || _type == 47 || _type == 50 || _type == 51 || _type == 55) {
       Theme1font = [[ThemeManager sharedManager] fontForKey:@"ThemeFont2" withSizeKey:@"fSize4"];
    }
    
    //Banking App
    
    else if(_type == 59 || _type == 60 || _type == 63) {
       Theme1font = [[ThemeManager sharedManager] fontForKey:@"ThemeFont1" withSizeKey:@"fSize3"];
    }
        
    self.titleLabel.font = Theme1font;
    
    //set text color
    
    UIColor *Theme1textColor = nil;
    if (_type == 16 || _type == 19 || _type == 20 || _type == 22 || _type == 25 || _type == 28 || _type == 30 || _type == 26 || _type == 33 ||  _type == 34 || _type == 35 || _type == 36 || _type == 37 || _type == 45 || _type == 47 || _type == 51 || _type == 59 || _type == 60 || _type == 62 || _type == 63) {
        Theme1textColor = [[ThemeManager sharedManager] colorForKey:@"ThemeWhiteColor"];
    }
    else if (_type == 21) {
        Theme1textColor = [[ThemeManager sharedManager] colorForKey:@"Theme5PrimaryColor"];
    }
    else if (_type == 24) {
        Theme1textColor = [[ThemeManager sharedManager] colorForKey:@"Theme7PrimaryColor1"];
    }
    else if (_type == 27 || _type == 55) {
        Theme1textColor = [[ThemeManager sharedManager] colorForKey:@"ThemeBlackColor"];
    }
    else if (_type == 29) {
        Theme1textColor = [[ThemeManager sharedManager] colorForKey:@"Theme8PrimaryColor"];
    }
    else if (_type == 31 || _type == 32) {
        Theme1textColor = [[ThemeManager sharedManager] colorForKey:@"Theme11PrimaryColor"];
    }
    else if (_type == 46) {
        Theme1textColor = [[ThemeManager sharedManager] colorForKey:@"TaxiBookingPrimaryColor"];
    }
    
    // Doctor Plus
    
    if (_type == 50) {
        Theme1textColor = [[ThemeManager sharedManager] colorForKey:@"DoctorPatientPrimaryColor"];
    }
    
    // Fitness App.
    
    else if(_type == 61) {
        Theme1textColor = [[ThemeManager sharedManager] colorForKey:@"Banking_TextColorPrimary"];
    }
    
    [self setTitleColor:Theme1textColor forState:UIControlStateNormal];
      
    //set background color
    
    UIColor *Theme1backgroundColor;
    if (_type == 16) {
        Theme1backgroundColor = [[ThemeManager sharedManager] colorForKey:@"Theme1PrimaryColor"];
        if (OBJ_IPAD) {
            self.layer.cornerRadius = 30.0;
        }else {
            self.layer.cornerRadius = 25.0;
        }
        self.layer.shadowColor = [[[ThemeManager sharedManager] colorForKey:@"Theme1PrimaryColor"] CGColor];
        self.layer.shadowOpacity = 0.8;
        self.layer.shadowRadius = 3.0;
        self.layer.shadowOffset = CGSizeMake(2.0, 2.0);
    }
    else if (_type == 17) {
        Theme1backgroundColor = [[ThemeManager sharedManager] colorForKey:@"Theme2PrimaryColor"];
        if (OBJ_IPAD) {
            self.layer.cornerRadius = 30.0;
        }else {
            self.layer.cornerRadius = 25.0;
        }
        self.layer.shadowColor = [[[ThemeManager sharedManager] colorForKey:@"Theme2PrimaryColor"] CGColor];
        self.layer.shadowOpacity = 0.8;
        self.layer.shadowRadius = 3.0;
        self.layer.shadowOffset = CGSizeMake(2.0, 2.0);
    }
    else if (_type == 19) {
        Theme1backgroundColor = [[ThemeManager sharedManager] colorForKey:@"Theme4PrimaryColor"];
        self.layer.cornerRadius = 10.0;        
    }
    else if (_type == 20) {
        Theme1backgroundColor = [[ThemeManager sharedManager] colorForKey:@"Theme5PrimaryColor"];
        self.layer.cornerRadius = 10.0;
    }
    else if (_type == 22) {
        Theme1backgroundColor = [[ThemeManager sharedManager] colorForKey:@"Theme7PrimaryColor1"];
        self.layer.cornerRadius = 10.0;
        self.layer.shadowColor = [[[ThemeManager sharedManager] colorForKey:@"Theme7ShadowColor"] CGColor];
        self.layer.shadowOpacity = 0.8;
        self.layer.shadowRadius = 3.0;
        self.layer.shadowOffset = CGSizeMake(2.0, 2.0);
    }
    else if (_type == 23) {
        Theme1backgroundColor = [[ThemeManager sharedManager] colorForKey:@"Theme7PrimaryColor2"];
        if (OBJ_IPAD) {
            self.layer.cornerRadius = 25.0;
        }else {
            self.layer.cornerRadius = 20.0;
        }
    }
    else if (_type == 25) {
        Theme1backgroundColor = [[ThemeManager sharedManager] colorForKey:@"Theme6PrimaryColor"];
        self.layer.cornerRadius = 5.0;
    }
    else if (_type == 26) {
        Theme1backgroundColor = [[ThemeManager sharedManager] colorForKey:@"ThemeBlackColor"];
        self.layer.cornerRadius = 5.0;
    }
    else if (_type == 27) {
        Theme1backgroundColor = [[ThemeManager sharedManager] colorForKey:@"ThemeWhiteColor"];
        self.layer.cornerRadius = 5.0;
    }
    else if (_type == 28) {
        Theme1backgroundColor = [[ThemeManager sharedManager] colorForKey:@"Theme8PrimaryColor"];
        self.layer.cornerRadius = 10.0;
    }
    else if (_type == 29) {
        Theme1backgroundColor = [[ThemeManager sharedManager] colorForKey:@"ThemeWhiteColor"];
        self.layer.cornerRadius = 10.0;
    }
    else if (_type == 30) {
        Theme1backgroundColor = [[ThemeManager sharedManager] colorForKey:@"Theme11PrimaryColor"];
        if (OBJ_IPAD) {
            self.layer.cornerRadius = 30.0;
        }else {
            self.layer.cornerRadius = 25.0;
        }
        self.layer.shadowColor = [[[ThemeManager sharedManager] colorForKey:@"Theme11PrimaryColor"] CGColor];
        self.layer.shadowOpacity = 0.8;
        self.layer.shadowRadius = 3.0;
        self.layer.shadowOffset = CGSizeMake(2.0, 2.0);
    }
    else if (_type == 31) {
        Theme1backgroundColor = [[ThemeManager sharedManager] colorForKey:@"ThemeWhiteColor"];
        if (OBJ_IPAD) {
            self.layer.cornerRadius = 30.0;
        }else {
            self.layer.cornerRadius = 25.0;
        }
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = [[[ThemeManager sharedManager] colorForKey:@"Theme11PrimaryColor"] CGColor];
    }
    
    else if (_type == 34) {
        Theme1backgroundColor = [[ThemeManager sharedManager] colorForKey:@"SocialDarkGrayColor"];
        if (OBJ_IPAD) {
            self.layer.cornerRadius = 15.0;
        }else {
            self.layer.cornerRadius = 10.0;
        }
    }
    else if (_type == 35) {
        Theme1backgroundColor = [[ThemeManager sharedManager]colorForKey:@"Social_Light_Blue"];
        if (OBJ_IPAD) {
            self.layer.cornerRadius = 15.0;
        }else {
            self.layer.cornerRadius = 10.0;
        }
    }
    else if (_type == 36) {
        Theme1backgroundColor = [[ThemeManager sharedManager]colorForKey:@"Social_Yellow"];
        if (OBJ_IPAD) {
            self.layer.cornerRadius = 15.0;
        }else {
            self.layer.cornerRadius = 10.0;
        }
    }
    else if (_type == 37) {
        Theme1backgroundColor = [[ThemeManager sharedManager]colorForKey:@"Social_Red"];
        if (OBJ_IPAD) {
            self.layer.cornerRadius = 15.0;
        }else {
            self.layer.cornerRadius = 10.0;
        }
        primaryTintColor = [[ThemeManager sharedManager] colorForKey:@"ThemeWhiteColor"];
        [self setImage:[self.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:self.state];
        [self setTintColor:primaryTintColor];
    }
    else if (_type == 38) {
        Theme1backgroundColor = [[ThemeManager sharedManager]colorForKey:@"SocialPrimaryColor"];
        if (OBJ_IPAD) {
            self.layer.cornerRadius = 15.0;
        }else {
            self.layer.cornerRadius = 10.0;
        }
    }
    
    else if (_type == 39) {
        Theme1backgroundColor = [[ThemeManager sharedManager]colorForKey:@"ThemeViewBackGroundColor"];
        if (OBJ_IPAD) {
            self.layer.cornerRadius = 15.0;
        }else {
            self.layer.cornerRadius = 10.0;
        }
    }
    else if (_type == 45)
       {
           Theme1backgroundColor = [[ThemeManager sharedManager]colorForKey:@"TaxiBookingPrimaryColor"];
           if (OBJ_IPAD) {
               self.layer.cornerRadius = 25.0;
           }else {
               self.layer.cornerRadius = 20.0;
           }
       }

     else if (_type == 46)
       {
           Theme1backgroundColor = [[ThemeManager sharedManager]colorForKey:@"ThemeWhiteColor"];
           if (OBJ_IPAD) {
               self.layer.cornerRadius = 25.0;
           }else {
               self.layer.cornerRadius = 20.0;
           }
       }

    else if (_type == 47)
        {
            Theme1backgroundColor = [[ThemeManager sharedManager]colorForKey:@"ThemeTextColor"];
            if (OBJ_IPAD) {
                self.layer.cornerRadius = 25.0;
            }else {
                self.layer.cornerRadius = 20.0;
            }
        }

    // Doctor Plus
    
    else if (_type == 50)
    {
        Theme1backgroundColor = [[ThemeManager sharedManager]colorForKey:@"ThemeWhiteColor"];
            self.layer.cornerRadius = 10.0;
    }
    
    else if (_type == 51)
    {
        Theme1backgroundColor = [[ThemeManager sharedManager]colorForKey:@"DoctorPatientPrimaryColor"];
        self.layer.cornerRadius = 10.0;
    }
    
    else if (_type == 52) {
        Theme1backgroundColor = [[ThemeManager sharedManager]colorForKey:@"DoctorPatientBtngroundColor"];
        primaryTintColor = [[ThemeManager sharedManager] colorForKey:@"DoctorPatientPrimaryColor"];
        self.layer.cornerRadius = 10.0;
        [self setImage:[self.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:self.state];
        [self setTintColor:primaryTintColor];
    }
    else if (_type == 53) {
        Theme1backgroundColor = [[ThemeManager sharedManager]colorForKey:@"DoctorPatientPrimaryColor"];
        primaryTintColor = [[ThemeManager sharedManager] colorForKey:@"ThemeWhiteColor"];
        self.layer.cornerRadius = 10.0;
        [self setImage:[self.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:self.state];
        [self setTintColor:primaryTintColor];
    }
    else if (_type == 54) {
        Theme1backgroundColor = [[ThemeManager sharedManager]colorForKey:@"DoctorPatientBlueColor"];
        primaryTintColor = [[ThemeManager sharedManager] colorForKey:@"ThemeWhiteColor"];
        self.layer.cornerRadius = 10.0;
        [self setImage:[self.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:self.state];
        [self setTintColor:primaryTintColor];
    }
       
    else if (_type == 55) {
        Theme1backgroundColor = [[ThemeManager sharedManager]colorForKey:@"ThemeWhiteColor"];
        self.layer.cornerRadius = 10.0;
        self.layer.borderColor = [[ThemeManager sharedManager]colorForKey:@"Social_TextColorSecondary"].CGColor;
        self.layer.borderWidth = 0.5;
    }
    
    else if (_type == 56) {
        Theme1backgroundColor = [[ThemeManager sharedManager]colorForKey:@"DoctorAppBackGroundColor"];
        primaryTintColor = [[ThemeManager sharedManager] colorForKey:@"ThemeBlackColor"];
        self.layer.cornerRadius = 10.0;
        self.layer.borderColor = [[ThemeManager sharedManager]colorForKey:@"Social_TextColorSecondary"].CGColor;
        self.layer.borderWidth = 0.5;
        [self setImage:[self.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]forState:self.state];
        [self setTintColor:primaryTintColor];
    }
    
    else if (_type == 57) {
        Theme1backgroundColor = [[ThemeManager sharedManager]colorForKey:@"DoctorAppBackGroundColor"];
        primaryTintColor = [[ThemeManager sharedManager] colorForKey:@"DoctorPatientBlueColor"];
        self.layer.cornerRadius = 10.0;
        self.layer.borderColor = [[ThemeManager sharedManager]colorForKey:@"DoctorPatientBlueColor"].CGColor;
        self.layer.borderWidth = 0.5;
        [self setImage:[self.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:self.state];
        [self setTintColor:primaryTintColor];
    }
    
    
    // Banking App
    
    
    else if (_type == 59) {
        Theme1backgroundColor = [[ThemeManager sharedManager]colorForKey:@"Banking_PrimaryColor"];
        if (OBJ_IPAD) {
            self.layer.cornerRadius = 2.0;
        }else {
            self.layer.cornerRadius = 10.0;
        }
    }
        
    // Fitness App
    
    else if(_type == 60) {
        Theme1backgroundColor = [[ThemeManager sharedManager]colorForKey:@"Fitness_ColorPrimary"];
        self.layer.cornerRadius = self.layer.frame.size.height / 2;
    }
    
    else if (_type == 61) {
        self.layer.cornerRadius = self.layer.frame.size.height / 2;
        self.layer.borderColor = [[ThemeManager sharedManager]colorForKey:@"Banking_TextColorPrimary"].CGColor;
        self.layer.borderWidth = 0.5;
    }
    
    else if (_type == 62) {
        Theme1backgroundColor = [[ThemeManager sharedManager]colorForKey:@"Banking_TextColorPrimary"];
        self.layer.cornerRadius = self.layer.frame.size.height / 2;
    }
    
    else if(_type == 63) {
        Theme1backgroundColor = [[ThemeManager sharedManager]colorForKey:@"Fitness_ColorPrimary"];
        self.layer.cornerRadius = 5.0;
    }
    
    self.backgroundColor = Theme1backgroundColor;
}

+ (UIButton *)setButtonTintColor:(UIButton *)button imageName:(NSString *)imageName state:(UIControlState)state tintColor:(UIColor *)color {
    [button setImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:state];
    [button setTintColor:color];
    return button;
}


#pragma mark -
#pragma mark - set observer for change theme

- (void)themeDidChangeNotification:(NSNotification *)notification {
    [self applyTheme];
}

@end

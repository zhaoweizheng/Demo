//
//  ThemeManager.h
//  ThemeManage
//
//  Created by 邢 on 15-5-29.
//  Copyright (c) 2015年 _MY_COMPANY_. All rights reserved.
//

#import <Foundation/Foundation.h>
#ifndef _SYSTEMCONFIGURATION_H
#error  You should include the `SystemConfiguration` framework and \
add `#import <SystemConfiguration/SystemConfiguration.h>`\
to the header prefix.
#endif

#ifdef _SYSTEMCONFIGURATION_H
extern NSString * const ThemeDidChangeNotification;
#endif

//系统版本判断
#define IOS7_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )

#define kThemeNormal    @"Normal"
#define kThemeOrange    @"Orange"
#define kThemeBlue      @"Blue"
#define kThemeBlack     @"Black"
#define kThemeWhite     @"White"

#define IMAGE(imagePath) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(imagePath) ofType:@"png"]]

#define ThemeImage(imageName) [[ThemeManager sharedInstance] imageWithImageName:(imageName)]

#define Theme_View_BGColor [[ThemeManager sharedInstance] getCommonViewBackgoundColor]

#define Theme_Cell_BGColor [[ThemeManager sharedInstance] getCellBackgoundColor]

#define Theme_Tabbar_BGColor [[ThemeManager sharedInstance] getTabbarBackgoundColor]

#define Theme_Navbar_BGColor [[ThemeManager sharedInstance] getNavbarBackgoundColor]

#define Theme_Button_BGColor [[ThemeManager sharedInstance] getButtonBackgoundColor]

#define Theme_Button_TitleColor [[ThemeManager sharedInstance] getButtonTitleColor]

#define Theme_Label_TextColor(labelType) [[ThemeManager sharedInstance] getLabelTextColor:(labelType)]

#define Theme_TextField_TextColor [[ThemeManager sharedInstance] getTextFieldTextColor]

#define Theme_UILabel_TextFont(labelType) [[ThemeManager sharedInstance] getLabelTextFont:(labelType)]


#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

typedef enum {
    ThemeStatusWillChange = 0, // todo
    ThemeStatusDidChange,
} ThemeStatus;

typedef enum {
    ColorView = 0, // todo
    ColorCell,
    ColorButton,
    ColorButtonTitle,
    ColorNav,
    ColorTabbar,
    ColorLabelText,
    ColorTextFieldText,
} ColorStatus;

@interface ThemeManager : NSObject

@property (strong, nonatomic) NSString *theme;

+ (ThemeManager *)sharedInstance;

- (UIImage *)imageWithImageName:(NSString *)imageName;

- (UIColor *)getCommonViewBackgoundColor;

- (UIColor *)getCellBackgoundColor;

- (UIColor *)getTabbarBackgoundColor;

- (UIColor *)getNavbarBackgoundColor;

- (UIColor *)getColorFromPlistName:(NSString *)plistName colorStatus:(ColorStatus)status;

- (UIColor *)getButtonBackgoundColor;

- (UIColor *)getButtonTitleColor;

- (UIColor *)getLabelTextColor:(TMLabelType)labelType;

- (UIColor *)getTextFieldTextColor;

- (UIFont *)getLabelTextFont:(TMLabelType)labelType;

@end

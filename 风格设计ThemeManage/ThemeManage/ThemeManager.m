//
//  ThemeManager.m
//  ThemeManage
//
//  Created by 邢 on 15-5-29.
//  Copyright (c) 2015年 _MY_COMPANY_. All rights reserved.
//

#import "ThemeManager.h"

NSString * const ThemeDidChangeNotification = @"TM.THEME.CHANGE";

@implementation ThemeManager

@synthesize theme = _theme;

+ (ThemeManager *)sharedInstance
{
    static dispatch_once_t once;
    static ThemeManager *instance = nil;
    dispatch_once( &once, ^{ instance = [[ThemeManager alloc] init]; } );
    return instance;
}

- (void)setTheme:(NSString *)theme
{
    _theme = [theme copy];
    
    // post notification to notify the observers that the theme has changed
    //    ThemeStatus status = ThemeStatusDidChange;
    
    [[NSNotificationCenter defaultCenter]
     postNotificationName:ThemeDidChangeNotification
     object:nil];
}

- (UIImage *)imageWithImageName:(NSString *)imageName
{
    NSString *directory = [NSString stringWithFormat:@"%@/%@", @"resource", [self theme]];
    
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName
                                                          ofType:@"png"
                                                     inDirectory:directory];
    
    return [UIImage imageWithContentsOfFile:imagePath];
}

- (UIColor *)getCommonViewBackgoundColor
{
    if ([self.theme isEqual:kThemeNormal]) {
        return [self getColorFromPlistName:@"ThemeCommonConfig" colorStatus:ColorView];
    }else if ([self.theme isEqual:@"White"]){
        return [self getColorFromPlistName:@"ThemeWhiteConfig" colorStatus:ColorView];
    }
    else if ([self.theme isEqual:@"Orange"]) {
        return UIColorFromRGB(0xffd700);
    }else if([self.theme isEqual:@"Blue"]){
        return UIColorFromRGB(0x6a5acd);
    }else if ([self.theme isEqual:@"Black"]){
        return [self getColorFromPlistName:@"ThemeBlackConfig" colorStatus:ColorView];
    }else{
        return [self getColorFromPlistName:@"ThemeAnotherConfig" colorStatus:ColorView];
    }
}

- (UIColor *)getCellBackgoundColor
{
    if ([self.theme isEqual:kThemeNormal]) {
        return [self getColorFromPlistName:@"ThemeCommonConfig" colorStatus:ColorCell];
    }else if ([self.theme isEqual:@"White"]){
        return [self getColorFromPlistName:@"ThemeWhiteConfig" colorStatus:ColorCell];
    }
    else if ([self.theme isEqual:@"Orange"]) {
        return [UIColor purpleColor];
    }else if([self.theme isEqual:@"Blue"]){
        return UIColorFromRGB(0x87ceeb);
    }else if ([self.theme isEqual:@"Black"]){
        return [self getColorFromPlistName:@"ThemeBlackConfig" colorStatus:ColorCell];
    }else{
        return [self getColorFromPlistName:@"ThemeAnotherConfig" colorStatus:ColorCell];
    }
}

- (UIColor *)getTabbarBackgoundColor
{
    if ([self.theme isEqual:kThemeNormal]) {
        return [self getColorFromPlistName:@"ThemeCommonConfig" colorStatus:ColorTabbar];
    }else if ([self.theme isEqual:@"White"]){
        return [self getColorFromPlistName:@"ThemeWhiteConfig" colorStatus:ColorTabbar];
    }
    else if ([self.theme isEqual:@"Orange"]) {
        return [UIColor orangeColor];
    }else if([self.theme isEqual:@"Blue"]){
        return UIColorFromRGB(0x1e90ff);
    }else if ([self.theme isEqual:@"Black"]){
        return [self getColorFromPlistName:@"ThemeBlackConfig" colorStatus:ColorTabbar];
    }else{
        return [self getColorFromPlistName:@"ThemeAnotherConfig" colorStatus:ColorTabbar];
    }
}

- (UIColor *)getNavbarBackgoundColor
{
    if ([self.theme isEqual:kThemeNormal]) {
        return [self getColorFromPlistName:@"ThemeCommonConfig" colorStatus:ColorNav];
    }else if ([self.theme isEqual:@"White"]){
        return [self getColorFromPlistName:@"ThemeWhiteConfig" colorStatus:ColorNav];
    }
    else if ([self.theme isEqual:@"Orange"]) {
        return [UIColor orangeColor];
    }else if([self.theme isEqual:@"Blue"]){
        return UIColorFromRGB(0x1e90ff);
    }else if ([self.theme isEqual:@"Black"]){
        return [self getColorFromPlistName:@"ThemeBlackConfig" colorStatus:ColorNav];
    }else{
        return [self getColorFromPlistName:@"ThemeAnotherConfig" colorStatus:ColorNav];
    }
}

- (UIColor *)getButtonBackgoundColor
{
    if ([self.theme isEqual:kThemeNormal]) {
        return [self getColorFromPlistName:@"ThemeCommonConfig" colorStatus:ColorButton];
    }else if ([self.theme isEqual:@"White"]){
        return [self getColorFromPlistName:@"ThemeWhiteConfig" colorStatus:ColorButton];
    }
    else if ([self.theme isEqual:@"Orange"]) {
        return [UIColor orangeColor];
    }else if([self.theme isEqual:@"Blue"]){
        return UIColorFromRGB(0x87ceeb);
    }else if ([self.theme isEqual:@"Black"]){
        return [self getColorFromPlistName:@"ThemeBlackConfig" colorStatus:ColorButton];
    }else{
        return [self getColorFromPlistName:@"ThemeAnotherConfig" colorStatus:ColorButton];
    }
}

- (UIColor *)getButtonTitleColor
{
    if ([self.theme isEqual:kThemeNormal]) {
        return [self getColorFromPlistName:@"ThemeCommonConfig" colorStatus:ColorButtonTitle];
    }else if ([self.theme isEqual:@"White"]){
        return [self getColorFromPlistName:@"ThemeWhiteConfig" colorStatus:ColorButtonTitle];
    }
    else if ([self.theme isEqual:@"Orange"]) {
        return [UIColor purpleColor];
    }else if([self.theme isEqual:@"Blue"]){
        return [UIColor whiteColor];
    }else if ([self.theme isEqual:@"Black"]){
        return [self getColorFromPlistName:@"ThemeBlackConfig" colorStatus:ColorButtonTitle];
    }else{
        return [self getColorFromPlistName:@"ThemeAnotherConfig" colorStatus:ColorButtonTitle];
    }
}

- (UIColor *)getLabelTextColor:(TMLabelType)labelType
{
    if ([self.theme isEqual:kThemeNormal]) {
        return [self getLabelColorFromPlistName:@"ThemeCommonConfig" labelType:labelType];
    }else if ([self.theme isEqual:@"White"]){
        return [self getLabelColorFromPlistName:@"ThemeWhiteConfig" labelType:labelType];
    }
    else if ([self.theme isEqual:@"Orange"]) {
        return [UIColor whiteColor];
    }else if([self.theme isEqual:@"Blue"]){
        return [UIColor whiteColor];
    }else if ([self.theme isEqual:@"Black"]){
        return [self getLabelColorFromPlistName:@"ThemeBlackConfig" labelType:labelType];
    }else{
        return [self getLabelColorFromPlistName:@"ThemeAnotherConfig" labelType:labelType];
    }
}

- (UIColor *)getTextFieldTextColor
{
    if ([self.theme isEqual:kThemeNormal]) {
        return [self getColorFromPlistName:@"ThemeCommonConfig" colorStatus:ColorTextFieldText];
    }else if ([self.theme isEqual:@"White"]){
        return [self getColorFromPlistName:@"ThemeWhiteConfig" colorStatus:ColorTextFieldText];
    }
    else if ([self.theme isEqual:@"Orange"]) {
        return [UIColor blackColor];
    }else if([self.theme isEqual:@"Blue"]){
        return UIColorFromRGB(0x292d46);
    }else if ([self.theme isEqual:@"Black"]){
        return [self getColorFromPlistName:@"ThemeBlackConfig" colorStatus:ColorTextFieldText];
    }else{
        return [self getColorFromPlistName:@"ThemeAnotherConfig" colorStatus:ColorTextFieldText];
    }
}

- (UIFont *)getLabelTextFont:(TMLabelType)labelTpye
{
    if ([self.theme isEqual:kThemeNormal]) {
        return [self getLabelTextFontFromPlistName:@"ThemeCommonConfig" labelType:labelTpye];
    }else if ([self.theme isEqual:@"White"]){
        return [self getLabelTextFontFromPlistName:@"ThemeWhiteConfig" labelType:labelTpye];
    }
    else if ([self.theme isEqual:@"Orange"]) {
        return [UIFont systemFontOfSize:16.0];
    }else if([self.theme isEqual:@"Blue"]){
        return [UIFont systemFontOfSize:16.0];
    }else if ([self.theme isEqual:@"Black"]){
        return [self getLabelTextFontFromPlistName:@"ThemeBlackConfig" labelType:labelTpye];
    }else{
        return [self getLabelTextFontFromPlistName:@"ThemeAnotherConfig" labelType:labelTpye];
    }
}

//根据控件类型获取不同控件的背景
- (UIColor *)getColorFromPlistName:(NSString *)plistName colorStatus:(ColorStatus)status
{
    NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType: @"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile: path];
    
    NSString *key = @"";
    switch (status) {
        case ColorView:
            key = @"Color_Bg_View";
            break;
            
        case ColorCell:
            key = @"Color_Bg_Cell";
            
            if ([plistName isEqualToString:@"ThemeCommonConfig"]) {
                return [UIColor clearColor];
            }
            
            break;
            
        case ColorButton:
            key = @"Color_Btn_Normal";
            break;
            
        case ColorNav:
            key = @"Color_Bg_Nav";
            break;
            
        case ColorTabbar:
            key = @"Color_Bg_TabBar";
            break;
            
        case ColorLabelText:
            key = @"Color_Text_Label";
            break;
            
        case ColorTextFieldText:
            key = @"Color_Text_Textfield";
            break;
            
        case ColorButtonTitle:
            key = @"Color_Button_Title";
            break;
            
        default:
            break;
    }
    NSString *colorValue = [dict valueForKey:key];
    NSString *hexString = [NSString stringWithFormat:@"%lu",strtoul([colorValue UTF8String],0,16)];
    return UIColorFromRGB([hexString integerValue]);
}

//获取不同类型的Label的字体颜色
- (UIColor *)getLabelColorFromPlistName:(NSString *)plistName labelType:(TMLabelType)type
{
    NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType: @"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile: path];
    
    NSString *key = @"";
    switch (type) {
        case TMLabelNormal:
            key = @"Color_Label_Normal";
            break;
            
        case TMLabelNotice:
            key = @"Color_Label_Notice";
            break;
            
        case TMLabelMark:
            key = @"Color_Label_Mark";
            break;
            
        case TMLabelHighLight:
            key = @"Color_Label_HighLight";
            break;
            
        case TMLabelLink:
            key = @"Color_Label_Link";
            break;
            
        default:
            break;
    }
    NSString *colorValue = [dict valueForKey:key];
    NSString *hexString = [NSString stringWithFormat:@"%lu",strtoul([colorValue UTF8String],0,16)];
    return UIColorFromRGB([hexString integerValue]);
}

//获取不同类型的Label的字体大小
- (UIFont *)getLabelTextFontFromPlistName:(NSString *)plistName labelType:(TMLabelType)type
{
    NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType: @"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile: path];
    
    NSString *key = @"";
    switch (type) {
        case TMLabelNormal:
            key = @"Font_Label_Normal";
            break;
            
        case TMLabelNotice:
            key = @"Font_Label_Notice";
            break;
            
        case TMLabelMark:
            key = @"Font_Label_Mark";
            break;
            
        case TMLabelHighLight:
            key = @"Font_Label_HighLight";
            break;
            
        case TMLabelLink:
            key = @"Font_Label_Link";
            break;
            
        default:
            break;
    }
    NSString *fontString = [dict valueForKey:key];
    CGFloat fontValue = [fontString floatValue];
    return [UIFont systemFontOfSize:fontValue];
}

- (NSString *)theme
{
    if ( _theme == nil )
    {
        return kThemeNormal;
    }
    return _theme;
}

@end

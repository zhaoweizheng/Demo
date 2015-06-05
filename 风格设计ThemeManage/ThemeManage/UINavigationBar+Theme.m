//
//  UINavigationBar+Theme.m
//  ThemeManage
//
//  Created by 邢 on 15-5-29.
//  Copyright (c) 2015年 _MY_COMPANY_. All rights reserved.
//

#import "UINavigationBar+Theme.h"

@implementation UINavigationBar (Theme)

- (void)addThemeManager
{
    [self configureViews];
    [self regitserAsObserver];
}

#pragma mark
#pragma mark - ThemeManager
- (void)configureViews
{
    // set the background of navigationbar
    if (IOS7_OR_LATER) {
        self.barTintColor = Theme_Navbar_BGColor;
    }
    else {
        self.tintColor = Theme_Navbar_BGColor;
    }
}

- (void)regitserAsObserver
{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self
               selector:@selector(configureViews)
                   name:ThemeDidChangeNotification
                 object:nil];
}

- (void)unregisterAsObserver
{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
}

@end

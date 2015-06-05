//
//  TMButton.m
//  ThemeManage
//
//  Created by 邢 on 15-6-1.
//  Copyright (c) 2015年 _MY_COMPANY_. All rights reserved.
//

#import "TMButton.h"

@implementation TMButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self configureViews];
        
        [self regitserAsObserver];
    }
    return self;
}

- (void)dealloc
{
    [self unregisterAsObserver];
}

#pragma mark
#pragma mark - ThemeManager
- (void)configureViews
{
    // set backgroundColor
    
    [self setBackgroundColor:Theme_Button_BGColor];
    [self setTitleColor:Theme_Button_TitleColor forState:UIControlStateNormal];
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

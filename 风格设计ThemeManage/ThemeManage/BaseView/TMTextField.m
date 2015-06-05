//
//  TMTextField.m
//  ThemeManage
//
//  Created by 邢 on 15-6-1.
//  Copyright (c) 2015年 _MY_COMPANY_. All rights reserved.
//

#import "TMTextField.h"

@implementation TMTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.font = [UIFont systemFontOfSize:16.0];
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
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
    // set the background of textfeild
    
    [self setTextColor:Theme_TextField_TextColor];
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

//
//  TMLabel.m
//  ThemeManage
//
//  Created by 邢 on 15-5-29.
//  Copyright (c) 2015年 _MY_COMPANY_. All rights reserved.
//

#import "TMLabel.h"

@implementation TMLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.font = [UIFont systemFontOfSize:16.0];
        //        self.textColor = [UIColor blackColor];
    }
    return self;
}

- (void)dealloc
{
    [self unregisterAsObserver];
}

- (void)setLabelType:(TMLabelType)labelType
{
    _labelType = labelType;
    self.font = Theme_UILabel_TextFont(labelType);
    [self configureViews];
    [self regitserAsObserver];
}

#pragma mark
#pragma mark - ThemeManager
- (void)configureViews
{
    // set backgroundColor
    
    [self setTextColor:Theme_Label_TextColor(self.labelType)];
    
//    [self setFont:Theme_UILabel_TextFont(self.labelType)];
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

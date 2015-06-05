//
//  TMImageView.m
//  ThemeManage
//
//  Created by 邢 on 15-6-1.
//  Copyright (c) 2015年 _MY_COMPANY_. All rights reserved.
//

#import "TMImageView.h"

@implementation TMImageView

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

- (void)setImageName:(NSString *)imageName
{
    if (imageName) {
        _imageName = imageName;
    }
    self.image = ThemeImage(_imageName);
}

#pragma mark
#pragma mark - ThemeManager
- (void)configureViews
{
    // set backgroundColor
    
    self.image = ThemeImage(_imageName);
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

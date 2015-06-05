//
//  TMTableViewCell.m
//  ThemeManage
//
//  Created by 邢 on 15-6-1.
//  Copyright (c) 2015年 _MY_COMPANY_. All rights reserved.
//

#import "TMTableViewCell.h"

@implementation TMTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        [self regitserAsObserver];
        
        [self configureViews];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)dealloc
{
    [self unregisterAsObserver];
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

#pragma mark
#pragma mark - ThemeManager
- (void)configureViews
{
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc] initWithFrame:self.frame];
    }
    _backgroundView.backgroundColor = Theme_Cell_BGColor;
    self.textLabel.textColor = Theme_Label_TextColor(TMLabelNormal);
    self.backgroundView = _backgroundView;
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

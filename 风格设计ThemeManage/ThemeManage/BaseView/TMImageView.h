//
//  TMImageView.h
//  ThemeManage
//
//  Created by 邢 on 15-6-1.
//  Copyright (c) 2015年 _MY_COMPANY_. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMImageView : UIImageView

@property (nonatomic,strong)    NSString    *imageName;

//- (void)setImage:(UIImage *)image UNAVAILABLE_ATTRIBUTE;

- (void)setImageName:(NSString *)imageName;

@end

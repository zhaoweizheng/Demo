//
//  TMLabel.h
//  ThemeManage
//
//  Created by 邢 on 15-5-29.
//  Copyright (c) 2015年 _MY_COMPANY_. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    TMLabelNormal=0,       //通用
    TMLabelNotice,         //提示
    TMLabelMark,           //备注
    TMLabelHighLight,      //醒目，高亮
    TMLabelLink,           //链接
}TMLabelType;

@interface TMLabel : UILabel

@property (nonatomic, assign)   TMLabelType        labelType;

@end

//
//  TMFirstViewController.m
//  ThemeManage
//
//  Created by 邢 on 15-5-29.
//  Copyright (c) 2015年 _MY_COMPANY_. All rights reserved.
//

#import "TMFirstViewController.h"

@interface TMFirstViewController ()

@end

@implementation TMFirstViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"界面一";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self drawSubViews];
}

#pragma mark
#pragma mark - UI
- (void)drawSubViews
{
    TMLabel *tempLabel = [[TMLabel alloc] initWithFrame:CGRectMake(10, 80, UI_SCREEN_WIDTH-20, 200)];
    [tempLabel setLabelType:TMLabelNormal];
    tempLabel.numberOfLines = 0;
    tempLabel.text = @"这是一个主题风格切换的demo，主要思路包括以下几点\n第一：对比较常用基本的控件做封装，用的时候都继承基类\n第二：使用单例，对风格切换统一控制\n第三：使用通知，当用户点击切换风格时，通知各基类改变风格\n第四：将各控件颜色、字体、背景不同风格的配置存储在plist文件里\n";
    tempLabel.height = [tempLabel.text boundingRectWithSize:CGSizeMake(UI_SCREEN_WIDTH-20, 280) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:tempLabel.font} context:nil].size.height;
    
    
    TMLabel *noticeLabel = [[TMLabel alloc] initWithFrame:CGRectMake(10, tempLabel.bottom+20, UI_SCREEN_WIDTH-20, 150)];
    [noticeLabel setLabelType:TMLabelNotice];
    noticeLabel.numberOfLines = 0;
    noticeLabel.text = @"备注：目前这个demo有5种风格，其中黑色风格、白色风格、普通风格的数据写在了plist文件里，蓝色风格和橙色风格我偷了个懒，就直接写在ThemeManager里了，建议各位都写在plist里，这样比较直观，plist里的数据没写全，各位可以自行将value添加上去，还可以添加一些key&value更细致的切换风格。目前demo可以更改视图界面背景色、更改导航栏颜色、更换label字体颜色、更改tableviewcell背景色、更改button颜色、更换输入框字体颜色等，其他功能可自行增加";
    noticeLabel.height = [noticeLabel.text boundingRectWithSize:CGSizeMake(UI_SCREEN_WIDTH-20, 280) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:noticeLabel.font} context:nil].size.height;

    [self.view addSubview:tempLabel];
    [self.view addSubview:noticeLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  TMThirdViewController.m
//  ThemeManage
//
//  Created by 邢 on 15-5-29.
//  Copyright (c) 2015年 _MY_COMPANY_. All rights reserved.
//

#import "TMThirdViewController.h"

@interface TMThirdViewController ()

@end

@implementation TMThirdViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"界面三";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    TMLabel *tempLabel = [[TMLabel alloc] initWithFrame:CGRectMake(10, 100, UI_SCREEN_WIDTH-20, 200)];
    [tempLabel setLabelType:TMLabelHighLight];
    tempLabel.numberOfLines = 0;
    tempLabel.text = @"各位可以来回切换tab一下，看看不同控件切换风格时的变化，下面是不同风格下，图片的变换，图片不大，将就着看哈！";
    tempLabel.height = [tempLabel.text boundingRectWithSize:CGSizeMake(UI_SCREEN_WIDTH-20, 280) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:tempLabel.font} context:nil].size.height;

    [self.view addSubview:tempLabel];
    
    TMImageView *imageView = [[TMImageView alloc] initWithFrame:CGRectMake(UI_SCREEN_WIDTH/2.0-40, tempLabel.bottom+40, 80, 80)];
    
    [imageView setImageName:@"test"];
    
    [self.view addSubview:imageView];
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

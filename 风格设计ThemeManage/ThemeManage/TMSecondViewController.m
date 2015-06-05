//
//  TMSecondViewController.m
//  ThemeManage
//
//  Created by 邢 on 15-5-29.
//  Copyright (c) 2015年 _MY_COMPANY_. All rights reserved.
//

#import "TMSecondViewController.h"

@interface TMSecondViewController ()

@end

@implementation TMSecondViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"界面二";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *themeTitleList = [NSArray arrayWithObjects:@"白色风格",@"黑色风格",@"蓝色风格",@"橙色风格",@"普通风格", nil];
    
    for (int i = 0; i<5; i++) {
        TMButton *button = [[TMButton alloc] initWithFrame:CGRectMake(20, 100+i*55, UI_SCREEN_WIDTH-40, 45)];
        button.tag = 1001+i;
        [button setTitle:[themeTitleList objectAtIndex:i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

- (void)buttonPressed:(id)sender
{
    TMButton *button = (TMButton *)sender;
    switch (button.tag) {
        case 1001:
            [[ThemeManager sharedInstance] setTheme:kThemeWhite];
            break;
            
        case 1002:
            [[ThemeManager sharedInstance] setTheme:kThemeBlack];
            break;

        case 1003:
            [[ThemeManager sharedInstance] setTheme:kThemeBlue];
            break;

        case 1004:
            [[ThemeManager sharedInstance] setTheme:kThemeOrange];
            break;

        case 1005:
            [[ThemeManager sharedInstance] setTheme:kThemeNormal];
            break;

        default:
            break;
    }
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

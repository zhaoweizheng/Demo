//
//  TMTabBarController.m
//  ThemeManage
//
//  Created by 邢 on 15-5-29.
//  Copyright (c) 2015年 _MY_COMPANY_. All rights reserved.
//

#import "TMTabBarController.h"
#import "TMFirstViewController.h"
#import "TMSecondViewController.h"
#import "TMThirdViewController.h"
#import "TMForthViewController.h"

@interface TMTabBarController ()

@end

@implementation TMTabBarController

- (id)init
{
    self = [super init];
    if (self) {
        
        [self addViewControllers];
        
        [self regitserAsObserver];
    }
    return self;
}

- (void)addViewControllers
{
    TMFirstViewController *firstVC = [[TMFirstViewController alloc] init];
    TMSecondViewController *secondVC = [[TMSecondViewController alloc] init];
    TMThirdViewController *thirdVC = [[TMThirdViewController alloc] init];
    TMForthViewController *forthVC = [[TMForthViewController alloc] init];

    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:firstVC];
    UINavigationController *secondNav = [[UINavigationController alloc] initWithRootViewController:secondVC];
    UINavigationController *thirdNav = [[UINavigationController alloc] initWithRootViewController:thirdVC];
    UINavigationController *forthNav = [[UINavigationController alloc] initWithRootViewController:forthVC];
    
    [firstNav.navigationBar addThemeManager];
    [secondNav.navigationBar addThemeManager];
    [thirdNav.navigationBar addThemeManager];
    [forthNav.navigationBar addThemeManager];

    [self setViewControllers:[NSArray arrayWithObjects:firstNav,secondNav,thirdNav,forthNav, nil] animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureViews];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    [self unregisterAsObserver];
}

#pragma mark
#pragma mark - ThemeManager
- (void)configureViews
{
    // set the background of navigationbar
    if (IOS7_OR_LATER) {
        self.tabBar.barTintColor = Theme_Tabbar_BGColor;
    }
    else {
        self.tabBar.tintColor = Theme_Tabbar_BGColor;
    }
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

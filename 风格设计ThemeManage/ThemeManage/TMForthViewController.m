//
//  TMForthViewController.m
//  ThemeManage
//
//  Created by 邢 on 15-5-29.
//  Copyright (c) 2015年 _MY_COMPANY_. All rights reserved.
//

#import "TMForthViewController.h"

@interface TMForthViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation TMForthViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"界面四";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.frame = self.view.frame;
    
    [self.view addSubview: self.tableView];
}

#pragma mark
#pragma mark - UI
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT-UI_STATUS_BAR_HEIGHT-UI_NAVIGATION_BAR_HEIGHT) style:UITableViewStyleGrouped];
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_tableView setIndicatorStyle:UIScrollViewIndicatorStyleWhite];
        _tableView.scrollEnabled = YES;
        _tableView.userInteractionEnabled = YES;
        _tableView.delegate =self;
        _tableView.dataSource =self;
        _tableView.backgroundColor =[UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.backgroundView = nil;
        
    }
    return _tableView;
}

#pragma mark
#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
        return 2;
    }
    return 3;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 2) {
        return 80;
    }
    return 10.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 2) {
        if (!_footView) {
            _footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UI_SCREEN_WIDTH, 80)];
            TMButton *testBtn = [[TMButton alloc] initWithFrame:CGRectMake(10, 20, UI_SCREEN_WIDTH-20, 40)];
            //            logoutBtn.frame = CGRectMake(10, 20, 300, 40);
            [testBtn.layer setCornerRadius:4.0];
            [testBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
            //            [logoutBtn setBackgroundColor:Color_Blue_Normal];
            [testBtn addTarget:self action:@selector(testAction) forControlEvents:UIControlEventTouchUpInside];
            [testBtn setTitle:@"按钮测试" forState:UIControlStateNormal];
            [_footView addSubview:testBtn];
        }
        return _footView;
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    TMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[TMTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                   reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.textColor = UIColorFromRGB(0x6c6c6c);
        cell.textLabel.font = [UIFont systemFontOfSize:14.0];
    }
    
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
                cell.textLabel.text = @"缓存清理";
            }
            else if(indexPath.row == 1)
            {
                cell.textLabel.text = @"隐私设置";
            }
            else
            {
                cell.textLabel.text = @"安全设置";
            }
            break;
            
        case 1:
        {
            if (indexPath.row == 0) {
                cell.textLabel.text = @"检查更新";
            }
            else if(indexPath.row == 1)
            {
                cell.textLabel.text = @"版本说明";
            }
            else
            {
                cell.textLabel.text = @"反馈";
            }
        }
            break;
            
        case 2:
        {
            if (indexPath.row == 0) {
                cell.textLabel.text = @"使用帮助";
            }
            else
            {
                cell.textLabel.text = @"查看通知";
            }
        }
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (void)testAction
{

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

//
//  SlideMenuViewController.m
//  MyAnimations
//
//  Created by 张润潮 on 2017/2/10.
//  Copyright © 2017年 zrc. All rights reserved.
//

#import "SlideMenuViewController.h"

@interface SlideMenuViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) UIButton    *triggerButton;
@end

@implementation SlideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, Width, Height - 64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    
    self.triggerButton = [[UIButton alloc] initWithFrame:CGRectMake(Width - 100, Height - 100, 80, 50)];
    [self.triggerButton setTitle:@"菜单" forState:UIControlStateNormal];
    [self.triggerButton addTarget:self action:@selector(clickTrigger:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.triggerButton];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)clickTrigger:(id)sender{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"NO. %ld",(long)indexPath.row];
    
    return cell;
}
@end

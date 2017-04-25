//
//  ViewController.m
//  MyAnimations
//
//  Created by 张润潮 on 2017/1/5.
//  Copyright © 2017年 zrc. All rights reserved.
//

#import "ViewController.h"
#import "POPButtonViewController.h"
#import "POPStrokeViewController.h"
#import "MyLoadingViewController.h"
#import "JumpStarViewController.h"
#import "DownloadButtonViewController.h"
#import "ImageHandlerViewController.h"
#import "FirstViewController.h"
#import "WaveViewController.h"
#import "SnowViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView  *tableView;
@property(nonatomic,strong) NSArray      *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Width, self.view.height)];
    self.tableView.dataSource = self;
    self.tableView.delegate   = self;
    self.dataArray = @[
                       @{@"name":@"POP按钮动画",@"class":[POPButtonViewController class]},
                       @{@"name":@"POP stroke",@"class":[POPStrokeViewController class]},
                       @{@"name":@"ball loading",@"class":[MyLoadingViewController class]},
                       @{@"name":@"jump Star",@"class":[JumpStarViewController class]},
                       @{@"name":@"download动画",@"class":[DownloadButtonViewController class]},
                       @{@"name":@"图像处理（未完成）",@"class":[ImageHandlerViewController class]},
                       @{@"name":@"转场动画",@"class":[FirstViewController class]},
                       @{@"name":@"重复动画",@"class":[WaveViewController class]},
                       @{@"name":@"雪花动画",@"class":[SnowViewController class]},

                       ];
    [self.view addSubview:self.tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSInteger row = indexPath.row;
    NSDictionary *dic =  [self.dataArray objectAtIndex:row];
    cell.textLabel.text = [dic objectForKey:@"name"];
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger row = indexPath.row;
    NSDictionary *dic =  [self.dataArray objectAtIndex:row];
    UIViewController *view = [[dic objectForKey:@"class"] new];
    [self.navigationController pushViewController:view animated:YES];
    
}

@end

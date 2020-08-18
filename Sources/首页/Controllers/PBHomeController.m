//
//  PBHomeController.m
//  PBHome
//
//  Created by DaMaiIOS on 17/9/16.
//  Copyright © 2017年 DaMaiIOS. All rights reserved.
//

#import "PBHomeController.h"
#import "PBListController.h"

@interface PBHomeController ()

@end

@implementation PBHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *lab = [[UILabel alloc]init];
    [self.view addSubview:lab];
    lab.font = [UIFont systemFontOfSize:15];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.frame = CGRectMake(50, 200, [UIScreen mainScreen].bounds.size.width-100, 20);
    lab.text = @"点我吧,啊啊啊啊啊啊00";
    lab.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
    [self.view addGestureRecognizer:tap];
}

- (void)tapClick:(UITapGestureRecognizer *)tap {
    PBListController *vc = [[PBListController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    
    vc.desc = @"hello";
    
    [self.navigationController pushViewController:vc animated:YES];
    vc.view.backgroundColor = [UIColor whiteColor];
}

@end

//
//  PBListController.m
//  PBHome
//
//  Created by DaMaiIOS on 17/9/16.
//  Copyright © 2017年 DaMaiIOS. All rights reserved.
//

#import "PBListController.h"
#import "PBListView.h"
#import "PBList.h"
#import "PBListOneController.h"


@interface PBListController ()<PBListViewDelegate>

@property(nonatomic, weak)PBListView *listView;

@end

@implementation PBListController

-(void)routerWithParas:(NSDictionary *)dict {

    self.desc = dict[@"xxx"];

    NSLog(@"我实现了reciveData方法, dict = %@", dict);
}

-(void)backClick:(UIBarButtonItem *)btn {
    
    //[PBRouter routerWithBackPageName:nil andParas:nil];
    
    //[PBRouter routerWithBackPageName:@"PBHomeController" andParas:nil];
    
    [PBRouter routerWithBackPageName:@"PBListOneController" andParas:nil];
    
    //[self.navigationController popViewControllerAnimated:YES];
}


-(void)requestData {
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSMutableArray *objs = [NSMutableArray array];
        for (int i = 0; i < 10; i++) {
            
            PBList *testEspressos = [[PBList alloc]init];
            testEspressos.summaryText = @"我是来自PBHome Bundle的控制器!";
            
            [objs addObject:testEspressos];
        }
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.listView.listArr = objs;
        });
        
    });
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //列表标题
    self.title = self.desc;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backClick:)];
    
    PBListView *listView = [PBListView listView];
    self.listView = listView;
    [self.view addSubview:listView];
    listView.frame = self.view.bounds;
    listView.delegate = self;
    
    [self requestData];
}


-(void)listView:(PBListView *)listView {
    
    UIViewController *vc = [[UIViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    vc.view.backgroundColor = [UIColor whiteColor];
}



@end

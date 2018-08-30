//
//  PBListView.m
//  PBHome
//
//  Created by DaMaiIOS on 17/9/16.
//  Copyright © 2017年 DaMaiIOS. All rights reserved.
//

#import "PBListView.h"
#import "PBListCell.h"

@interface PBListView ()<UITableViewDelegate, UITableViewDataSource>


@property (weak, nonatomic) UITableView *tableView;

@end

@implementation PBListView

+(id)listView {
    return [[self alloc]initWithFrame:CGRectZero];
}

-(id)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        self.tableView = tableView;
        [self addSubview:tableView];
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        
        self.tableView.tableFooterView = [[UIView alloc]init];
        
    }
    return self;
}




-(void)setListArr:(NSArray *)listArr {
    _listArr = listArr;
    
    [self.tableView reloadData];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.listArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PBListCell *cell = [PBListCell listCellWithTableView:tableView];
    
    cell.list = self.listArr[indexPath.row];
    
    cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate listView:self];
}

@end

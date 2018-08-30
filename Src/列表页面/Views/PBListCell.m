//
//  PBListCell.m
//  PBHome
//
//  Created by DaMaiIOS on 17/9/16.
//  Copyright © 2017年 DaMaiIOS. All rights reserved.
//

#import "PBListCell.h"


@interface PBListCell ()

@property(nonatomic, weak)YYLabel *lab;

@end

@implementation PBListCell

+(id)listCellWithTableView:(UITableView *)tableView {
    PBListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PBListCell"];
    if (cell == nil) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PBListCell"];
    }
    return cell;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //lab
        YYLabel *lab = [[YYLabel alloc]initWithFrame:CGRectZero];
        self.lab = lab;
        [self.contentView addSubview:lab];
        lab.font = [UIFont systemFontOfSize:15];
        lab.numberOfLines = 0;
        
        
        //imageView
        UIImageView *imageView = [[UIImageView alloc]init];
        [self.contentView addSubview:imageView];
        imageView.frame = CGRectMake(50, 30, 100, 20);
        imageView.image = [UIImage imageNamed:@"Resource.bundle/pbhome_icon"];
        
    }
    return self;
}

-(void)setList:(PBList *)list {
    _list = list;
    
    [self fillListCell];
}

-(void)fillListCell {
    
    //lab
    self.lab.frame = CGRectMake(20, 10, [UIScreen mainScreen].bounds.size.width-40, 20);
    self.lab.text = self.list.summaryText;
}

-(void)dealloc {
    //NSLog(@"PBListCell对象被释放了");
}

@end

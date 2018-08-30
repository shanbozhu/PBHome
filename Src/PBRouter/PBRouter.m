//
//  PBRouter.m
//  PBMine
//
//  Created by DaMaiIOS on 2017/11/30.
//  Copyright © 2017年 DaMaiIOS. All rights reserved.
//

#import "PBRouter.h"

@implementation PBRouter

//GoPage
+(void)routerWithGoPageName:(NSString *)pageName andParas:(NSDictionary *)paras {
    //PBRouter *router = [[PBRouter alloc]init];
    
    Class class = NSClassFromString(pageName);
    UIViewController *vc = [[class alloc]init];
    if (vc == nil) {
        return;
    }
    vc.hidesBottomBarWhenPushed = YES;
    
    //[vc setValue:@"world" forKey:@"desc"];
    
    if ([vc respondsToSelector:@selector(routerWithParas:)]) {
        [vc performSelector:@selector(routerWithParas:) withObject:paras];
    }
    
    UINavigationController *nav = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [nav pushViewController:vc animated:YES];
    vc.view.backgroundColor = [UIColor whiteColor];
}

//BackPage
+(void)routerWithBackPageName:(NSString *)pageName andParas:(NSDictionary *)paras {
    
    Class class = NSClassFromString(pageName);
    
    UINavigationController *nav = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    
    if (pageName == nil) {
        
        [nav popViewControllerAnimated:YES];
        
        return;
    }
    
    //导航栈中可能存在
    for (UIViewController *tmpVc in nav.viewControllers) {
        if ([tmpVc isKindOfClass:class]) {
            
            [nav popToViewController:tmpVc animated:YES];
            
            return;
        }
    }
    
    //导航栈中不存在,tab中可能存在
    UITabBarController *tab = nav.viewControllers[0];
    for (int i = 0; i < tab.viewControllers.count; i++) {
        UIViewController *tmpVc = tab.viewControllers[i];
        if ([tmpVc isKindOfClass:class]) {
            
            [nav popToViewController:tab animated:YES];
            tab.selectedIndex = i;
            
            return;
        }
    }
    
    //导航栈和tab中都不存在
    NSMutableArray *objs = [NSMutableArray arrayWithArray:nav.viewControllers];
    [objs removeLastObject];
    
    UIViewController *tmpVc = [[class alloc]init];
    if (tmpVc == nil) {
        return;
    }
    [objs addObject:tmpVc];
    
    [objs addObject:nav.viewControllers.lastObject];
    
    nav.viewControllers = objs;
    
    [nav popToViewController:tmpVc animated:YES];
    tmpVc.view.backgroundColor = [UIColor whiteColor];
    
    return;
    
}

-(void)dealloc {
    NSLog(@"PBRouter对象被释放了");
}

@end

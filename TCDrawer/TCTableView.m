//
//  TCTableView.m
//  TCDrawer
//
//  Created by lotic on 16/3/6.
//  Copyright © 2016年 lotic. All rights reserved.
//

#import "TCTableView.h"
#import "UIView+MJExtension.h"
#import "MJTestViewController.h"
#import "UIViewController+Example.h"
#import "MJRefresh.h"
@implementation TCTableView

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"%s",__func__);
//
//}
#pragma mark 只加载一次数据
- (void)loadOnceData
{
    // 1.添加假数据
    for (int i = 0; i<5; i++) {
        [self.data addObject:MJRandomData];
    }
    [self reloadData];
}






@end

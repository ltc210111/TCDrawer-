//
//  TCTableView.h
//  TCDrawer
//
//  Created by lotic on 16/3/6.
//  Copyright © 2016年 lotic. All rights reserved.
//

#import <UIKit/UIKit.h>
#define MJRandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]

@interface TCTableView : UITableView
@property (strong, nonatomic) NSMutableArray *data;
@end

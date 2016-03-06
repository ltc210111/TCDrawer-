//
//  DrawerBody.h
//  TCDrawer
//
//  Created by lotic on 16/3/6.
//  Copyright © 2016年 lotic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawerBody : CALayer
@property (assign, nonatomic) BOOL Open;
@property (assign, nonatomic) int BtnNUm;
-(void)initBtnWithNum:(int)num ;
@end

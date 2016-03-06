//
//  DrawerBody.m
//  TCDrawer
//
//  Created by lotic on 16/3/6.
//  Copyright © 2016年 lotic. All rights reserved.
//

#import "DrawerBody.h"
#import "DefineAny.h"

@implementation DrawerBody

-(void)drawInContext:(CGContextRef)ctx {
    //1.绘制图形
    //画一个圆
    CGContextAddEllipseInRect(ctx, CGRectMake(self.frame.size.height/4, self.frame.size.height/4, self.bounds.size.height/2, self.bounds.size.height/2));
    CGContextSetRGBFillColor(ctx, 1, 1, 1, 0.5);
    //2.渲染
    CGContextFillPath(ctx);
}

-(instancetype)init {
    if(self = [super init]) {
        [self initBtnWithNum:self.BtnNUm];
    }
    return self;
}

-(void)initBtnWithNum:(int)num {

}
@end

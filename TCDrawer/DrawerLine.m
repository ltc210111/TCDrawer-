//
//  DrawerLine.m
//  TCDrawer
//
//  Created by lotic on 16/3/7.
//  Copyright © 2016年 lotic. All rights reserved.
//

#import "DrawerLine.h"
#import "DefineAny.h"
@implementation DrawerLine
-(void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, CGRectMake(self.frame.size.width/4, self.frame.size.height/4, self.frame.size.width/2, self.frame.size.height/2));
    CGContextSetLineWidth(ctx, 10);
    [Licolor setStroke];
    CGContextStrokePath(ctx);
}
@end

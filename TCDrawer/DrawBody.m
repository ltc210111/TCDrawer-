//
//  DrawBody.m
//  TCDrawer
//
//  Created by lotic on 16/3/9.
//  Copyright © 2016年 lotic. All rights reserved.
//

#import "DrawBody.h"

@implementation DrawBody
+ (id)sharedBody
{
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

-(instancetype)init {
    if(self = [super init]) {
        [self drawLayer:self.layer inContext:UIGraphicsGetCurrentContext()];
    }
    return self;
}

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    //1.绘制图形
    //画两个圆
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, self.bounds.size.height, self.bounds.size.height));
        CGContextSetRGBFillColor(ctx, 0.3, 0.3, 0.3, 0.4);
    CGContextDrawPath(ctx, kCGPathFill);

    CGContextAddEllipseInRect(ctx, CGRectMake(self.bounds.size.height*1/4, self.bounds.size.height*1/4, self.bounds.size.height/2, self.bounds.size.height/2));
    CGContextSetFillColorWithColor(ctx, [UIColor colorWithRed:207.0/ 255.0 green:207/ 255.0 blue:207/ 255.0 alpha:0.6].CGColor);
    
    //2.渲染
    CGContextFillPath(ctx);
}
@end

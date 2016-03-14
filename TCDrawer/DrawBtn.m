//
//  DrawBtn.m
//  TCDrawer
//
//  Created by lotic on 16/3/7.
//  Copyright © 2016年 lotic. All rights reserved.
//

#import "DrawBtn.h"
#import "ViewController.h"
@implementation DrawBtn
-(instancetype)initWithFrame:(CGRect)frame andLabelname:(NSString *)name {
    if(self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self setTitle:name forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithRed:200.0/255.0 green:150.0/255.0 blue:150.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        [self addTarget:self action:@selector(touch) forControlEvents:UIControlEventTouchDown];
    }
    return self;
}

-(void)touch {
    [self.delegate clickAct];
    NSLog(@"%s",__func__);
}

@end

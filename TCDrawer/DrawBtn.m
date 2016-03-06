//
//  DrawBtn.m
//  TCDrawer
//
//  Created by lotic on 16/3/7.
//  Copyright © 2016年 lotic. All rights reserved.
//

#import "DrawBtn.h"

@implementation DrawBtn
-(instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self setBackgroundImage:[UIImage imageNamed:@"refresh"] forState:UIControlStateNormal
         ];
    }
    return self;
}
@end

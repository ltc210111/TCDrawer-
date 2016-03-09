//
//  DrawBtn.m
//  TCDrawer
//
//  Created by lotic on 16/3/7.
//  Copyright © 2016年 lotic. All rights reserved.
//

#import "DrawBtn.h"

@implementation DrawBtn
-(instancetype)initWithFrame:(CGRect)frame andLabelname:(NSString *)name {
    if(self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blueColor];
        [self setTitle:name forState:UIControlStateNormal];
        
        
}
    return self;
}


@end

//
//  DrawBtn.h
//  TCDrawer
//
//  Created by lotic on 16/3/7.
//  Copyright © 2016年 lotic. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol BtnDelgate<NSObject>
-(void)clickAct;
@end

@interface DrawBtn : UIButton
@property(assign,nonatomic)CGFloat *x;
@property(assign,nonatomic)CGFloat *y;
-(instancetype)initWithFrame:(CGRect)frame andLabelname:(NSString *)name;

@property (nonatomic, unsafe_unretained) id<BtnDelgate> delegate;
@end



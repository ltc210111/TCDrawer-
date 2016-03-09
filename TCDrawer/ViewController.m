//
//  ViewController.m
//  TCDrawer
//
//  Created by lotic on 16/3/6.
//  Copyright © 2016年 lotic. All rights reserved.
//

#import "ViewController.h"
#import "TCTableView.h"
#import "DefineAny.h"
#import "DrawBody.h"
#import "DrawerLine.h"
#import "DrawBtn.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *myView;
@property (strong, nonatomic) UIScrollView *myScrollView;
@property (strong, nonatomic) TCTableView *myTableView;
@property (strong, nonatomic) DrawBody *DrawerBody;
@property (strong, nonatomic) DrawerLine *DrawerLine;
@property (assign, nonatomic) int BtnNum;
@end

@implementation ViewController

- (void)viewDidLoad {
//    set the button num first
    self.BtnNum = 4;
    
    [super viewDidLoad];
    [self addScrollView];
    [self addTableView];
    [self addDrawBody];
    [self addPanInTableVIew];
    [self addDrawerLine];
}


-(void)handlePan:(UIPanGestureRecognizer *)sender {
    CGFloat dx = [sender translationInView:self.myScrollView].x;
    if(dx < -20 && !self.DrawerBody.Open) {
//        显示抽屉
        [UIView animateWithDuration:0.2f animations:^{
            [self.myTableView addSubview:self.DrawerBody];
            self.DrawerBody.layer.frame = CGRectMake(self.view.frame.size.width-TCLength/2, (self.view.frame.size.height-TCLength)/2, TCLength, TCLength);
             [_DrawerBody.layer setNeedsDisplay];
        }];
//        [self addBtn];
//        显示光圈
        [UIView transitionWithView:self.view duration:0.5f options:UIViewAnimationOptionAllowUserInteraction animations:^{
            self.DrawerLine.frame= CGRectMake(self.view.frame.size.width-self.view.frame.size.height/2, 0, self.view.frame.size.height, self.view.frame.size.height);
            self.DrawerLine.alpha = 0;
            [self.DrawerLine setNeedsDisplay];
        }completion:^(BOOL finished) {
            self.DrawerBody.Open = true;
        }];
    }
    
    if(dx > 20 && self.DrawerBody.Open) {
//        隐藏抽屉
        self.DrawerBody.frame = CGRectMake(self.view.frame.size.width,self.view.frame.size.height/2, 0,0);
        [_DrawerBody setNeedsDisplay];
//        隐藏光圈
        self.DrawerLine.frame= CGRectMake(self.view.frame.size.width, (self.view.frame.size.height)/2, 0, 0);
        [self.DrawerLine setNeedsDisplay];
        self.DrawerBody.Open = false;
        self.DrawerLine.alpha = 1;
        [self.DrawerBody removeFromSuperview];
    }
}

-(void)addScrollView {
    self.myScrollView = [[UIScrollView alloc]init];
    [self.myScrollView setFrame:[[UIScreen mainScreen]bounds]];
    [self.myView addSubview:self.myScrollView];
    NSLog(@"%s-%f",__func__,self.myScrollView.frame.size.width);
}

-(void)addTableView {
    self.myTableView = [[TCTableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.myTableView.backgroundColor = [UIColor whiteColor];
    self.myTableView.delegate = self;
    [self.myView addSubview:self.myTableView];
     NSLog(@"%s-%f",__func__,self.myTableView.frame.size.width);
}

-(void)addDrawBody {
    _DrawerBody = [[DrawBody alloc]init];
    _DrawerBody.frame = CGRectMake(self.view.frame.size.width,self.view.frame.size.height/2, 0,0);
    _DrawerBody.backgroundColor = [UIColor clearColor];
    [self.myTableView.layer addSublayer:_DrawerBody.layer];
     NSLog(@"%s-%f",__func__,self.DrawerBody.frame.size.width);
}

-(void)addPanInTableVIew {
    UIPanGestureRecognizer *panGestureRecognize = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.myTableView addGestureRecognizer:panGestureRecognize];
}

-(void)addDrawerLine {
    self.DrawerLine = [[DrawerLine alloc]initWithFrame:CGRectMake(self.view.frame.size.width, (self.view.frame.size.height)/2, 0, 0)];
    self.DrawerLine.backgroundColor = [UIColor clearColor];
    [self.myTableView addSubview:self.DrawerLine];
}

-(void)addBtn {
    CGFloat perT = M_PI /(self.BtnNum+1);
    for(int i =1 ;i <= self.BtnNum ;i++) {
        CGFloat x = self.DrawerBody.bounds.size.width/2 - self.DrawerBody.bounds.size.width/2*(sin(perT*i));
        CGFloat y = self.DrawerBody.bounds.size.height/2 - self.DrawerBody.bounds.size.width/2*(cos(perT*i));
        NSLog(@"%f-------%f",x,y);
        DrawBtn *btn = [[DrawBtn alloc]initWithFrame:CGRectMake(x/2, y - 10, 50, 20) andLabelname:[NSString stringWithFormat:@"%d",i]];
        [self.DrawerBody addSubview:btn];
    }
}
@end

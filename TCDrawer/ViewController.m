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
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,BtnDelgate>
@property (strong, nonatomic) IBOutlet UIView *myView;
@property (strong, nonatomic) UIScrollView *myScrollView;
@property (strong, nonatomic) TCTableView *myTableView;
@property (strong, nonatomic) DrawBody *DrawerBody;
@property (strong, nonatomic) DrawerLine *DrawerLine;
@property (assign, nonatomic) NSInteger BtnNum;
@property (assign,nonatomic) NSMutableArray * BtnArray;

@end

@implementation ViewController

- (void)viewDidLoad {
//   唯一设置
    self.BtnNum = 5;
    
    self.BtnArray = [NSMutableArray array];
    [super viewDidLoad];
    [self addScrollView];
    [self addTableView];
    [self addDrawBody];
    [self addPanInTableVIew];
}


-(void)handlePan:(UIPanGestureRecognizer *)sender {

    CGFloat dx = [sender translationInView:self.myScrollView].x;
    if(dx < -20) {
//        NSLog(@"%lu",(unsigned long)self.BtnArray.count);
        [UIView transitionWithView:self.view duration:0.3 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            self.DrawerBody.frame = CGRectMake(self.view.frame.size.width-TCLength/2, (self.view.frame.size.height-TCLength)/2, TCLength, TCLength);
            [_DrawerBody.layer setNeedsDisplay];
            
        } completion:^(BOOL finished) {
         [self addBtn];
        }];
        
        [UIView transitionWithView:self.view duration:0.5 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            self.DrawerLine.frame= CGRectMake(self.view.frame.size.width-self.view.frame.size.height/2, 0, self.view.frame.size.height, self.view.frame.size.height);
            self.DrawerLine.alpha = 0;
            [self.DrawerLine setNeedsDisplay];
        }completion:^(BOOL finished) {
            self.DrawerBody.Open = true;
        }];
    }
    
    if(dx > 20 && self.DrawerBody.Open) {
        self.DrawerBody.frame = CGRectMake(self.view.frame.size.width,self.view.frame.size.height/2, 0,0);
        [_DrawerBody setNeedsDisplay];
        [UIView transitionWithView:self.view duration:0.5 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            self.DrawerLine.frame= CGRectMake(self.view.frame.size.width, (self.view.frame.size.height)/2, 0, 0);
            self.DrawerLine.alpha = 1;
            [self.DrawerLine setNeedsDisplay];
        }completion:^(BOOL finished) {
            self.DrawerBody.Open = false;
        }];
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
    _DrawerBody = [DrawBody sharedBody];
    _DrawerBody.frame = CGRectMake(self.view.frame.size.width,self.view.frame.size.height/2, 0,0);
    _DrawerBody.backgroundColor = [UIColor whiteColor];
    [self.myTableView addSubview:_DrawerBody];
    [self addDrawerLine];
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
//CGRectMake(R - R*sin(angle*i),R + R*cos(angle*i)-25/2,50,25)
-(void)addBtn {
    if(self.BtnArray.count==1) {
        for (int i = 1; i<=self.BtnNum; ++i) {
            double angle = M_PI/(self.BtnNum+1);
            DrawBtn *btn = [[DrawBtn alloc]initWithFrame:CGRectMake(R - R*sin(angle*i),R + R*cos(angle*i)-25/2,50,25) andLabelname:[NSString stringWithFormat:@"%d",i]];
            [self.DrawerBody addSubview:btn];
            btn.delegate = self;
            [self.BtnArray addObject:btn];
        }
    }
}
-(void)clickAct {
    NSLog(@"%s",__func__);
}

@end

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
#import "DrawerBody.h"
#import "DrawerLine.h"
#import "DrawBtn.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *myView;
@property (strong, nonatomic) UIScrollView *myScrollView;
@property (strong, nonatomic) TCTableView *myTableView;
@property (strong, nonatomic) DrawerBody *DrawerBody;
@property (strong, nonatomic) DrawerLine *DrawerLine;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addScrollView];
    [self addTableView];
    [self addDrawBody];
    [self addPanInTableVIew];
    [self addDrawerLine];
    NSLog(@"123");
}


-(void)handlePan:(UIPanGestureRecognizer *)sender {
    [CATransaction setDisableActions:NO];
    [CATransaction setAnimationDuration:0.2];
    CGFloat dx = [sender translationInView:self.myScrollView].x;
    if(dx < -20) {
            DrawBtn *btn = [[DrawBtn alloc]initWithFrame:CGRectMake(self.view.frame.size.width-110,self.view.frame.size.height/2-56,50,50)];
        self.DrawerBody.frame = CGRectMake(self.view.frame.size.width-TCLength/2, (self.view.frame.size.height-TCLength)/2, TCLength, TCLength);
        self.DrawerBody.cornerRadius=self.DrawerBody.frame.size.width/2;
        [_DrawerBody setNeedsDisplay];
        
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
        self.DrawerBody.cornerRadius=self.DrawerBody.frame.size.width/2;
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
    _DrawerBody = [DrawerBody layer];
    [_DrawerBody initBtnWithNum:2];
    _DrawerBody.frame = CGRectMake(self.view.frame.size.width,self.view.frame.size.height/2, 0,0);
    _DrawerBody.backgroundColor = Grcolor.CGColor;
    _DrawerBody.cornerRadius=self.DrawerBody.frame.size.width;
    [self.myTableView.layer addSublayer:_DrawerBody];
    
    DrawBtn *btn = [[DrawBtn alloc]initWithFrame:CGRectMake(self.view.frame.size.width,self.view.frame.size.height/2-56,50,50)];
    [self.myTableView addSubview:btn];
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
@end

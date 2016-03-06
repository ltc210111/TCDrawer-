//
//  DefineAny.h
//  TCDrawer
//
//  Created by lotic on 16/3/7.
//  Copyright © 2016年 lotic. All rights reserved.
//

#ifndef DefineAny_h
#define DefineAny_h
#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES : NO)
#define StatusBarHeight (IOS7==YES ? 0 : 20)
#define BackHeight      (IOS7==YES ? 0 : 15)
#define fNavBarHeigth (IOS7==YES ? 64 : 44)
#define TCLength 250
#define XMQcolor [UIColor colorWithRed:207.0/ 255.0 green:54.0/ 255.0 blue:140.0/ 255.0 alpha:1.0]
#define Grcolor [UIColor colorWithRed:207.0/ 255.0 green:207.0/ 255.0 blue:207.0/ 255.0 alpha:1.0]
#define Licolor [UIColor colorWithRed:55.0/ 255.0 green:55.0/ 255.0 blue:55.0/ 255.0 alpha:1.0]
#define BtnWid 20
#endif /* DefineAny_h */

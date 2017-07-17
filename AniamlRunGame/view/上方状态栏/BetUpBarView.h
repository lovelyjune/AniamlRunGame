//
//  BetUpBarView.h
//  Horse
//
//  Created by 叶颖欣 on 14/6/1.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BetUpBarView : UIView

-(void)setTotalMoney:(int)money;

//设置是否可用
-(void)setEnable:(Boolean)enable;

//金钱不够
-(void)moneyNoEnough;

//更新自己现在的总金额
-(void)updataMyTotalMoney;

@end

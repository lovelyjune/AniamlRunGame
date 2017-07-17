//
//  BetFloor.h
//  Horse
//
//  Created by 叶颖欣 on 14/5/26.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimationBaseView.h"

@interface BetFloor : AnimationBaseView

-(void)startMove;

-(void)stopMove;

//设置终点线的位置
-(void)setLinePosX:(CGFloat)posX;

//重置起跑线
-(void)resetStartLine;

@end

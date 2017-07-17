//
//  BetGameMainView.h
//  Horse
//
//  Created by 叶颖欣 on 14/5/31.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BetGameMainView : UIView

//开始投注倒数
-(void)startCountDown;

//隐藏投注倒数
-(void)hideCountDown;

//显示开始按钮
-(void)showStartGameBtn;

//隐藏开始按钮
-(void)hideStartGameBtn;

//显示赢钱框
-(void)showBigWinView:(int)money;

//隐藏赢钱框
-(void)hideBigWinView;

//重置所有动物的位置
-(void)resetAllAnimalPos;

//重置起跑线
-(void)resetStartLine;

//所有动物开始跑
-(void)startRunAllAnimal;

//所有动物结束跑，向右移动
-(void)finishRunAllAnimal;

//显示所有动物的最终 位置
-(void)showAllAnimalFinallyPos;

//改变某个动物的动画速度
-(void)speedChangeWithAnimal:(int)animalIndex andSpeed:(int)speedIndex;

//背景开始移动
-(void)startBackgroundMove;

//背景停止移动
-(void)stopBackgroundMove;

//地板开始移动
-(void)startFloorMove;

//地板停止移动
-(void)stopFloorMove;

//显示胜者历史记录框
-(void)showHistoryBoxWithArr:(NSMutableArray*)historyArr;

//隐藏胜者记录框
-(void)hideHistoryBox;

//设置底部终点线的位置
-(void)setFloorLinePosX:(CGFloat)posX;

@end

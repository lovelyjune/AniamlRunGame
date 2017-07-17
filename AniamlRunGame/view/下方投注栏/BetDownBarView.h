//
//  BetDownBarView.h
//  Horse
//
//  Created by 叶颖欣 on 14/5/31.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BetDownBarView : UIView

//设置投注额的label
-(void)setBetAniamlLabel:(int)animalIndex;

//设置下方投注是否可用
-(void)setEnable:(Boolean)enable;

//总投注额
-(void)setBaseBetLabel:(int)money;

//复位所有下方的投注按钮
-(void)resetAllAnimalButton;

//设置下方投注按钮高亮，当赢的时候就高亮
-(void)setAniamlBtnHighLight:(int)btnIndex;

//复位所有投注label，清0
-(void)resetAllBetLabel;


@end

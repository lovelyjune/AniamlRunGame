//
//  BetGameMainView.m
//  Horse
//
//  Created by 叶颖欣 on 14/5/31.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import "BetGameMainView.h"
#import "BetAnimalView1.h"
#import "BetAnimalView2.h"
#import "BetAnimalView3.h"
#import "BetAnimalView4.h"
#import "BetAnimalView5.h"
#import "BetAnimalView6.h"
#import "BetAniamlBaseView.h"
#import "BetBackground.h"
#import "BetFloor.h"
#import "BetGameModel.h"
#import "BigWinView.h"
#import "HistoryBoxView.h"

@interface BetGameMainView()
{
    UIImageView * _countDownImgView;
    NSTimer * _startGameCountDownTimer;
    CGFloat _startGameCountDownInterval;
    int _countDownIndex;
    BetGameModel * _betGameModel;
    BetBackground * _betBackground;
    BetFloor * _betFloor;
    UIView * _animalSpr;
    BetAnimalView1 * _animal1;
    BetAnimalView2 * _animal2;
    BetAnimalView3 * _animal3;
    BetAnimalView4 * _animal4;
    BetAnimalView5 * _animal5;
    BetAnimalView6 * _animal6;
    UIButton * _startGameBtn;
    UIView * _blackView;        //黑场
    BigWinView * _bigWinView;   //赢钱框
    HistoryBoxView * _historyBoxView;       //历史胜者框
}
@end

@implementation BetGameMainView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initData];
        [self initView];
    }
    return self;
}

-(void)initData
{
    _betGameModel = [BetGameModel getInstance];
}


-(void)initView
{
    [self addUpBackground];
    [self addFloor];
    [self showAllAnimal];
}


-(void)addUpBackground
{
    _betBackground = [[BetBackground alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 85)];
    [self addSubview:_betBackground];
    _betBackground.animationDuration = 1.0/30.0;
}

-(void)addFloor
{
    _betFloor = [[BetFloor alloc]initWithFrame:CGRectMake(0, 37, self.frame.size.width, 180)];
    [self addSubview:_betFloor];
}

//显示胜者历史记录框
-(void)showHistoryBoxWithArr:(NSMutableArray*)historyArr
{
    if(!_historyBoxView)
    {
        _historyBoxView = [[HistoryBoxView alloc]initWithFrame:CGRectMake(self.frame.size.width-313, 30, 311.5, 70)];
        [self addSubview:_historyBoxView];
    }
    [_historyBoxView addWinnerHistoryArray:historyArr];
    _historyBoxView.hidden = false;
}

//隐藏胜者记录框
-(void)hideHistoryBox
{
    _historyBoxView.hidden = true;
}

//背景开始移动
-(void)startBackgroundMove
{
    [_betBackground startAnimating];
}

//背景停止移动
-(void)stopBackgroundMove
{
    [_betBackground stopAnimating];
}

//地板开始移动
-(void)startFloorMove
{
    [_betFloor startMove];
}

//地板停止移动
-(void)stopFloorMove
{
    [_betFloor stopMove];
}

//设置底部终点线的位置
-(void)setFloorLinePosX:(CGFloat)posX
{
    [_betFloor setLinePosX:posX];
}

//重置起跑线
-(void)resetStartLine
{
    [_betFloor resetStartLine];
}

//显示赢钱框
-(void)showBigWinView:(int)money
{
    if(!_bigWinView)
    {
        _bigWinView = [[BigWinView alloc]initWithFrame:CGRectMake(self.frame.size.width/2-(157.5/2), -82, 157.5, 82)];
        [self addSubview:_bigWinView];
    }
    [_bigWinView showBigWin:money];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    _bigWinView.center = self.center;
    
    [UIView commitAnimations];
}

//隐藏赢钱框
-(void)hideBigWinView
{
//    [_bigWinView hideBigWin];
//    [_bigWinView removeFromSuperview];
//    _bigWinView = nil;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    _bigWinView.frame = CGRectMake(self.frame.size.width/2-(157.5/2), -82, 157.5, 82);
    
    [UIView commitAnimations];
}

-(void)countdownHandler
{
    _countDownIndex --;
    
    if(_countDownIndex <= 0)
    {
        [_countDownImgView removeFromSuperview];

        //倒数完毕
        [[NSNotificationCenter defaultCenter] postNotificationName:_betGameModel.EVENT_GAME_START_GAME_NOW object:nil];
    }
    else
    {
        UIImage * picImg = [UIImage imageNamed:[NSString stringWithFormat:@"countdown_img_%i.png",_countDownIndex]];
        [_countDownImgView setImage:picImg];
    }
}


//开始投注倒数
-(void)startCountDown
{
    _countDownIndex = 20;
    _startGameCountDownInterval = 1.0;
    _startGameCountDownTimer = [NSTimer scheduledTimerWithTimeInterval:_startGameCountDownInterval target:self selector:@selector(countdownHandler) userInfo:nil repeats:YES];
    
    _countDownImgView = [[UIImageView alloc]initWithFrame:CGRectMake(self.bounds.size.width/2-31, self.bounds.size.height/2-10, 62.5, 55)];
    UIImage * picImg = [UIImage imageNamed:[NSString stringWithFormat:@"countdown_img_%i.png",_countDownIndex]];
    [_countDownImgView setImage:picImg];
    [self addSubview:_countDownImgView];
}

//隐藏投注倒数
-(void)hideCountDown
{
    [_startGameCountDownTimer invalidate];
    _startGameCountDownTimer = nil;
    
    [_countDownImgView removeFromSuperview];
    _countDownImgView = nil;
}

//显示开始游戏按钮
-(void)showStartGameBtn
{
    _startGameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _startGameBtn.frame = CGRectMake(self.bounds.size.width/2-50, self.bounds.size.height/2+42, 102.5, 40.5);
    [_startGameBtn setImage:[UIImage imageNamed:@"bet_startGameBtn.png"] forState:UIControlStateNormal];
    [_startGameBtn addTarget:self action:@selector(startGameClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_startGameBtn];
}

//隐藏开始游戏按钮
-(void)hideStartGameBtn
{
    [_startGameBtn removeFromSuperview];
    _startGameBtn = nil;
}

//开始游戏点击
-(void)startGameClick
{
    [[NSNotificationCenter defaultCenter] postNotificationName:_betGameModel.EVENT_GAME_START_GAME_NOW object:nil];
}

//显示所有的动物
-(void)showAllAnimal
{
    _animalSpr = [[UIView alloc]initWithFrame:self.bounds];
    [self addSubview:_animalSpr];
    
    _animal1 = [[BetAnimalView1 alloc]initWithFrame:CGRectMake(5, 21, 75, 60)];
    [_animalSpr addSubview:_animal1];
    _animal2 = [[BetAnimalView2 alloc]initWithFrame:CGRectMake(12, 25, 70, 85)];
    [_animalSpr addSubview:_animal2];
    _animal3 = [[BetAnimalView3 alloc]initWithFrame:CGRectMake(0, 43, 90, 80)];
    [_animalSpr addSubview:_animal3];
    _animal4 = [[BetAnimalView4 alloc]initWithFrame:CGRectMake(2, 58, 85, 75)];
    [_animalSpr addSubview:_animal4];
    _animal5 = [[BetAnimalView5 alloc]initWithFrame:CGRectMake(6, 78, 75, 70)];
    [_animalSpr addSubview:_animal5];
    _animal6 = [[BetAnimalView6 alloc]initWithFrame:CGRectMake(0, 93, 90, 65)];
    [_animalSpr addSubview:_animal6];
    
    [_betGameModel.allAnimalArr addObject:_animal1];
    [_betGameModel.allAnimalArr addObject:_animal2];
    [_betGameModel.allAnimalArr addObject:_animal3];
    [_betGameModel.allAnimalArr addObject:_animal4];
    [_betGameModel.allAnimalArr addObject:_animal5];
    [_betGameModel.allAnimalArr addObject:_animal6];
}

//所有动物开始跑
-(void)startRunAllAnimal
{
    [self startAllAnimating];
}

//开始所有动物的动画
-(void)startAllAnimating
{
    for(BetAniamlBaseView * oneAniaml in _betGameModel.allAnimalArr)
    {
        [oneAniaml startAnimating];
    }
}

//重置所有动物的位置
-(void)resetAllAnimalPos
{
    _animalSpr.center = self.center;
    _animal1.frame = CGRectMake(5, 21, 75, 60);
    _animal2.frame = CGRectMake(12, 25, 70, 85);
    _animal3.frame = CGRectMake(0, 43, 90, 80);
    _animal4.frame = CGRectMake(2, 58, 85, 75);
    _animal5.frame = CGRectMake(6, 78, 75, 70);
    _animal6.frame = CGRectMake(0, 93, 90, 65);
}

//所有动物结束跑，向右移动
-(void)finishRunAllAnimal
{
    CGPoint oldAnimalSprCenter = _animalSpr.center;
    CGFloat newAnimalSprX = oldAnimalSprCenter.x + self.bounds.size.width + 100;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDidStopSelector:@selector(stopAllAnimating)];
    
    [_animalSpr setCenter:CGPointMake(newAnimalSprX, oldAnimalSprCenter.y)];
    
    [UIView commitAnimations];
}

//停止所有动物的动画
-(void)stopAllAnimating
{
    for(BetAniamlBaseView * oneAniaml in _betGameModel.allAnimalArr)
    {
        [oneAniaml stopAnimating];
    }
    //发送游戏结束，结算 事件
    [[NSNotificationCenter defaultCenter] postNotificationName:_betGameModel.EVENT_GAME_OVER_RESULT object:nil];
}

//显示所有动物的最终 位置
-(void)showAllAnimalFinallyPos
{
    if(!_blackView)
    {
        _blackView = [[UIView alloc]initWithFrame:self.bounds];
        _blackView.backgroundColor = [UIColor blackColor];
        [self addSubview:_blackView];
    }
    _blackView.alpha = 1;
    
//    _animalSpr.center = CGPointMake(self.bounds.size.width/3, self.center.y);
    _animalSpr.center = self.center;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    _blackView.alpha = 0;
    
    [UIView commitAnimations];
}

//改变某个动物的动画速度
-(void)speedChangeWithAnimal:(int)animalIndex andSpeed:(int)speedIndex
{
    switch (animalIndex)
    {
        case MAIN_ANIMAL_1:
        {
            if(speedIndex == ANIMAL_GIF_SPEED_UP) [_animal1 speedUp];
            else if(speedIndex == ANIMAL_GIF_SPEED_DOWN) [_animal1 speedDown];
            else if(speedIndex == ANIMAL_GIF_SPEED_NORMAL) [_animal1 speedNormal];
            break;
        }
        case MAIN_ANIMAL_2:
        {
            if(speedIndex == ANIMAL_GIF_SPEED_UP) [_animal2 speedUp];
            else if(speedIndex == ANIMAL_GIF_SPEED_DOWN) [_animal2 speedDown];
            else if(speedIndex == ANIMAL_GIF_SPEED_NORMAL) [_animal2 speedNormal];
            break;
        }
        case MAIN_ANIMAL_3:
        {
            if(speedIndex == ANIMAL_GIF_SPEED_UP) [_animal3 speedUp];
            else if(speedIndex == ANIMAL_GIF_SPEED_DOWN) [_animal3 speedDown];
            else if(speedIndex == ANIMAL_GIF_SPEED_NORMAL) [_animal3 speedNormal];
            break;
        }
        case MAIN_ANIMAL_4:
        {
            if(speedIndex == ANIMAL_GIF_SPEED_UP) [_animal4 speedUp];
            else if(speedIndex == ANIMAL_GIF_SPEED_DOWN) [_animal4 speedDown];
            else if(speedIndex == ANIMAL_GIF_SPEED_NORMAL) [_animal4 speedNormal];
            break;
        }
        case MAIN_ANIMAL_5:
        {
            if(speedIndex == ANIMAL_GIF_SPEED_UP) [_animal5 speedUp];
            else if(speedIndex == ANIMAL_GIF_SPEED_DOWN) [_animal5 speedDown];
            else if(speedIndex == ANIMAL_GIF_SPEED_NORMAL) [_animal5 speedNormal];
            break;
        }
        case MAIN_ANIMAL_6:
        {
            if(speedIndex == ANIMAL_GIF_SPEED_UP) [_animal6 speedUp];
            else if(speedIndex == ANIMAL_GIF_SPEED_DOWN) [_animal6 speedDown];
            else if(speedIndex == ANIMAL_GIF_SPEED_NORMAL) [_animal6 speedNormal];
            break;
        }
            
        default:
            break;
    }
}


- (void)dealloc
{
    //
    _countDownImgView = nil;
    _startGameCountDownTimer = nil;
    _betBackground = nil;
    _betFloor = nil;
    _animalSpr = nil;
    _animal1 = nil;
    _animal2 = nil;
    _animal3 = nil;
    _animal4 = nil;
    _animal5 = nil;
    _animal6 = nil;
    _startGameBtn = nil;
    _blackView = nil;
    _bigWinView = nil;
    _historyBoxView = nil;
    NSLog(@"-----BetGameMainView---dealloc");
}

@end

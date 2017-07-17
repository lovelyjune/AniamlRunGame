//
//  BetGameViewCtrl.m
//  Horse
//
//  Created by 叶颖欣 on 14/5/23.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import "BetGameViewCtrl.h"
#import "BetAniamlBaseView.h"
#import "BetDownBarView.h"
#import "BetGameModel.h"
#import "BetGameMainView.h"
#import "BetUpBarView.h"
#import "LocalModel.h"
#import "DataModel.h"

@interface BetGameViewCtrl ()
{
    BetGameModel * _betGameModel;
    LocalModel * _localModel;
    DataModel * _dataModel;
    BetUpBarView * _betUpBarView;
    BetGameMainView * _betGameMainView;
    BetDownBarView * _betDownbarView;

    NSMutableArray * _allAnimalArr;
    
    NSTimer * _updataTimer;
    CGFloat _updataInterval;
    int _frameIndex;
}
@end

@implementation BetGameViewCtrl


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //底部 下注
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downBarBet:) name:[BetGameModel getInstance].EVENT_DOWNBAR_BET_ANIMAL_1 object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downBarBet:) name:[BetGameModel getInstance].EVENT_DOWNBAR_BET_ANIMAL_2 object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downBarBet:) name:[BetGameModel getInstance].EVENT_DOWNBAR_BET_ANIMAL_3 object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downBarBet:) name:[BetGameModel getInstance].EVENT_DOWNBAR_BET_ANIMAL_4 object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downBarBet:) name:[BetGameModel getInstance].EVENT_DOWNBAR_BET_ANIMAL_5 object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downBarBet:) name:[BetGameModel getInstance].EVENT_DOWNBAR_BET_ANIMAL_6 object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downAddBet) name:[BetGameModel getInstance].EVENT_DOWNBAR_ADD_BET object:nil];    //加基本投注额
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downCutBet) name:[BetGameModel getInstance].EVENT_DOWNBAR_CUT_BET object:nil];    //减基本投注额
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downCancelBet) name:[BetGameModel getInstance].EVENT_DOWNBAR_CANCEL_BET object:nil];  //清空投注
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keepLastBet) name:[BetGameModel getInstance].EVENT_DOWNBAR_KEEP_BET object:nil];  //继续上一次投注
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gameReady) name:[BetGameModel getInstance].EVENT_GAME_REDAY object:nil];  //准备游戏
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gameStart) name:[BetGameModel getInstance].EVENT_GAME_START_GAME_NOW object:nil];  //开始游戏
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gameOverResult) name:[BetGameModel getInstance].EVENT_GAME_OVER_RESULT object:nil];  //游戏结束 结算
    
    [self initData];
    [self initView];
}

-(void)initData
{
    _betGameModel = [BetGameModel getInstance];
    _localModel = [LocalModel getInstance];
    _dataModel = [DataModel getInstance];
    _allAnimalArr = _betGameModel.allAnimalArr;
    
    [_betGameModel getLocalData];           //获取本地沙箱的需要的资料
}

-(void)initView
{
    [self addMainView];     //中间主界面
    [self addDownBar];      //下方投注栏
    [self addUpBar];        //上方状态栏
    
    [_betUpBarView setTotalMoney:_betGameModel.myTotalMoney];       //设置自己的金钱
    [_betDownbarView setBaseBetLabel:_betGameModel.baseBet];        //设置基本投注额
    
    [self gameReady];
}

//游戏准备
-(void)gameReady
{
    _frameIndex = 0;
    [_betGameMainView hideBigWinView];      //隐藏赢钱框
    [_betGameModel resetAllBet];            //重置下方的投注
    [_betGameMainView startCountDown];      //开始倒数
    [_betGameMainView showStartGameBtn];    //显示开始按钮
    [_betGameMainView resetAllAnimalPos];   //重置开始位置
    [_betGameMainView resetStartLine];      //重置起跑线
    [_betDownbarView setEnable:true];       //可以投注
    [_betDownbarView resetAllBetLabel];     //清空投注额
    [_betDownbarView resetAllAnimalButton]; //重置下方的投注按钮
    [_betGameMainView showHistoryBoxWithArr:_betGameModel.winnerHistoryArr];        //显示历史记录框
    
    for(BetAniamlBaseView * oneAnimal in _allAnimalArr)     //所有动物重新随机获取速度
    {
        [oneAnimal randomSpeed];
        [oneAnimal resetFirstImg];              //重置第一个图像
    }
}

//游戏开始
-(void)gameStart
{
    [_betGameMainView hideHistoryBox];          //隐藏历史记录框
    [_betGameMainView hideStartGameBtn];        //隐藏开始按钮
    [_betGameMainView hideCountDown];           //隐藏投注倒数
    [_betGameMainView startRunAllAnimal];       //开始所有动物的动画
    [_betGameMainView startBackgroundMove];     //开始背景移动
    [_betGameMainView startFloorMove];          //开始地板移动
    [_betUpBarView setEnable:true];             //上方栏不可用
    [_betDownbarView setEnable:false];          //下方栏不可用
    
    //开跑的时候把需要的资料保存在本地
    [_betGameModel saveLocalData];
    
    //开始移动
    _updataInterval = 1.0/10.0;
    _updataTimer = [NSTimer scheduledTimerWithTimeInterval:_updataInterval target:self selector:@selector(updataXmove) userInfo:nil repeats:YES];
}

//游戏结束 结算
-(void)gameOverResult
{
    [_betGameMainView showAllAnimalFinallyPos];     //显示所有动物的最后位置
    
    //计算胜者是谁，还有位置,第一个是胜者序号，第二个是位置
    NSArray * winnerArr = [_betGameModel getWinerArray];
    NSString * winnerName = [winnerArr objectAtIndex:0];
    NSString * winnerPosX = [winnerArr objectAtIndex:1];
    NSLog(@"胜者是======%@",winnerName);
    NSLog(@"胜者X位置=====%@",winnerPosX);
    [_betGameModel.winnerHistoryArr insertObject:winnerName atIndex:0];     //记录胜者的历史记录
    CGFloat winnerPosXfloat = [winnerPosX floatValue];
    [_betGameMainView setFloorLinePosX:winnerPosXfloat];    //设置地板的终点线在获胜动物前面
    
    int winnerNameIndex = [winnerName intValue];
    int winMoney = [_betGameModel billWinnerMoney:winnerNameIndex];        //某只动物赢了,结算金钱
    [_betGameMainView showBigWinView:winMoney];             //赢了多少钱
    [_betUpBarView updataMyTotalMoney];                     //更新总金额
    [_betGameModel saveLocalData];                          //保存记录到沙箱
    
    [self performSelector:@selector(gameReady) withObject:nil afterDelay:5.0f];       //5秒后重新准备游戏
    
    switch (winnerNameIndex)            //下栏显示谁赢了
    {
        case MAIN_ANIMAL_1:
        {
            [_betDownbarView setAniamlBtnHighLight:DOWN_BET_ANIMAL_1];
            break;
        }
        case MAIN_ANIMAL_2:
        {
            [_betDownbarView setAniamlBtnHighLight:DOWN_BET_ANIMAL_2];
            break;
        }
        case MAIN_ANIMAL_3:
        {
            [_betDownbarView setAniamlBtnHighLight:DOWN_BET_ANIMAL_3];
            break;
        }
        case MAIN_ANIMAL_4:
        {
            [_betDownbarView setAniamlBtnHighLight:DOWN_BET_ANIMAL_4];
            break;
        }
        case MAIN_ANIMAL_5:
        {
            [_betDownbarView setAniamlBtnHighLight:DOWN_BET_ANIMAL_5];
            break;
        }
        case MAIN_ANIMAL_6:
        {
            [_betDownbarView setAniamlBtnHighLight:DOWN_BET_ANIMAL_6];
            break;
        }
            
        default:
            break;
    }
    
}

//每帧更新X位置
-(void)updataXmove
{
    CGPoint newPoint;
    for(BetAniamlBaseView * oneAnimal in _allAnimalArr)
    {
        if(oneAnimal.speedState == ANIMAL_SPEED_STATE_NORMAL)       //中速
        {
            newPoint.x = oneAnimal.center.x + (arc4random()%4)+2;
            [oneAnimal speedNormal];
            if(newPoint.x >= self.view.frame.size.width-50)     //如果动物超出屏幕，就所有动物速度降下来，不要继续超屏幕
            {
                for(BetAniamlBaseView * oneAnimal in _allAnimalArr)
                {
                    oneAnimal.speedState = ANIMAL_SPEED_STATE_DOWN;
                }
            }
        }
        else if(oneAnimal.speedState == ANIMAL_SPEED_STATE_DOWN)    //低速
        {
            newPoint.x = oneAnimal.center.x - (arc4random()%4)+2;
            [oneAnimal speedDown];
        }
        else if (oneAnimal.speedState == ANIMAL_SPEED_STATE_UP)     //高速
        {
            newPoint.x = oneAnimal.center.x + (arc4random()%6)+3;
            [oneAnimal speedUp];
            if(newPoint.x >= self.view.frame.size.width-50)
            {
                for(BetAniamlBaseView * oneAnimal in _allAnimalArr)
                {
                    oneAnimal.speedState = ANIMAL_SPEED_STATE_DOWN;
                }
            }
        }

        newPoint.y = oneAnimal.center.y;
        [oneAnimal setCenter:newPoint];
    }
    
    _frameIndex ++;
    if(_frameIndex%20 == 0)     //每3秒更变一次速度
    {
        for(BetAniamlBaseView * oneAnimal in _allAnimalArr)     //所有动物重新随机获取速度
        {
            [oneAnimal randomSpeed];
        }
    }
    
    if(_frameIndex >= 100)          //10秒后赛跑结束
    {
        [self finishRun];
    }
}

//赛跑结束
-(void)finishRun
{
    [_updataTimer invalidate];
    _updataTimer = nil;
    
    [_betGameMainView finishRunAllAnimal];
    [_betGameMainView stopFloorMove];
    [_betGameMainView stopBackgroundMove];
}

//------------------------------------------回调----------------------------------------------------

//下方投注栏 的动物投注
-(void)downBarBet:(NSNotification*)noti
{
    NSString * evetName = [noti name];
    int downBetAnimalIndex;
    
    if([evetName isEqualToString:_betGameModel.EVENT_DOWNBAR_BET_ANIMAL_1])
        downBetAnimalIndex = DOWN_BET_ANIMAL_1;
    else if([evetName isEqualToString:_betGameModel.EVENT_DOWNBAR_BET_ANIMAL_2])
        downBetAnimalIndex = DOWN_BET_ANIMAL_2;
    else if([evetName isEqualToString:_betGameModel.EVENT_DOWNBAR_BET_ANIMAL_3])
        downBetAnimalIndex = DOWN_BET_ANIMAL_3;
    else if([evetName isEqualToString:_betGameModel.EVENT_DOWNBAR_BET_ANIMAL_4])
        downBetAnimalIndex = DOWN_BET_ANIMAL_4;
    else if([evetName isEqualToString:_betGameModel.EVENT_DOWNBAR_BET_ANIMAL_5])
        downBetAnimalIndex = DOWN_BET_ANIMAL_5;
    else if([evetName isEqualToString:_betGameModel.EVENT_DOWNBAR_BET_ANIMAL_6])
        downBetAnimalIndex = DOWN_BET_ANIMAL_6;
    
    if([_betGameModel betAniaml:downBetAnimalIndex] == true)
    {
        [_betUpBarView setTotalMoney:_betGameModel.myTotalMoney];   //上方界面自己的总金额
        [_betDownbarView setBetAniamlLabel:downBetAnimalIndex];     //下方栏的动物投注额
    }
    else                            //钱不够
    {
        [_betUpBarView moneyNoEnough];
    }
}


//增加基本投注额
-(void)downAddBet
{
    [_betGameModel addBaseBet];
    [_betDownbarView setBaseBetLabel:_betGameModel.baseBet];
}

//减少基本投注额
-(void)downCutBet
{
    [_betGameModel cutBaseBet];
    [_betDownbarView setBaseBetLabel:_betGameModel.baseBet];
}

//取消投注
-(void)downCancelBet
{
    [_betGameModel cancelAllBet];           //撤销所有投注
    [_betUpBarView updataMyTotalMoney];     //更新总金额
    [_betDownbarView resetAllBetLabel];     //清空下方栏的投注
}

//继续上一次押注
-(void)keepLastBet
{
    if([_betGameModel isKeepLastBetSuccess] == true)        //继续上次押注成功
    {
        [_betUpBarView setTotalMoney:_betGameModel.myTotalMoney];   //上方界面自己的总金额
        [_betDownbarView setBetAniamlLabel:DOWN_BET_ANIMAL_1];     //下方栏的动物投注额
        [_betDownbarView setBetAniamlLabel:DOWN_BET_ANIMAL_2];
        [_betDownbarView setBetAniamlLabel:DOWN_BET_ANIMAL_3];
        [_betDownbarView setBetAniamlLabel:DOWN_BET_ANIMAL_4];
        [_betDownbarView setBetAniamlLabel:DOWN_BET_ANIMAL_5];
        [_betDownbarView setBetAniamlLabel:DOWN_BET_ANIMAL_6];
    }
    else                    //继续上次押注 钱不够
    {
        [_betUpBarView moneyNoEnough];
    }
}


//------------------------------------------界面----------------------------------------------------

-(void)addUpBar
{
    _betUpBarView = [[BetUpBarView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    [self.view addSubview:_betUpBarView];
}

-(void)addMainView
{
    _betGameMainView = [[BetGameMainView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250)];
    [self.view addSubview:_betGameMainView];
}

-(void)addDownBar
{
    _betDownbarView = [[BetDownBarView alloc]initWithFrame:CGRectMake(0, 250, self.view.frame.size.width, 70)];
    [self.view addSubview:_betDownbarView];
}

-(void)addHistoryBox
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (void)dealloc
{
    //
    NSLog(@"----BetGameViewCtrl----dealloc");
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    _betUpBarView = nil;
    _betGameMainView = nil;
    _betDownbarView = nil;
    _allAnimalArr = nil;
    _updataTimer = nil;
}

@end

//
//  BetGameModel.m
//  Horse
//
//  Created by 叶颖欣 on 14/5/31.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import "BetGameModel.h"
#import "DataModel.h"
#import "LocalModel.h"
#import "BetAniamlBaseView.h"

static BetGameModel * sharedObj = nil;

@implementation BetGameModel

+(BetGameModel*)getInstance
{
    @synchronized(self)
    {
        if(sharedObj == nil)
        {
            sharedObj = [[self alloc] init];
        }
    }
    return  sharedObj;
}

- (id)init
{
    self = [super init];//往往放一些要初始化的变量.
    
    _winnerHistoryArr = [NSMutableArray array];
    _allAnimalArr = [NSMutableArray array];
    _baseBet = 100;
    _myTotalMoney = 10000;
    _hasBetAnimal1 = 0;
    _hasBetAnimal2 = 0;
    _hasBetAnimal3 = 0;
    _hasBetAnimal4 = 0;
    _hasBetAnimal5 = 0;
    _hasBetAnimal6 = 0;
    
    _animalOdds1 = 4;
    _animalOdds2 = 4;
    _animalOdds3 = 6;
    _animalOdds4 = 6;
    _animalOdds5 = 10;
    _animalOdds6 = 15;

    
    _EVENT_GAME_START_GAME_NOW = @"event_game_start_game_now";        //游戏开始
    _EVENT_UPBAR_EXIT = @"event_upbar_exit";                //退出
    _EVENT_DOWNBAR_BET_ANIMAL_1 = @"event_downbar_bet_animal_1";        //点击下方投注按钮
    _EVENT_DOWNBAR_BET_ANIMAL_2 = @"event_downbar_bet_animal_2";
    _EVENT_DOWNBAR_BET_ANIMAL_3 = @"event_downbar_bet_animal_3";
    _EVENT_DOWNBAR_BET_ANIMAL_4 = @"event_downbar_bet_animal_4";
    _EVENT_DOWNBAR_BET_ANIMAL_5 = @"event_downbar_bet_animal_5";
    _EVENT_DOWNBAR_BET_ANIMAL_6 = @"event_downbar_bet_animal_6";
    
    _EVENT_DOWNBAR_KEEP_BET = @"event_downbar_keep_bet";            //继续上次的下注
    _EVENT_DOWNBAR_CANCEL_BET = @"event_downbar_cancel_bet";        //取消下注
    
    _EVENT_DOWNBAR_ADD_BET = @"event_downbar_add_bet";      //加注
    _EVENT_DOWNBAR_CUT_BET = @"event_downbar_cut_bet";      //减注
    
    _EVENT_GAME_REDAY = @"event_game_ready";                    //游戏准备
    _EVENT_GAME_OVER_RESULT = @"event_game_over_result";        //游戏结束 结算
    
    
    _KEY_TOTAL_MONEY = @"key_totalMoney";                   //沙箱总金额的key
    _KEY_WINNER_HISTORY = @"key_winnerHistory";             //沙箱胜者历史记录的key
    
    return self;
}

//添加基本投注额
-(void)addBaseBet
{
    if(_baseBet == 1)
    {
        _baseBet = 50;
    }
    else if(_baseBet == 50)
    {
        _baseBet = 100;
    }
    else if(_baseBet == 100)
    {
        _baseBet = 500;
    }
    else if(_baseBet == 500)
    {
        _baseBet = 1000;
    }
    else if(_baseBet == 1000)
    {
        _baseBet = 1000;
    }
}

//减少基本投注额
-(void)cutBaseBet
{
    if(_baseBet == 1)
    {
        _baseBet = 1;
    }
    else if(_baseBet == 50)
    {
        _baseBet = 1;
    }
    else if(_baseBet == 100)
    {
        _baseBet = 50;
    }
    else if(_baseBet == 500)
    {
        _baseBet = 100;
    }
    else if(_baseBet == 1000)
    {
        _baseBet = 500;
    }
}

//下注处理，当钱不够就返回flase
-(Boolean)betAniaml:(int)animalIndex
{
    //钱不够就返回false
    if(_myTotalMoney < _baseBet)
    {
        return false;
    }
    else                //投注金额不可以大于自己的金钱
    {
        _myTotalMoney = _myTotalMoney - _baseBet;       //总金额减少
        switch (animalIndex)
        {
            case DOWN_BET_ANIMAL_1:
            {
                _hasBetAnimal1 = _hasBetAnimal1 + _baseBet;
                break;
            }
            case DOWN_BET_ANIMAL_2:
            {
                _hasBetAnimal2 = _hasBetAnimal2 + _baseBet;
                break;
            }
            case DOWN_BET_ANIMAL_3:
            {
                _hasBetAnimal3 = _hasBetAnimal3 + _baseBet;
                break;
            }
            case DOWN_BET_ANIMAL_4:
            {
                _hasBetAnimal4 = _hasBetAnimal4 + _baseBet;
                break;
            }
            case DOWN_BET_ANIMAL_5:
            {
                _hasBetAnimal5 = _hasBetAnimal5 + _baseBet;
                break;
            }
            case DOWN_BET_ANIMAL_6:
            {
                _hasBetAnimal6 = _hasBetAnimal6 + _baseBet;
                break;
            }
            default:
                break;
        }
        return  true;
    }
}
    
//撤销所有投注
-(void)cancelAllBet
{
    _myTotalMoney = _myTotalMoney+_hasBetAnimal1+_hasBetAnimal2+_hasBetAnimal3+_hasBetAnimal4+_hasBetAnimal5+_hasBetAnimal6;
    [self resetAllBet];
    _hasBetAnimal1 = 0;
    _hasBetAnimal2 = 0;
    _hasBetAnimal3 = 0;
    _hasBetAnimal4 = 0;
    _hasBetAnimal5 = 0;
    _hasBetAnimal6 = 0;
}

//重置所有投注
-(void)resetAllBet
{
    _hasBetAnimal1 = 0;
    _hasBetAnimal2 = 0;
    _hasBetAnimal3 = 0;
    _hasBetAnimal4 = 0;
    _hasBetAnimal5 = 0;
    _hasBetAnimal6 = 0;
}

//继续上次的押注是否成功
-(Boolean)isKeepLastBetSuccess
{
    //先把下注的取消 加回自己的总金额里
    _myTotalMoney =_myTotalMoney+_hasBetAnimal1+_hasBetAnimal2+_hasBetAnimal3+_hasBetAnimal4+_hasBetAnimal5+_hasBetAnimal6;
    
    //总金额大于 投注金额 才能继续上次 一样的押注
    if(_myTotalMoney > _lastBetAnimal1+_lastBetAnimal2+_lastBetAnimal3+_lastBetAnimal4+_lastBetAnimal5+_lastBetAnimal6)
    {
        _hasBetAnimal1 = _lastBetAnimal1;
        _hasBetAnimal2 = _lastBetAnimal2;
        _hasBetAnimal3 = _lastBetAnimal3;
        _hasBetAnimal4 = _lastBetAnimal4;
        _hasBetAnimal5 = _lastBetAnimal5;
        _hasBetAnimal6 = _lastBetAnimal6;
        _myTotalMoney = _myTotalMoney-_hasBetAnimal1-_hasBetAnimal2-_hasBetAnimal3-_hasBetAnimal4-_hasBetAnimal5-_hasBetAnimal6;
        return true;
    }
    else
    {
        return false;
    }

}

//获取 胜者的资料 ，第一个是 胜者的序号，第二个是胜者的X位置
-(NSArray*)getWinerArray
{
    CGFloat maxPosX = 0;
    int winAniamlIndex = 0;
    for (BetAniamlBaseView * oneAnimal in _allAnimalArr)
    {
        CGFloat animalPosX = oneAnimal.frame.origin.x + oneAnimal.bounds.size.width;
        if(animalPosX > maxPosX)            //如果这个动物的X位置大于之前的，就是最大值,看最后谁是最大值 谁就是胜者
        {
            maxPosX = animalPosX;
            winAniamlIndex = oneAnimal.nameIndex;
        }
    }
    
    NSString * maxPosXstr = [NSString stringWithFormat:@"%f",maxPosX];
    NSString * winAniamlStr = [NSString stringWithFormat:@"%i",winAniamlIndex];
    NSArray * winArr = [NSArray arrayWithObjects:winAniamlStr,maxPosXstr, nil];
    return winArr;
}

//结算赢的钱,返回赢了多少钱
-(int)billWinnerMoney:(int)winnerIndex
{
    _lastBetAnimal1 = _hasBetAnimal1;
    _lastBetAnimal2 = _hasBetAnimal2;
    _lastBetAnimal3 = _hasBetAnimal3;
    _lastBetAnimal4 = _hasBetAnimal4;
    _lastBetAnimal5 = _hasBetAnimal5;
    _lastBetAnimal6 = _hasBetAnimal6;
    
    if(winnerIndex == MAIN_ANIMAL_1)
    {
        _myTotalMoney = _myTotalMoney + (_hasBetAnimal1 * _animalOdds1);
        return _hasBetAnimal1 * _animalOdds1;
    }
    else if(winnerIndex == MAIN_ANIMAL_2)
    {
        _myTotalMoney = _myTotalMoney + (_hasBetAnimal2 * _animalOdds2);
        return _hasBetAnimal2 * _animalOdds2;
    }
    else if(winnerIndex == MAIN_ANIMAL_3)
    {
        _myTotalMoney = _myTotalMoney + (_hasBetAnimal3 * _animalOdds3);
        return _hasBetAnimal3 * _animalOdds3;
    }
    else if(winnerIndex == MAIN_ANIMAL_4)
    {
        _myTotalMoney = _myTotalMoney + (_hasBetAnimal4 * _animalOdds4);
        return _hasBetAnimal4 * _animalOdds4;
    }
    else if(winnerIndex == MAIN_ANIMAL_5)
    {
        _myTotalMoney = _myTotalMoney + (_hasBetAnimal5 * _animalOdds5);
        return _hasBetAnimal5 * _animalOdds5;
    }
    else if(winnerIndex == MAIN_ANIMAL_6)
    {
        _myTotalMoney = _myTotalMoney + (_hasBetAnimal6 * _animalOdds6);
        return _hasBetAnimal6 * _animalOdds6;
    }
    return 0;
}

//保存资料到沙箱
-(void)saveLocalData
{
    //把需要的资料保存在本地
    //保存总金额 和 胜者记录
    NSMutableDictionary * betGameLocalDict = [NSMutableDictionary dictionary];
    [betGameLocalDict setObject:[NSString stringWithFormat:@"%i",_myTotalMoney] forKey:_KEY_TOTAL_MONEY];
    [betGameLocalDict setObject:_winnerHistoryArr forKey:_KEY_WINNER_HISTORY];
    [[LocalModel getInstance] saveLocalDocumentDict:betGameLocalDict andPlist:[DataModel getInstance].PLIST_LOCAL_BET_GAME];
}

//获取沙箱资料
-(void)getLocalData
{
    //获取本地沙箱的需要的资料
    NSMutableDictionary * betGameLocalDict = [[LocalModel getInstance] getLocalDocumentDictWithPlistName:[DataModel getInstance].PLIST_LOCAL_BET_GAME];
    if(betGameLocalDict.count <= 0) return;
    _myTotalMoney = [[betGameLocalDict objectForKey:_KEY_TOTAL_MONEY] intValue];
    _winnerHistoryArr = [betGameLocalDict objectForKey:_KEY_WINNER_HISTORY];
}

@end

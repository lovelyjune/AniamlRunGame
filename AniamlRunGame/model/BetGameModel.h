//
//  BetGameModel.h
//  Horse
//
//  Created by 叶颖欣 on 14/5/31.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import <Foundation/Foundation.h>
#define MAIN_ANIMAL_1 1
#define MAIN_ANIMAL_2 2
#define MAIN_ANIMAL_3 3
#define MAIN_ANIMAL_4 4
#define MAIN_ANIMAL_5 5
#define MAIN_ANIMAL_6 6

#define ANIMAL_GIF_SPEED_UP 12
#define ANIMAL_GIF_SPEED_DOWN 13
#define ANIMAL_GIF_SPEED_NORMAL 11

#define DOWN_BET_ANIMAL_1 1
#define DOWN_BET_ANIMAL_2 2
#define DOWN_BET_ANIMAL_3 3
#define DOWN_BET_ANIMAL_4 4
#define DOWN_BET_ANIMAL_5 5
#define DOWN_BET_ANIMAL_6 6

#define ANIMAL_SPEED_STATE_NORMAL 1
#define ANIMAL_SPEED_STATE_UP 2
#define ANIMAL_SPEED_STATE_DOWN 3


@interface BetGameModel : NSObject

+(BetGameModel*)getInstance;

@property(nonatomic,assign) int myTotalMoney;       //自己总金钱
@property(nonatomic,assign) int baseBet;            //基本投注额，可以选择
@property(nonatomic,assign) int hasBetAnimal1;      //各个动物下注的金额
@property(nonatomic,assign) int hasBetAnimal2;
@property(nonatomic,assign) int hasBetAnimal3;
@property(nonatomic,assign) int hasBetAnimal4;
@property(nonatomic,assign) int hasBetAnimal5;
@property(nonatomic,assign) int hasBetAnimal6;

@property(nonatomic,assign) int lastBetAnimal1;      //上一次各个动物下注的金额，用于续押
@property(nonatomic,assign) int lastBetAnimal2;
@property(nonatomic,assign) int lastBetAnimal3;
@property(nonatomic,assign) int lastBetAnimal4;
@property(nonatomic,assign) int lastBetAnimal5;
@property(nonatomic,assign) int lastBetAnimal6;

@property(nonatomic,assign) int animalOdds1;        //赔率
@property(nonatomic,assign) int animalOdds2;
@property(nonatomic,assign) int animalOdds3;
@property(nonatomic,assign) int animalOdds4;
@property(nonatomic,assign) int animalOdds5;
@property(nonatomic,assign) int animalOdds6;


@property(readonly,strong) NSString * EVENT_GAME_START_GAME_NOW;
@property(readonly,strong) NSString * EVENT_GAME_REDAY;         //游戏准备
@property(readonly,strong) NSString * EVENT_GAME_OVER_RESULT;   //游戏结束结算

@property(readonly,strong) NSString * EVENT_UPBAR_EXIT;

@property(readonly,strong) NSString * EVENT_DOWNBAR_BET_ANIMAL_1;
@property(readonly,strong) NSString * EVENT_DOWNBAR_BET_ANIMAL_2;
@property(readonly,strong) NSString * EVENT_DOWNBAR_BET_ANIMAL_3;
@property(readonly,strong) NSString * EVENT_DOWNBAR_BET_ANIMAL_4;
@property(readonly,strong) NSString * EVENT_DOWNBAR_BET_ANIMAL_5;
@property(readonly,strong) NSString * EVENT_DOWNBAR_BET_ANIMAL_6;

@property(readonly,strong) NSString * EVENT_DOWNBAR_KEEP_BET;
@property(readonly,strong) NSString * EVENT_DOWNBAR_CANCEL_BET;

@property(readonly,strong) NSString * EVENT_DOWNBAR_ADD_BET;
@property(readonly,strong) NSString * EVENT_DOWNBAR_CUT_BET;

@property(readonly,strong) NSString * KEY_TOTAL_MONEY;
@property(readonly,strong) NSString * KEY_WINNER_HISTORY;

@property(strong,nonatomic) NSMutableArray * allAnimalArr;
@property(nonatomic,strong) NSMutableArray * winnerHistoryArr;      //胜者的历史记录数组



-(void)addBaseBet;

-(void)cutBaseBet;

//撤销所有投注
-(void)cancelAllBet;

//重置所有投注
-(void)resetAllBet;

//继续上次的押注是否成功
-(Boolean)isKeepLastBetSuccess;

//获取 胜者的资料 ，第一个是 胜者的序号，第二个是胜者的X位置
-(NSArray*)getWinerArray;

//下注处理，当钱不够就返回flase
-(Boolean)betAniaml:(int)animalIndex;

//结算赢的钱,返回赢了多少钱
-(int)billWinnerMoney:(int)winnerIndex;


//保存资料到沙箱
-(void)saveLocalData;

//获取沙箱资料
-(void)getLocalData;

@end

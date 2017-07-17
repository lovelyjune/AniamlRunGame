//
//  HistoryBoxView.m
//  Horse
//
//  Created by 叶颖欣 on 14/6/7.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import "HistoryBoxView.h"
#import "BetGameModel.h"

@interface HistoryBoxView()
{
    BetGameModel * _betGameModel;
    UIImageView * _backgroundImgView;
    
    NSMutableArray * _iconImgArr;
    int _iconIndex;
    CGFloat _iconWidth;
    CGFloat _interval;
    CGFloat _iconY;
    CGFloat _iconX;
}
@end

@implementation HistoryBoxView

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
    _iconImgArr = [NSMutableArray array];
    _iconIndex = 0;
    _interval = 3;
    _iconWidth = 27.5;
    _iconY = 5;
}

-(void)initView
{
    [self addBackground];
}

-(void)addBackground
{
    _backgroundImgView = [[UIImageView alloc]initWithFrame:self.bounds];
    [_backgroundImgView setImage:[UIImage imageNamed:@"history_background.png"]];
    [self addSubview:_backgroundImgView];
}

//添加一个胜者的历史头像
-(void)addWinnerHistoryArray:(NSMutableArray*)historyArr
{
    [self clearIconArr];        //先清空之前的icon
    [self clearFullArr:historyArr];
    
    _iconIndex = 0;
    _iconY = 5;
    for(NSString * animalStr in historyArr)
    {
        int animalIndex = [animalStr intValue];
        NSString * imgName = [NSString stringWithFormat:@"history_icon_%i.png",animalIndex];
        UIImageView * animalImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imgName]];

        if(_iconIndex == 10)
        {
            _iconY = 37.5;
            _iconIndex = 0;
        }
        _iconX = (_iconIndex * (_interval+_iconWidth)) + _interval;     //（序号*间隔+宽度））+间隔
        _iconIndex ++;

        animalImgView.frame = CGRectMake(_iconX, _iconY, _iconWidth, _iconWidth);
        [_iconImgArr addObject:animalImgView];
        [self addSubview:animalImgView];
    }
}

//清空所有的icon
-(void)clearIconArr
{
    for (UIImageView * iconImgView in _iconImgArr)
    {
        [iconImgView removeFromSuperview];
    }
}

//清除多于20个时的数组
-(void)clearFullArr:(NSMutableArray*)historyArr
{
    if(historyArr.count > 20)
    {
        for(int i = 20; i < historyArr.count; i++)
        {
            [historyArr removeObjectAtIndex:i];
        }
    }
}


- (void)dealloc
{
    _backgroundImgView = nil;
    _iconImgArr = nil;
    NSLog(@"----HistoryBoxView---delalloc");
}

@end

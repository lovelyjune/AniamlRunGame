//
//  BetUpBarView.m
//  Horse
//
//  Created by 叶颖欣 on 14/6/1.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import "BetUpBarView.h"
#import "BetGameModel.h"

@interface BetUpBarView()
{
    BetGameModel * _betGameModel;
    UIView * _maskView;
    UIView * _backgroundView;
    UIImageView * _moneyBackgroundImgView;
    UILabel * _totalMoneyLabel;
    UIButton * _exitBtn;
}
@end

@implementation BetUpBarView

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
    [self addBackgroundView];
    [self addMoneyBackground];
    [self addExitBtn];
}

-(void)addBackgroundView
{
    _backgroundView = [[UIView alloc]initWithFrame:self.bounds];
    _backgroundView.backgroundColor = [UIColor blackColor];
    _backgroundView.alpha = 0.4;
    [self addSubview:_backgroundView];
}

-(void)addMoneyBackground
{
    _moneyBackgroundImgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 0, 186.5, 28.5)];
    [_moneyBackgroundImgView setImage:[UIImage imageNamed:@"bet_money_background.png"]];
    [self addSubview:_moneyBackgroundImgView];
}

-(void)addExitBtn
{
    _exitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _exitBtn.frame = CGRectMake(self.bounds.size.width-85, 0, 73, 27.5);
    [_exitBtn setImage:[UIImage imageNamed:@"bet_exitBtn.png"] forState:UIControlStateNormal];
    [_exitBtn addTarget:self action:@selector(exitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_exitBtn];
}

-(void)exitBtnClick
{

}


-(void)setTotalMoney:(int)money
{
    if(!_totalMoneyLabel)
    {
        _totalMoneyLabel = [[UILabel alloc]init];
        _totalMoneyLabel.frame = CGRectMake(45, 5, 120, 20);
        _totalMoneyLabel.font = [UIFont fontWithName:@"HiraKakuProN-W6" size:14];
        _totalMoneyLabel.textColor = [UIColor yellowColor];
        _totalMoneyLabel.textAlignment = NSTextAlignmentLeft;
        _totalMoneyLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:_totalMoneyLabel];
    }

    [_totalMoneyLabel setText:[NSString stringWithFormat:@"%i",money]];
}

//金钱不够
-(void)moneyNoEnough
{
    _totalMoneyLabel.alpha = 0;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationRepeatCount:4];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    _totalMoneyLabel.alpha = 1;
    
    [UIView commitAnimations];
}

//更新自己现在的总金额
-(void)updataMyTotalMoney
{
    [_totalMoneyLabel setText:[NSString stringWithFormat:@"%i",_betGameModel.myTotalMoney]];
}


//设置是否可用
-(void)setEnable:(Boolean)enable
{
    if(enable == YES)       //可用
    {
        if(_maskView)
        {
            [_maskView removeFromSuperview];
            _maskView = nil;
        }
    }
    else                    //不可用
    {
        if(!_maskView)
        {
            _maskView = [[UIView alloc]initWithFrame:self.bounds];
            _maskView.backgroundColor = [UIColor blackColor];
            _maskView.alpha = 0.5;
            [self addSubview:_maskView];
        }
        
    }
}

- (void)dealloc
{
    //
    _maskView = nil;
    _backgroundView = nil;
    _moneyBackgroundImgView = nil;
    _totalMoneyLabel = nil;
    _exitBtn = nil;
    NSLog(@"-----BetUpBarView---dealloc");
}

@end

//
//  BetDownBarView.m
//  Horse
//
//  Created by 叶颖欣 on 14/5/31.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import "BetDownBarView.h"
#import "BetGameModel.h"

@interface BetDownBarView()
{
    BetGameModel * _betGameModel;
    
    UIView * _maskView;
    
    UIButton * _animalBtn1;
    UIButton * _animalBtn2;
    UIButton * _animalBtn3;
    UIButton * _animalBtn4;
    UIButton * _animalBtn5;
    UIButton * _animalBtn6;
    
    UILabel * _animalBetLabel1;
    UILabel * _animalBetLabel2;
    UILabel * _animalBetLabel3;
    UILabel * _animalBetLabel4;
    UILabel * _animalBetLabel5;
    UILabel * _animalBetLabel6;
    UILabel * _baseBetLabel;        //基本投注额
    
    UIButton * _cancelBetBtn;
    UIButton * _keepBetBtn;
    UIButton * _addBetBtn;
    UIButton * _cutBetBtn;
    
    UIImageView * _downBarImgView;
}
@end

@implementation BetDownBarView

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
    [self addDownBarImgView];
    [self addDownAnimalBtn];
    [self addDownBetLabel];
    [self addCancelBetBtn];
    [self addKeepBetBtn];
    [self addBetAddBtn];
    [self addBetCutBtn];
}

-(void)addDownBarImgView
{
    _downBarImgView = [[UIImageView alloc]initWithFrame:self.bounds];
    _downBarImgView.image = [UIImage imageNamed:@"bet_downbar@2x.png"];
    [self addSubview:_downBarImgView];
}


-(void)addDownAnimalBtn
{
    _animalBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    _animalBtn1.frame = CGRectMake(410, 24, 45, 45);
    [_animalBtn1 setImage:[UIImage imageNamed:@"bet_down_animalBtn_normal_1.png"] forState:UIControlStateNormal];
    [_animalBtn1 setImage:[UIImage imageNamed:@"bet_down_animalBtn_highlight_1.png"] forState:UIControlStateHighlighted];
    [_animalBtn1 addTarget:self action:@selector(clickAnimal:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_animalBtn1];
    
    _animalBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    _animalBtn2.frame = CGRectMake(350, 24, 45, 45);
    [_animalBtn2 setImage:[UIImage imageNamed:@"bet_down_animalBtn_normal_2.png"] forState:UIControlStateNormal];
    [_animalBtn2 setImage:[UIImage imageNamed:@"bet_down_animalBtn_highlight_2.png"] forState:UIControlStateHighlighted];
    [_animalBtn2 addTarget:self action:@selector(clickAnimal:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_animalBtn2];
    
    _animalBtn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    _animalBtn3.frame = CGRectMake(291, 24, 45, 45);
    [_animalBtn3 setImage:[UIImage imageNamed:@"bet_down_animalBtn_normal_3.png"] forState:UIControlStateNormal];
    [_animalBtn3 setImage:[UIImage imageNamed:@"bet_down_animalBtn_highlight_3.png"] forState:UIControlStateHighlighted];
    [_animalBtn3 addTarget:self action:@selector(clickAnimal:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_animalBtn3];
    
    _animalBtn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    _animalBtn4.frame = CGRectMake(232, 24, 45, 45);
    [_animalBtn4 setImage:[UIImage imageNamed:@"bet_down_animalBtn_normal_4.png"] forState:UIControlStateNormal];
    [_animalBtn4 setImage:[UIImage imageNamed:@"bet_down_animalBtn_highlight_4.png"] forState:UIControlStateHighlighted];
    [_animalBtn4 addTarget:self action:@selector(clickAnimal:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_animalBtn4];
    
    _animalBtn5 = [UIButton buttonWithType:UIButtonTypeCustom];
    _animalBtn5.frame = CGRectMake(173, 24, 45, 45);
    [_animalBtn5 setImage:[UIImage imageNamed:@"bet_down_animalBtn_normal_5.png"] forState:UIControlStateNormal];
    [_animalBtn5 setImage:[UIImage imageNamed:@"bet_down_animalBtn_highlight_5.png"] forState:UIControlStateHighlighted];
    [_animalBtn5 addTarget:self action:@selector(clickAnimal:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_animalBtn5];
    
    _animalBtn6 = [UIButton buttonWithType:UIButtonTypeCustom];
    _animalBtn6.frame = CGRectMake(115, 24, 45, 45);
    [_animalBtn6 setImage:[UIImage imageNamed:@"bet_down_animalBtn_normal_6.png"] forState:UIControlStateNormal];
    [_animalBtn6 setImage:[UIImage imageNamed:@"bet_down_animalBtn_highlight_6.png"] forState:UIControlStateHighlighted];
    [_animalBtn6 addTarget:self action:@selector(clickAnimal:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_animalBtn6];
}

//添加下方投注label
-(void)addDownBetLabel
{
    if(!_animalBetLabel1)
    {
        _animalBetLabel1 = [self setupBetLabel:_animalBetLabel1 andFrame:CGRectMake(410, 4, 45, 20)];
        [self addSubview:_animalBetLabel1];
    }
    if(!_animalBetLabel2)
    {
        _animalBetLabel2 = [self setupBetLabel:_animalBetLabel1 andFrame:CGRectMake(350, 4, 45, 20)];
        [self addSubview:_animalBetLabel2];
    }
    if(!_animalBetLabel3)
    {
        _animalBetLabel3 = [self setupBetLabel:_animalBetLabel1 andFrame:CGRectMake(291, 4, 45, 20)];
        [self addSubview:_animalBetLabel3];
    }
    if(!_animalBetLabel4)
    {
        _animalBetLabel4 = [self setupBetLabel:_animalBetLabel1 andFrame:CGRectMake(232, 4, 45, 20)];
        [self addSubview:_animalBetLabel4];
    }
    if(!_animalBetLabel5)
    {
        _animalBetLabel5 = [self setupBetLabel:_animalBetLabel1 andFrame:CGRectMake(173, 4, 45, 20)];
        [self addSubview:_animalBetLabel5];
    }
    if(!_animalBetLabel6)
    {
        _animalBetLabel6 = [self setupBetLabel:_animalBetLabel1 andFrame:CGRectMake(115, 4, 45, 20)];
        [self addSubview:_animalBetLabel6];
    }
}

//设置下注label
-(UILabel*)setupBetLabel:(UILabel*)betLabel andFrame:(CGRect)frame
{
    betLabel = [[UILabel alloc]init];
    betLabel.frame = frame;
    betLabel.font = [UIFont fontWithName:@"HiraKakuProN-W6" size:10];
    betLabel.textColor = [UIColor whiteColor];
    betLabel.textAlignment = NSTextAlignmentCenter;
    betLabel.adjustsFontSizeToFitWidth = YES;
    return betLabel;
}

//设置下方投注按钮高亮，当赢的时候就高亮
-(void)setAniamlBtnHighLight:(int)btnIndex
{
    switch (btnIndex)
    {
        case DOWN_BET_ANIMAL_1:
        {
            _animalBtn1.highlighted = true;
            break;
        }
        case DOWN_BET_ANIMAL_2:
        {
            _animalBtn2.highlighted = true;
            break;
        }
        case DOWN_BET_ANIMAL_3:
        {
            _animalBtn3.highlighted = true;
            break;
        }
        case DOWN_BET_ANIMAL_4:
        {
            _animalBtn4.highlighted = true;
            break;
        }
        case DOWN_BET_ANIMAL_5:
        {
            _animalBtn5.highlighted = true;
            break;
        }
        case DOWN_BET_ANIMAL_6:
        {
            _animalBtn6.highlighted = true;
            break;
        }
            
        default:
            break;
    }
}

//复位所有下方的投注按钮
-(void)resetAllAnimalButton
{
    _animalBtn1.highlighted = false;
    _animalBtn2.highlighted = false;
    _animalBtn3.highlighted = false;
    _animalBtn4.highlighted = false;
    _animalBtn5.highlighted = false;
    _animalBtn6.highlighted = false;
}

-(void)clickAnimal:(UIButton*)clickAnimalBtn
{
    if(clickAnimalBtn == _animalBtn1)
    {
        //发送事件
        [[NSNotificationCenter defaultCenter] postNotificationName:_betGameModel.EVENT_DOWNBAR_BET_ANIMAL_1 object:nil];
    }
    else if (clickAnimalBtn == _animalBtn2)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:_betGameModel.EVENT_DOWNBAR_BET_ANIMAL_2 object:nil];
    }
    else if (clickAnimalBtn == _animalBtn3)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:_betGameModel.EVENT_DOWNBAR_BET_ANIMAL_3 object:nil];
    }
    else if (clickAnimalBtn == _animalBtn4)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:_betGameModel.EVENT_DOWNBAR_BET_ANIMAL_4 object:nil];
    }
    else if (clickAnimalBtn == _animalBtn5)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:_betGameModel.EVENT_DOWNBAR_BET_ANIMAL_5 object:nil];
    }
    else if (clickAnimalBtn == _animalBtn6)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:_betGameModel.EVENT_DOWNBAR_BET_ANIMAL_6 object:nil];
    }
}


-(void)addCancelBetBtn
{
    _cancelBetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _cancelBetBtn.frame = CGRectMake(10, 5, 83, 34);
    [_cancelBetBtn setImage:[UIImage imageNamed:@"bet_cancelBetBtn.png"] forState:UIControlStateNormal];
    [_cancelBetBtn addTarget:self action:@selector(cancelBetClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_cancelBetBtn];
}

//取消投注
-(void)cancelBetClick
{
    [[NSNotificationCenter defaultCenter] postNotificationName:_betGameModel.EVENT_DOWNBAR_CANCEL_BET object:nil];
}


-(void)addKeepBetBtn
{
    _keepBetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _keepBetBtn.frame = CGRectMake(10, 35, 83, 34);
    [_keepBetBtn setImage:[UIImage imageNamed:@"bet_keepBetBtn.png"] forState:UIControlStateNormal];
    [_keepBetBtn addTarget:self action:@selector(keepBetClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_keepBetBtn];
}

//继续上次的投注
-(void)keepBetClick
{
    [[NSNotificationCenter defaultCenter] postNotificationName:_betGameModel.EVENT_DOWNBAR_KEEP_BET object:nil];
}


-(void)addBetAddBtn
{
    _addBetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _addBetBtn.frame = CGRectMake(510, 30, 41.5, 33);
    [_addBetBtn setImage:[UIImage imageNamed:@"bet_addBtn.png"] forState:UIControlStateNormal];
    [_addBetBtn addTarget:self action:@selector(betAddClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_addBetBtn];
}

//增加基本投注额
-(void)betAddClick
{
    //发送事件
    [[NSNotificationCenter defaultCenter] postNotificationName:_betGameModel.EVENT_DOWNBAR_ADD_BET object:nil];
}


-(void)addBetCutBtn
{
    _cutBetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _cutBetBtn.frame = CGRectMake(470, 30, 41.5, 33);
    [_cutBetBtn setImage:[UIImage imageNamed:@"bet_cutBtn.png"] forState:UIControlStateNormal];
    [_cutBetBtn addTarget:self action:@selector(betCutClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_cutBetBtn];
}

//减少基本投注额
-(void)betCutClick
{
    [[NSNotificationCenter defaultCenter] postNotificationName:_betGameModel.EVENT_DOWNBAR_CUT_BET object:nil];
}

//设置投注额的label
-(void)setBetAniamlLabel:(int)animalIndex
{
    switch (animalIndex)
    {
        case DOWN_BET_ANIMAL_1:
        {
            [_animalBetLabel1 setText:[NSString stringWithFormat:@"%i",_betGameModel.hasBetAnimal1]];
            break;
        }
        case DOWN_BET_ANIMAL_2:
        {
            [_animalBetLabel2 setText:[NSString stringWithFormat:@"%i",_betGameModel.hasBetAnimal2]];
            break;
        }
        case DOWN_BET_ANIMAL_3:
        {
            [_animalBetLabel3 setText:[NSString stringWithFormat:@"%i",_betGameModel.hasBetAnimal3]];
            break;
        }
        case DOWN_BET_ANIMAL_4:
        {
            [_animalBetLabel4 setText:[NSString stringWithFormat:@"%i",_betGameModel.hasBetAnimal4]];
            break;
        }
        case DOWN_BET_ANIMAL_5:
        {
            [_animalBetLabel5 setText:[NSString stringWithFormat:@"%i",_betGameModel.hasBetAnimal5]];
            break;
        }
        case DOWN_BET_ANIMAL_6:
        {
            [_animalBetLabel6 setText:[NSString stringWithFormat:@"%i",_betGameModel.hasBetAnimal6]];
            break;
        }
            
        default:
            break;
    }
}

//复位所有投注label，清0
-(void)resetAllBetLabel
{
    [_animalBetLabel1 setText:@"0"];
    [_animalBetLabel2 setText:@"0"];
    [_animalBetLabel3 setText:@"0"];
    [_animalBetLabel4 setText:@"0"];
    [_animalBetLabel5 setText:@"0"];
    [_animalBetLabel6 setText:@"0"];
}

//总投注额
-(void)setBaseBetLabel:(int)money
{
    if(!_baseBetLabel)
    {
        _baseBetLabel = [[UILabel alloc]init];
        _baseBetLabel.frame = CGRectMake(500, 4, 45, 20);
        _baseBetLabel.font = [UIFont fontWithName:@"HiraKakuProN-W6" size:10];
        _baseBetLabel.textColor = [UIColor whiteColor];
        _baseBetLabel.textAlignment = NSTextAlignmentCenter;
        _baseBetLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:_baseBetLabel];
    }
    [_baseBetLabel setText:[NSString stringWithFormat:@"%i",money]];
}

//设置下方投注是否可用
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
    _animalBtn1 = nil;
    _animalBtn2 = nil;
    _animalBtn3 = nil;
    _animalBtn4 = nil;
    _animalBtn5 = nil;
    _animalBtn6 = nil;
    _animalBetLabel1 = nil;
    _animalBetLabel2 = nil;
    _animalBetLabel3 = nil;
    _animalBetLabel4 = nil;
    _animalBetLabel5 = nil;
    _animalBetLabel6 = nil;
    _baseBetLabel = nil;
    _cancelBetBtn = nil;
    _keepBetBtn = nil;
    _addBetBtn = nil;
    _cutBetBtn = nil;
    _downBarImgView = nil;
    NSLog(@"-----BetDownBarView---dealloc");
}


@end

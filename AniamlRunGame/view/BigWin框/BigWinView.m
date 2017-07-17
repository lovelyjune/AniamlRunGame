//
//  BigWinView.m
//  Horse
//
//  Created by 叶颖欣 on 14/6/3.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import "BigWinView.h"

@interface BigWinView()
{
    UIImageView * _bigWinImgView;
    UILabel * _winMoneyLabel;
}
@end

@implementation BigWinView

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
    
}

-(void)initView
{
    
}

//显示赢了多少钱
-(void)showBigWin:(int)money
{
    if(!_bigWinImgView)
    {
        _bigWinImgView = [[UIImageView alloc]initWithFrame:self.bounds];
        [_bigWinImgView setImage:[UIImage imageNamed:@"bet_bigwin_background.png"]];
    }
    [self addSubview:_bigWinImgView];
    
    
    if(_winMoneyLabel)
    {
        [_winMoneyLabel removeFromSuperview];
        _winMoneyLabel = nil;
    }
    _winMoneyLabel = [[UILabel alloc]init];
    _winMoneyLabel.frame = CGRectMake(15, 40, 120, 30);
    _winMoneyLabel.font = [UIFont fontWithName:@"HiraKakuProN-W6" size:30];
    _winMoneyLabel.textColor = [UIColor yellowColor];
    _winMoneyLabel.textAlignment = NSTextAlignmentCenter;
    _winMoneyLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:_winMoneyLabel];
    [_winMoneyLabel setText:[NSString stringWithFormat:@"%i",money]];
}

//隐藏赢钱框
-(void)hideBigWin
{
    if(_bigWinImgView)
    {
        [_bigWinImgView removeFromSuperview];
    }
    
    if(_winMoneyLabel)
    {
        [_winMoneyLabel removeFromSuperview];
    }
}

- (void)dealloc
{
    _bigWinImgView = nil;
    _winMoneyLabel = nil;
    NSLog(@"----BigWinView---delalloc");
}


@end

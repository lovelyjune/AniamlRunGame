//
//  BetFloor.m
//  Horse
//
//  Created by 叶颖欣 on 14/5/26.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import "BetFloor.h"

@interface BetFloor()
{
    UIImageView * _posNum1;
    UIImageView * _posNum2;
    UIImageView * _posNum3;
    UIImageView * _posNum4;
    UIImageView * _posNum5;
    UIImageView * _posNum6;
    UIImageView * _lineImgView;
}
@end


@implementation BetFloor

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
    self.animationImageArr  = [NSArray arrayWithObjects:
                               [UIImage imageNamed:@"floor1-1.png"],
                               [UIImage imageNamed:@"floor1-2.png"],
                               [UIImage imageNamed:@"floor1-3.png"],
                               [UIImage imageNamed:@"floor1-4.png"],
                               [UIImage imageNamed:@"floor1-5.png"],
                               [UIImage imageNamed:@"floor1-6.png"],
                               [UIImage imageNamed:@"floor1-7.png"],
                               [UIImage imageNamed:@"floor1-8.png"],
                               [UIImage imageNamed:@"floor1-9.png"],
                               [UIImage imageNamed:@"floor1-10.png"],
                               [UIImage imageNamed:@"floor1-11.png"],
                               [UIImage imageNamed:@"floor1-12.png"],
                               [UIImage imageNamed:@"floor1-13.png"],
                               [UIImage imageNamed:@"floor1-14.png"],
                               [UIImage imageNamed:@"floor1-15.png"],
                               [UIImage imageNamed:@"floor1-16.png"],
                               [UIImage imageNamed:@"floor1-17.png"],
                               [UIImage imageNamed:@"floor1-18.png"],
                               [UIImage imageNamed:@"floor1-19.png"],
                               [UIImage imageNamed:@"floor1-20.png"],
                               [UIImage imageNamed:@"floor1-21.png"],
                               [UIImage imageNamed:@"floor1-22.png"],
                               [UIImage imageNamed:@"floor1-23.png"],
                               [UIImage imageNamed:@"floor1-24.png"],
                               [UIImage imageNamed:@"floor1-25.png"],
                               [UIImage imageNamed:@"floor1-26.png"],
                               [UIImage imageNamed:@"floor1-27.png"],
                               [UIImage imageNamed:@"floor1-28.png"],
                               [UIImage imageNamed:@"floor1-29.png"],
                               [UIImage imageNamed:@"floor1-30.png"],
                               [UIImage imageNamed:@"floor1-31.png"],
                               [UIImage imageNamed:@"floor1-32.png"],
                               [UIImage imageNamed:@"floor1-33.png"],
                               [UIImage imageNamed:@"floor1-34.png"],
                               [UIImage imageNamed:@"floor1-35.png"],
                               [UIImage imageNamed:@"floor1-36.png"],
                               [UIImage imageNamed:@"floor1-37.png"],
                               [UIImage imageNamed:@"floor1-38.png"],
                               [UIImage imageNamed:@"floor1-39.png"],
                               [UIImage imageNamed:@"floor1-40.png"],
                               [UIImage imageNamed:@"floor1-41.png"],
                               [UIImage imageNamed:@"floor1-42.png"],nil];
    
    [self initImgView];
    
    [self addPosNum];
    [self addStartLine];
}

//添加跑道号码
-(void)addPosNum
{
    _posNum1 = [[UIImageView alloc]initWithFrame:CGRectMake(120, 47, 19.5, 7.5)];
    [_posNum1 setImage:[UIImage imageNamed:@"floor_pos_1.png"]];
    [self addSubview:_posNum1];
    
    _posNum2 = [[UIImageView alloc]initWithFrame:CGRectMake(120, 75, 22, 16)];
    [_posNum2 setImage:[UIImage imageNamed:@"floor_pos_2.png"]];
    [self addSubview:_posNum2];
    
    _posNum3 = [[UIImageView alloc]initWithFrame:CGRectMake(120, 108, 21, 12.5)];
    [_posNum3 setImage:[UIImage imageNamed:@"floor_pos_3.png"]];
    [self addSubview:_posNum3];
    
    _posNum4 = [[UIImageView alloc]initWithFrame:CGRectMake(120, 135, 21, 16)];
    [_posNum4 setImage:[UIImage imageNamed:@"floor_pos_4.png"]];
    [self addSubview:_posNum4];
    
    _posNum5 = [[UIImageView alloc]initWithFrame:CGRectMake(120, 165, 21.5, 14)];
    [_posNum5 setImage:[UIImage imageNamed:@"floor_pos_5.png"]];
    [self addSubview:_posNum5];
    
    _posNum6 = [[UIImageView alloc]initWithFrame:CGRectMake(120, 194, 22, 17.5)];
    [_posNum6 setImage:[UIImage imageNamed:@"floor_pos_6.png"]];
    [self addSubview:_posNum6];
}

-(void)addStartLine
{
    _lineImgView = [[UIImageView alloc]initWithFrame:CGRectMake(85, 38, 7.5, 176.5)];
    [_lineImgView setImage:[UIImage imageNamed:@"floor_line.png"]];
    [self addSubview:_lineImgView];
}

//设置终点线的位置
-(void)setLinePosX:(CGFloat)posX
{
    _lineImgView.frame = CGRectMake(posX, 38,7.5, 176.5);
}

//重置起跑线
-(void)resetStartLine
{
    _lineImgView.frame = CGRectMake(85, 38, 7.5, 176.5);
}

-(void)startMove
{
    [super startAnimating];
    
    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDelay:0.5];
    [UIView setAnimationDuration:0.5];
    //    [UIView setAnimationDelegate:delegate];
    //    [UIView setAnimationDidStopSelector:finishSel];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    [_lineImgView setCenter:CGPointMake(_lineImgView.center.x-140, _lineImgView.center.y)];
    [_posNum1 setCenter:CGPointMake(_posNum1.center.x-140, _posNum1.center.y)];
    [_posNum2 setCenter:CGPointMake(_posNum2.center.x-140, _posNum2.center.y)];
    [_posNum3 setCenter:CGPointMake(_posNum3.center.x-140, _posNum3.center.y)];
    [_posNum4 setCenter:CGPointMake(_posNum4.center.x-140, _posNum4.center.y)];
    [_posNum5 setCenter:CGPointMake(_posNum5.center.x-140, _posNum5.center.y)];
    [_posNum6 setCenter:CGPointMake(_posNum6.center.x-140, _posNum6.center.y)];
    
    [UIView commitAnimations];
}

-(void)stopMove
{
    _lineImgView.center = CGPointMake(self.bounds.size.width+10, _lineImgView.center.y);
    
    [UIView beginAnimations:nil context:nil];
    //    [UIView setAnimationDelay:0.0];
    [UIView setAnimationDuration:0.2];
    //    [UIView setAnimationDelegate:delegate];
    //    [UIView setAnimationDidStopSelector:finishSel];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    [_lineImgView setCenter:CGPointMake(_lineImgView.center.x-70, _lineImgView.center.y)];
    
    [UIView commitAnimations];
    
    [self performSelector:@selector(stopAnimating) withObject:nil afterDelay:0.5f];     //停止地板移动
}


- (void)dealloc
{
    NSLog(@"-----BetFloor---dealloc");
    _posNum1 = nil;
    _posNum2 = nil;
    _posNum3 = nil;
    _posNum4 = nil;
    _posNum5 = nil;
    _posNum6 = nil;
    _lineImgView = nil;
    [super destrory];
    
}

@end

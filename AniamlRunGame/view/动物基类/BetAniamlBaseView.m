//
//  BetAniamlBaseView.m
//  Horse
//
//  Created by 叶颖欣 on 14/5/27.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import "BetAniamlBaseView.h"

@interface BetAniamlBaseView()
{
    UIImageView * _gifImgView;
    
    NSTimer * _animationTimer;
    CGFloat _animationDuration;
    NSArray * _animationImageArr;
    int _animationPicIndex;
}
@end

@implementation BetAniamlBaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
    }
    return self;
}

-(void)startAnimating
{
    if(_animationTimer)
    {
        [_animationTimer invalidate];
        _animationTimer = nil;
    }
    _animationTimer = [NSTimer scheduledTimerWithTimeInterval:_animationDuration target:self selector:@selector(animationUpdata) userInfo:nil repeats:NO];
}

-(void)stopAnimating
{
    if(_animationTimer)
    {
        [_animationTimer invalidate];
        _animationTimer = nil;
    }
}

//动画更新
-(void)animationUpdata
{
    if(_animationTimer)
    {
        [_animationTimer invalidate];
        _animationTimer = nil;
    }
    
    _animationPicIndex ++;
    if(_animationPicIndex == [_animationImageArr count])
    {
        _animationPicIndex = 0;
    }
    
    UIImage * nowImg = [_animationImageArr objectAtIndex:_animationPicIndex];
    [_gifImgView setImage:nowImg];
    
    _animationTimer = [NSTimer scheduledTimerWithTimeInterval:_animationDuration target:self selector:@selector(animationUpdata) userInfo:nil repeats:NO];
}

//随机更新速度
-(void)randomSpeed
{
    _speed = (arc4random()%80)+1;       //1--80
    _luck = (arc4random()%80)+1;        //1--80
    int finalRandom = _speed + _odds + _luck;
    if(finalRandom < 79)        //低速
    {
        self.speedState = ANIMAL_SPEED_STATE_DOWN;
    }
    else if(finalRandom >= 79 && finalRandom < 132) //中速
    {
        self.speedState = ANIMAL_SPEED_STATE_NORMAL;
    }
    else if(finalRandom >= 132)     //高速
    {
        self.speedState = ANIMAL_SPEED_STATE_UP;
    }
}

-(void)speedNormal
{
    if(_animationTimer)
    {
        [_animationTimer invalidate];
        _animationTimer = nil;
    }
    
    _animationDuration = 1.0/18.0;
    
    _animationTimer = [NSTimer scheduledTimerWithTimeInterval:_animationDuration target:self selector:@selector(animationUpdata) userInfo:nil repeats:NO];
}

-(void)speedUp
{
    if(_animationTimer)
    {
        [_animationTimer invalidate];
        _animationTimer = nil;
    }
    
    _animationDuration = 1.0/25.0;
    
    _animationTimer = [NSTimer scheduledTimerWithTimeInterval:_animationDuration target:self selector:@selector(animationUpdata) userInfo:nil repeats:NO];
}

-(void)speedDown
{
    if(_animationTimer)
    {
        [_animationTimer invalidate];
        _animationTimer = nil;
    }
    
    _animationDuration = 1.0/12.0;
    
    _animationTimer = [NSTimer scheduledTimerWithTimeInterval:_animationDuration target:self selector:@selector(animationUpdata) userInfo:nil repeats:NO];
}

//重置第一个图像
-(void)resetFirstImg
{
    _animationPicIndex = 0;
    UIImage * nowImg = [_animationImageArr objectAtIndex:_animationPicIndex];
    [_gifImgView setImage:nowImg];
}

-(void)initAnimal1
{
    _animationImageArr = [NSArray arrayWithObjects:
                          [UIImage imageNamed:@"animal1-1.png"],
                          [UIImage imageNamed:@"animal1-2.png"],
                          [UIImage imageNamed:@"animal1-3.png"],
                          [UIImage imageNamed:@"animal1-4.png"],
                          [UIImage imageNamed:@"animal1-5.png"],
                          [UIImage imageNamed:@"animal1-6.png"],
                          [UIImage imageNamed:@"animal1-7.png"],
                          [UIImage imageNamed:@"animal1-8.png"],
                          [UIImage imageNamed:@"animal1-9.png"],nil];
    
    [self initImgView];
}

-(void)initAnimal2
{
    _animationImageArr = [NSArray arrayWithObjects:
                        [UIImage imageNamed:@"animal2-1.png"],
                        [UIImage imageNamed:@"animal2-2.png"],
                        [UIImage imageNamed:@"animal2-3.png"],
                        [UIImage imageNamed:@"animal2-4.png"],
                        [UIImage imageNamed:@"animal2-5.png"],
                        [UIImage imageNamed:@"animal2-6.png"],
                        [UIImage imageNamed:@"animal2-7.png"],
                        [UIImage imageNamed:@"animal2-8.png"],nil];
    [self initImgView];
}

-(void)initAnimal3
{
    _animationImageArr = [NSArray arrayWithObjects:
                        [UIImage imageNamed:@"animal3-1.png"],
                        [UIImage imageNamed:@"animal3-2.png"],
                        [UIImage imageNamed:@"animal3-3.png"],
                        [UIImage imageNamed:@"animal3-4.png"],
                        [UIImage imageNamed:@"animal3-5.png"],
                        [UIImage imageNamed:@"animal3-6.png"],
                        [UIImage imageNamed:@"animal3-7.png"],
                        [UIImage imageNamed:@"animal3-8.png"],nil];
    [self initImgView];
}

-(void)initAnimal4
{
    _animationImageArr = [NSArray arrayWithObjects:
                        [UIImage imageNamed:@"animal4-1.png"],
                        [UIImage imageNamed:@"animal4-2.png"],
                        [UIImage imageNamed:@"animal4-3.png"],
                        [UIImage imageNamed:@"animal4-4.png"],
                        [UIImage imageNamed:@"animal4-5.png"],
                        [UIImage imageNamed:@"animal4-6.png"],
                        [UIImage imageNamed:@"animal4-7.png"],nil];
    [self initImgView];
}

-(void)initAnimal5
{
    _animationImageArr = [NSArray arrayWithObjects:
                        [UIImage imageNamed:@"animal5-1.png"],
                        [UIImage imageNamed:@"animal5-2.png"],
                        [UIImage imageNamed:@"animal5-3.png"],
                        [UIImage imageNamed:@"animal5-4.png"],
                        [UIImage imageNamed:@"animal5-5.png"],
                        [UIImage imageNamed:@"animal5-6.png"],
                        [UIImage imageNamed:@"animal5-7.png"],nil];
    [self initImgView];
}

-(void)initAnimal6
{
    _animationImageArr = [NSArray arrayWithObjects:
                        [UIImage imageNamed:@"animal6-1.png"],
                        [UIImage imageNamed:@"animal6-2.png"],
                        [UIImage imageNamed:@"animal6-3.png"],
                        [UIImage imageNamed:@"animal6-4.png"],
                        [UIImage imageNamed:@"animal6-5.png"],
                        [UIImage imageNamed:@"animal6-6.png"],
                        [UIImage imageNamed:@"animal6-7.png"],
                        [UIImage imageNamed:@"animal6-8.png"],
                        [UIImage imageNamed:@"animal6-9.png"],
                        [UIImage imageNamed:@"animal6-10.png"],nil];
    [self initImgView];
}

-(void)initImgView
{
    _animationPicIndex = 0;
    _animationDuration = 1.0/20.0;
    
    _gifImgView = [[UIImageView alloc]initWithFrame:self.bounds];
    _gifImgView.center = self.center;
    UIImage * nowImg = [_animationImageArr objectAtIndex:_animationPicIndex];
    [_gifImgView setImage:nowImg];
    [self addSubview:_gifImgView];
}


//-(void)initAnimal1
//{
//    NSArray * runArr = [NSArray arrayWithObjects:
//                        [UIImage imageNamed:@"animal1-1.png"],
//                        [UIImage imageNamed:@"animal1-2.png"],
//                        [UIImage imageNamed:@"animal1-3.png"],
//                        [UIImage imageNamed:@"animal1-4.png"],
//                        [UIImage imageNamed:@"animal1-5.png"],
//                        [UIImage imageNamed:@"animal1-6.png"],
//                        [UIImage imageNamed:@"animal1-7.png"],
//                        [UIImage imageNamed:@"animal1-8.png"],
//                        [UIImage imageNamed:@"animal1-9.png"],nil];
//    
//    
//    _gifImgView = [[UIImageView alloc]initWithFrame:self.bounds];
//    
//    _gifImgView.center = self.center;
//    _gifImgView.animationImages = runArr;
//    _gifImgView.animationDuration = 0.5;
//    _gifImgView.animationRepeatCount = 0;
//    [_gifImgView setImage:[UIImage imageNamed:@"animal1-1.png"]];
////    [_gifImgView startAnimating];
//    [self addSubview:_gifImgView];
//    
//    _myLayer = _gifImgView.layer;
//    [self.layer addSublayer:_myLayer];
//}
//
//-(void)pauseLayer:(CALayer*)layer
//{
//    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
//    layer.speed = 0.0;
//    layer.timeOffset = pausedTime;
//}
//
//-(void)resumeLayer:(CALayer*)layer
//{
//    CFTimeInterval pauseTime = [layer timeOffset];
//    layer.speed = 1.0;
//    _myLayer.timeOffset = 0.0;
//    _myLayer.beginTime = 0.0;
//    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil]-pauseTime;
//    layer.beginTime = timeSincePause;
//}
//
//
//-(void)startAnimating
//{
//    [_gifImgView startAnimating];
//}
//
//
//-(void)resumeAnimating
//{
//    [self resumeLayer:_myLayer];
//}
//
//-(void)pauseAnimating
//{
//    [self pauseLayer:_myLayer];
//}


- (void)dealloc
{
    //
    _gifImgView = nil;
    _animationTimer = nil;
    _animationImageArr = nil;
    _animationDuration = 0;
    _animationPicIndex = 0;
    NSLog(@"-----BetAniamlBaseView---dealloc");
}

@end

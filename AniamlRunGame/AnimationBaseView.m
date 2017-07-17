//
//  AnimationBaseView.m
//  Horse
//
//  Created by 叶颖欣 on 14/6/1.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import "AnimationBaseView.h"

@interface AnimationBaseView()
{

}
@end


@implementation AnimationBaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //
    }
    return self;
}


-(void)initImgView
{
    _animationPicIndex = 0;
    _animationDuration = 1.0/15.0;
    
    _gifImgView = [[UIImageView alloc]initWithFrame:self.bounds];
    _gifImgView.center = self.center;
    UIImage * nowImg = [_animationImageArr objectAtIndex:_animationPicIndex];
    [_gifImgView setImage:nowImg];
    [self addSubview:_gifImgView];
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

-(void)destrory
{
    _animationImageArr = nil;
    _gifImgView = nil;
    _animationTimer = nil;
}

- (void)dealloc
{
    NSLog(@"---AnimationBaseView----dealloc");
    [self destrory];
}
@end

//
//  GuideView.m
//  Horse
//
//  Created by 叶颖欣 on 14/6/8.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import "GuideView.h"

@interface GuideView()
{
    UIImageView * _guideImgView;
}
@end

@implementation GuideView

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
    _guideImgView = [[UIImageView alloc]initWithFrame:self.bounds];
    [_guideImgView setImage:[UIImage imageNamed:@"guide_background.png"]];
    [self addSubview:_guideImgView];
}

@end

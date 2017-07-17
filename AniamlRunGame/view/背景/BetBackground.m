//
//  BetBackground.m
//  Horse
//
//  Created by 叶颖欣 on 14/5/26.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import "BetBackground.h"

@interface BetBackground()
{
    UIImageView * _gifImgView;

}
@end

@implementation BetBackground

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
    self.animationImageArr = [NSArray arrayWithObjects:
                        [UIImage imageNamed:@"background1-1.png"],
                        [UIImage imageNamed:@"background1-2.png"],
                        [UIImage imageNamed:@"background1-3.png"],
                        [UIImage imageNamed:@"background1-4.png"],
                        [UIImage imageNamed:@"background1-5.png"],
                        [UIImage imageNamed:@"background1-6.png"],
                        [UIImage imageNamed:@"background1-7.png"],
                        [UIImage imageNamed:@"background1-8.png"],
                        [UIImage imageNamed:@"background1-9.png"],
                        [UIImage imageNamed:@"background1-10.png"],
                        [UIImage imageNamed:@"background1-11.png"],
                        [UIImage imageNamed:@"background1-12.png"],
                        [UIImage imageNamed:@"background1-13.png"],
                        [UIImage imageNamed:@"background1-14.png"],
                        [UIImage imageNamed:@"background1-15.png"],
                        [UIImage imageNamed:@"background1-16.png"],
                        [UIImage imageNamed:@"background1-17.png"],
                        [UIImage imageNamed:@"background1-18.png"],
                        [UIImage imageNamed:@"background1-19.png"],
                        [UIImage imageNamed:@"background1-20.png"],
                        [UIImage imageNamed:@"background1-21.png"],
                        [UIImage imageNamed:@"background1-22.png"],
                        [UIImage imageNamed:@"background1-23.png"],
                        [UIImage imageNamed:@"background1-24.png"],
                        [UIImage imageNamed:@"background1-25.png"],
                        [UIImage imageNamed:@"background1-26.png"],
                        [UIImage imageNamed:@"background1-27.png"],
                        [UIImage imageNamed:@"background1-28.png"],
                        [UIImage imageNamed:@"background1-29.png"],
                        [UIImage imageNamed:@"background1-30.png"],
                        [UIImage imageNamed:@"background1-31.png"],
                        [UIImage imageNamed:@"background1-32.png"],
                        [UIImage imageNamed:@"background1-33.png"],
                        [UIImage imageNamed:@"background1-34.png"],
                        [UIImage imageNamed:@"background1-35.png"],
                        [UIImage imageNamed:@"background1-36.png"],
                        [UIImage imageNamed:@"background1-37.png"],
                        [UIImage imageNamed:@"background1-38.png"],
                        [UIImage imageNamed:@"background1-39.png"],
                        [UIImage imageNamed:@"background1-40.png"],
                        [UIImage imageNamed:@"background1-41.png"],
                        [UIImage imageNamed:@"background1-42.png"],
                        [UIImage imageNamed:@"background1-43.png"],
                        [UIImage imageNamed:@"background1-44.png"],
                        [UIImage imageNamed:@"background1-45.png"],
                        [UIImage imageNamed:@"background1-46.png"],
                        [UIImage imageNamed:@"background1-47.png"],
                        [UIImage imageNamed:@"background1-48.png"],
                        [UIImage imageNamed:@"background1-49.png"],
                        [UIImage imageNamed:@"background1-50.png"],
                        [UIImage imageNamed:@"background1-51.png"],nil];
    
    [self initImgView];
}


- (void)dealloc
{
    NSLog(@"-----BetBackground---dealloc");
    [super destrory];
}


@end

//
//  BetAnimalView2.m
//  Horse
//
//  Created by 叶颖欣 on 14/5/26.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import "BetAnimalView2.h"

@interface BetAnimalView2()
{
    UIImageView * _gifImgView;
}
@end

@implementation BetAnimalView2

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
    self.nameIndex = MAIN_ANIMAL_2;
    self.odds = 25;
}

-(void)initView
{
    [self initAnimal2];
}


- (void)dealloc
{
    //
    NSLog(@"-----BetAnimalView2---dealloc");
}

@end

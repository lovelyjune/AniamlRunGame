//
//  BetAnimalView4.m
//  Horse
//
//  Created by 叶颖欣 on 14/5/26.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import "BetAnimalView4.h"

@interface BetAnimalView4()
{
    UIImageView * _gifImgView;
}
@end

@implementation BetAnimalView4

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
    self.nameIndex = MAIN_ANIMAL_4;
    self.odds = 17;
}

-(void)initView
{
    [self initAnimal4];
}


- (void)dealloc
{
    //
    NSLog(@"-----BetAnimalView4---dealloc");
}

@end

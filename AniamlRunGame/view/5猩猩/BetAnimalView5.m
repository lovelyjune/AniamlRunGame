//
//  BetAnimalView5.m
//  Horse
//
//  Created by 叶颖欣 on 14/5/26.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import "BetAnimalView5.h"

@interface BetAnimalView5()
{
    UIImageView * _gifImgView;
}
@end

@implementation BetAnimalView5

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
    self.nameIndex = MAIN_ANIMAL_5;
    self.odds = 10;
}

-(void)initView
{
    [self initAnimal5];
}


- (void)dealloc
{
    //
    NSLog(@"-----BetAnimalView5---dealloc");
}

@end

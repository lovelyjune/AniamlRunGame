//
//  BetAnimalView3.m
//  Horse
//
//  Created by 叶颖欣 on 14/5/26.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import "BetAnimalView3.h"

@interface BetAnimalView3()
{
    UIImageView * _gifImgView;
}
@end

@implementation BetAnimalView3

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
    self.nameIndex = MAIN_ANIMAL_3;
    self.odds = 17;
}

-(void)initView
{
    [self initAnimal3];
}

- (void)dealloc
{
    //
    NSLog(@"-----BetAnimalView3---dealloc");
}

@end

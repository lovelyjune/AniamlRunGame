//
//  BetAnimalView1.m
//  Horse
//
//  Created by 叶颖欣 on 14/5/26.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import "BetAnimalView1.h"

@interface BetAnimalView1()
{

}
@end

@implementation BetAnimalView1

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
    self.nameIndex = MAIN_ANIMAL_1;
    self.odds = 25;
}

-(void)initView
{
    [self initAnimal1];
}

- (void)dealloc
{
    //
    NSLog(@"-----BetAnimalView1---dealloc");
}

@end

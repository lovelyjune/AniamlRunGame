//
//  BetAnimalView6.m
//  Horse
//
//  Created by 叶颖欣 on 14/5/26.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import "BetAnimalView6.h"

@interface BetAnimalView6()
{
    UIImageView * _gifImgView;

}
@end

@implementation BetAnimalView6

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
    self.nameIndex = MAIN_ANIMAL_6;
    self.odds = 7;
}

-(void)initView
{
    [self initAnimal6];
}


- (void)dealloc
{
    //
    NSLog(@"-----BetAnimalView6---dealloc");
}

@end

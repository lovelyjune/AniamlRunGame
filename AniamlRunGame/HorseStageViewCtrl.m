//
//  HorseStageViewCtrl.m
//  Horse
//
//  Created by 叶颖欣 on 14/5/23.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import "HorseStageViewCtrl.h"
#import "BetGameViewCtrl.h"
#import "GuideView.h"

@interface HorseStageViewCtrl ()
{
    BetGameViewCtrl * _betGameViewCtl;
    GuideView * _guideView;
}
@end

@implementation HorseStageViewCtrl

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _guideView = [[GuideView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_guideView];
    
    [self performSelector:@selector(showGameView) withObject:nil afterDelay:0.1f];
}


-(void)showGameView
{
    [_guideView removeFromSuperview];
    _guideView = nil;
    
    _betGameViewCtl = [[BetGameViewCtrl alloc]init];
    _betGameViewCtl.view.frame = self.view.bounds;
    [self.view addSubview:_betGameViewCtl.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    //
}

@end

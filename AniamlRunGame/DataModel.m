//
//  DataModel.m
//  Horse
//
//  Created by 叶颖欣 on 14/5/23.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import "DataModel.h"

static DataModel * sharedObj = nil;

@implementation DataModel

+(DataModel*)getInstance
{
    @synchronized(self)
    {
        if(sharedObj == nil)
        {
            sharedObj = [[self alloc] init];
        }
    }
    return  sharedObj;
}

- (id)init
{
    self = [super init];//往往放一些要初始化的变量.
    
    _PLIST_LOCAL_BET_GAME = @"plist_local_bet_game";
    
    return self;
}


@end

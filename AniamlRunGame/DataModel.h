//
//  DataModel.h
//  Horse
//
//  Created by 叶颖欣 on 14/5/23.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject


@property(readonly,strong) NSString * PLIST_LOCAL_BET_GAME;

+(DataModel*)getInstance;


@end

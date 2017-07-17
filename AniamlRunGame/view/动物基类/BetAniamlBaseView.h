//
//  BetAniamlBaseView.h
//  Horse
//
//  Created by 叶颖欣 on 14/5/27.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ANIMAL_SPEED_STATE_NORMAL 1
#define ANIMAL_SPEED_STATE_UP 2
#define ANIMAL_SPEED_STATE_DOWN 3

@interface BetAniamlBaseView : UIView

@property(nonatomic,assign) int nameIndex;
@property(nonatomic,assign) int speed;
@property(nonatomic,assign) int odds;
@property(nonatomic,assign) int luck;
@property(nonatomic,assign) int speedState;

//随机更新速度
-(void)randomSpeed;

-(void)speedNormal;

-(void)speedUp;

-(void)speedDown;

-(void)startAnimating;

-(void)stopAnimating;

-(void)initAnimal1;
-(void)initAnimal2;
-(void)initAnimal3;
-(void)initAnimal4;
-(void)initAnimal5;
-(void)initAnimal6;

//重置第一个图像
-(void)resetFirstImg;

@end

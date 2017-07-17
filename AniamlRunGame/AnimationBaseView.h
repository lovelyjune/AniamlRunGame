//
//  AnimationBaseView.h
//  Horse
//
//  Created by 叶颖欣 on 14/6/1.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationBaseView : UIView

@property(nonatomic,strong) NSArray * animationImageArr;
@property(nonatomic,strong) UIImageView * gifImgView;
@property(nonatomic,strong) NSTimer * animationTimer;
@property(nonatomic,assign) CGFloat animationDuration;
@property(nonatomic,assign) int animationPicIndex;


-(void)initImgView;

-(void)startAnimating;

-(void)stopAnimating;

-(void)destrory;

@end

//
//  LocalModel.h
//  Horse
//
//  Created by 叶颖欣 on 14/5/23.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface LocalModel : NSObject

+(LocalModel*)getInstance;

-(void)saveTempLocalImage:(UIImage*)newImg andImgName:(NSString*)imgName;

-(UIImage*)getLocalTempImageWithPicName:(NSString*)picName;

-(NSMutableDictionary*)getLocalTempDictWithPlistName:(NSString*)plistName;

-(void)saveLocalTempDict:(NSDictionary*)newDict andPlist:(NSString*)plistName;


-(void)saveLocalDocumentArray:(NSArray*)newArr andPlist:(NSString*)plistName;

-(NSMutableArray*)getLocalDocumentArrWithPlistName:(NSString*)plistName;


-(void)saveLocalDocumentDict:(NSDictionary*)newDict andPlist:(NSString*)plistName;

-(NSMutableDictionary*)getLocalDocumentDictWithPlistName:(NSString*)plistName;


-(void)delLocalDocumentDictWithKey:(NSString*)delKey andPlist:(NSString*)plistName;

-(void)delLocalTempAllFile;

-(Boolean)isHaveDocumentPlistName:(NSString*)plistName;

@end

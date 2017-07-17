//
//  LocalModel.m
//  Horse
//
//  Created by 叶颖欣 on 14/5/23.
//  Copyright © 2016年 叶颖欣. All rights reserved.
//

#import "LocalModel.h"

static LocalModel * sharedObj = nil;

@implementation LocalModel

+(LocalModel*)getInstance
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


#pragma mark 保存图片文件到本地 imgName是文件名
//图片和其他数据 保存的路径不一样，图片保存在temp文件夹中，每次退出app就删除图片。其他数据不删除
-(void)saveTempLocalImage:(UIImage*)newImg andImgName:(NSString*)imgName
{
    NSString *filename = [[LocalModel getInstance] getTempPath:imgName];
    [UIImagePNGRepresentation(newImg) writeToFile:filename atomically:YES];
}

#pragma mark 获取本地图片
-(UIImage*)getLocalTempImageWithPicName:(NSString*)picName
{
    NSString *filename = [[LocalModel getInstance] getTempPath:picName];
    UIImage * image = [[UIImage alloc]init];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:filename])
    {
        image = [UIImage imageWithContentsOfFile:filename];
    }
    return image;
}

#pragma mark 获取temp文件夹路径
-(NSString *)getTempPath:(NSString*)plistName
{
    NSString * tempDir = NSTemporaryDirectory();
    return [tempDir stringByAppendingPathComponent:plistName];
}

#pragma mark 获取本地temp字典
-(NSMutableDictionary*)getLocalTempDictWithPlistName:(NSString*)plistName
{
    NSString *filename = [[LocalModel getInstance] getTempPath:plistName];
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:filename])
    {
        dict = [NSMutableDictionary dictionaryWithContentsOfFile:filename];
    }
    return dict;
}

#pragma mark 保存到临时文件夹temp中
-(void)saveLocalTempDict:(NSDictionary*)newDict andPlist:(NSString*)plistName
{
    NSString *filename = [[LocalModel getInstance] getTempPath:plistName];
    [newDict writeToFile:filename atomically:YES];
}

#pragma mark 删除temp文件夹里面的所有文件
-(void)delLocalTempAllFile
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString * tempFolder = NSTemporaryDirectory();
    NSArray *fileList ;
    fileList =[fileManager contentsOfDirectoryAtPath:tempFolder error:NULL];
    
    for (NSString *file in fileList)                //遍历temp文件夹里面所有的图片文件，删除
    {
        NSString *path =[tempFolder stringByAppendingPathComponent:file];
        [fileManager removeItemAtPath:path error:nil];
    }
}


#pragma mark 覆盖新的数组到本地
-(void)saveLocalDocumentArray:(NSArray*)newArr andPlist:(NSString*)plistName
{
    NSString *filename = [[LocalModel getInstance] getLocalDocumentFilePath:plistName];
    [newArr writeToFile:filename atomically:YES];
}


#pragma mark 获取本地数组
-(NSMutableArray*)getLocalDocumentArrWithPlistName:(NSString*)plistName
{
    NSString *filename = [[LocalModel getInstance] getLocalDocumentFilePath:plistName];
    NSMutableArray * array = [NSMutableArray array];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:filename])
    {
        array = [NSMutableArray arrayWithContentsOfFile:filename];
    }
    if(array == nil) array = [NSMutableArray array];
    return array;
}

#pragma mark 覆盖新的字典到本地
-(void)saveLocalDocumentDict:(NSDictionary*)newDict andPlist:(NSString*)plistName
{
    NSString *filename = [[LocalModel getInstance] getLocalDocumentFilePath:plistName];
    [newDict writeToFile:filename atomically:YES];
}

#pragma mark 获取本地字典
-(NSMutableDictionary*)getLocalDocumentDictWithPlistName:(NSString*)plistName
{
    NSString *filename = [[LocalModel getInstance] getLocalDocumentFilePath:plistName];
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:filename])
    {
        dict = [NSMutableDictionary dictionaryWithContentsOfFile:filename];
    }
    if(dict == nil) dict = [NSMutableDictionary dictionary];
    return dict;
}

#pragma mark 是否本地已经有plist文件
-(Boolean)isHaveDocumentPlistName:(NSString*)plistName
{
    NSString *filename = [[LocalModel getInstance] getLocalDocumentFilePath:plistName];
    if([[NSFileManager defaultManager] fileExistsAtPath:filename])
    {
        return true;
    }
    return false;
}


#pragma mark 删除本地字典 字典一个key，多用于删除一个人的所有聊天记录
-(void)delLocalDocumentDictWithKey:(NSString*)delKey andPlist:(NSString*)plistName
{
    //读取沙箱的总聊天记录文件
    NSMutableDictionary * historyDict = [[LocalModel getInstance]getLocalDocumentDictWithPlistName:plistName];
    for(NSString * key in historyDict)                                             //获取主文件(字典类型 key 为 useid)
    {
        if([key isEqualToString:delKey])                  //找到聊天记录里面的useid 和 删除useid 一样的聊天记录
        {
            [historyDict removeObjectForKey:key];
            break;
        }
    }
    [[LocalModel getInstance] saveLocalDocumentDict:historyDict andPlist:plistName];            //覆盖总聊天记录
}


#pragma mark 私有方法,获取本地document地址
-(NSString * )getLocalDocumentFilePath:(NSString*)plistName
{
    NSArray * pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [[pathArray objectAtIndex:0] stringByAppendingPathComponent:plistName];
}


@end

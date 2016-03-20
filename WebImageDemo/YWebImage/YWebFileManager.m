//
//  YWebFileManager.m
//  WebImageDemo
//
//  Created by YueWen on 16/3/20.
//  Copyright © 2016年 YueWen. All rights reserved.
//

#import "YWebFileManager.h"

static YWebFileManager * yWebFileManager = nil;
static NSString * defaultFolderName = @"YWebImageFile";


@interface YWebFileManager ()

@property (nonatomic, strong)NSFileManager * fileManager; //文件管理者的单例
@property (nonatomic, copy) NSString * documentPath;      //程序的沙盒路径

@end



@implementation YWebFileManager

+(instancetype)shareInstanceType
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //初始化单例对象
        yWebFileManager = [[YWebFileManager alloc]init];
        
    });
    
    return yWebFileManager;
}


//文件夹是否在沙盒存在
- (BOOL)folderIsExist:(NSString *)folderPath
{
    return [self.fileManager fileExistsAtPath:folderPath];
}



//沙盒目录中默认存储文件夹中是否存在这个文件
- (BOOL)fileIsExist:(NSString *)url
{
    //拼接路径
    NSString * path = [self.documentPath stringByAppendingFormat:@"/%@/%@",defaultFolderName,url];
    
    return [self.fileManager fileExistsAtPath:path];
}




//根据保存的路径获取图片对象
-(UIImage *)imageWithURL:(NSString *)url
{
    //不存在图片返回nil
    if (![self fileIsExist:url])
    {
        return nil;
    }
    
    //拼接路径
    NSString * path = [self.documentPath stringByAppendingFormat:@"/%@/%@",defaultFolderName,url];
    
    //存在图片返回图片
    return [UIImage  imageWithContentsOfFile:path];
}



#pragma mark - Getter

-(NSFileManager *)fileManager
{
    return [NSFileManager defaultManager];
}

-(NSString *)documentPath
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true) firstObject];
}

@end

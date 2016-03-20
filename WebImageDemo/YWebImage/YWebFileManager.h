//
//  YWebFileManager.h
//  WebImageDemo
//
//  Created by YueWen on 16/3/20.
//  Copyright © 2016年 YueWen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/**
 *  负责处理本地文件(沙盒存储)的管理者
 */
NS_CLASS_AVAILABLE_IOS(7_0) @interface YWebFileManager : NSObject



/**
 *  默认存储文件夹的大小,单位为MB
 */
//@property (nonatomic, copy, readonly)NSString * fileSize;



/**
 *  单例方法
 *
 *  @return YWebFileManager单例对象
 */
+ (instancetype)shareInstanceType NS_AVAILABLE_IOS(7_0);



/**
 *  在沙盒中目录中默认存储的文件夹中是否存在该文件
 *
 *  @param url 图片存在的url
 *
 *  @return true表示存在，false表示不存在
 */
- (BOOL)fileIsExist:(NSString *)url NS_AVAILABLE_IOS(7_0);



/**
 *  根据url获取存在本地的图片
 *
 *  @param url 下载的url
 *
 *  @return 存在的返回UIImage,不存在返回nil
 */
- (UIImage *)imageWithURL:(NSString *)url NS_AVAILABLE_IOS(7_0);


@end

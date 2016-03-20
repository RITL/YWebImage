//
//  YWebDataHandle.h
//  WebImageDemo
//
//  Created by YueWen on 16/3/20.
//  Copyright © 2016年 YueWen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_AVAILABLE_IOS(7_0) @interface YWebDataHandle : NSObject



/**
 *  将路径或者url转成base64处理的字符串
 *
 *  @param path 需要处理的字符串
 *
 *  @return 处理完毕的字符串
 */
+ (NSString *)imageNameForBase64Handle:(NSString *)path;


@end

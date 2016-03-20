//
//  YWebDataHandle.m
//  WebImageDemo
//
//  Created by YueWen on 16/3/20.
//  Copyright © 2016年 YueWen. All rights reserved.
//

#import "YWebDataHandle.h"

@implementation YWebDataHandle

+(NSString *)imageNameForBase64Handle:(NSString *)path
{
    NSData * data = [path dataUsingEncoding:NSUTF8StringEncoding];
    NSString * imageNameBase = [data base64EncodedStringWithOptions:0];
    return [imageNameBase substringToIndex:imageNameBase.length - 2];
}

@end

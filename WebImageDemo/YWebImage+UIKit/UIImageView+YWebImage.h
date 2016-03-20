//
//  UIImageView+YWebImage.h
//  WebImageDemo
//
//  Created by YueWen on 16/3/20.
//  Copyright © 2016年 YueWen. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  下载过程中的回调
 *
 *  @param didFinish      本次下载的文件大小
 *  @param didFinishTotal 至此一共下载文件的大小
 *  @param Total          一共需要下载文件的大小
 */
typedef void(^DownManagerProgressBlock)(CGFloat didFinish,CGFloat didFinishTotal,CGFloat Total);


@interface UIImageView (YWebImage)


//根据url设置图片
- (void)yw_setImageWithUrl:(NSString *)url;

- (void)yw_setImageWithUrl:(NSString *)url
        withProgressHandle:(DownManagerProgressBlock)progresshandle;


//根据url设置图片，并支持默认占位图
- (void)yw_setImageWithUrl:(NSString *)url
          placeHolderImage:(UIImage *)placeHodlerImage;

- (void)yw_setImageWithUrl:(NSString *)url
          placeHolderImage:(UIImage *)placeHodlerImage
        withProgressHandle:(DownManagerProgressBlock)progresshandle;



@end

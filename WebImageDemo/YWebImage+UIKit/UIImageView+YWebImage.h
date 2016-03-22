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



/**
 *  根据url设置网络图片
 *
 *  @param url 网络图片的url
 */
- (void)yw_setImageWithUrl:(NSString *)url;




/**
 *  根据url设置网络图片
 *
 *  @param url            网络图片的url
 *  @param progresshandle 下载过程的回调
 */
- (void)yw_setImageWithUrl:(NSString *)url
        withProgressHandle:(DownManagerProgressBlock)progresshandle;




/**
 *  根据url设置网络图片
 *
 *  @param url              网络图片的url
 *  @param placeHodlerImage 下载未完成时的占位图
 */
- (void)yw_setImageWithUrl:(NSString *)url
          placeHolderImage:(UIImage *)placeHodlerImage;





/**
 *  根据url设置网络图片
 *
 *  @param url              网络图片的url
 *  @param placeHodlerImage 下载未完成时的占位图
 *  @param progresshandle   下载过程的回调
 */
- (void)yw_setImageWithUrl:(NSString *)url
          placeHolderImage:(UIImage *)placeHodlerImage
        withProgressHandle:(DownManagerProgressBlock)progresshandle;



@end

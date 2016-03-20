//
//  YWebDownManager.m
//  WebImageDemo
//
//  Created by YueWen on 16/3/20.
//  Copyright © 2016年 YueWen. All rights reserved.
//

#import "YWebDownManager.h"
#import "YWebDataHandle.h"

@interface YWebDownManager ()<NSURLSessionDownloadDelegate>

@property (nonatomic, copy)NSString * imagePath;        //记录图片url的字符串path
@property (nonatomic, copy)NSURL * imageURL;            //请求图片的url
@property (nonatomic, copy)NSString * imageName;        //转型后的图片名称
@property (nonatomic, copy)NSString * documentPath;     //沙盒路径

@property (nonatomic, copy)DownManagerFinishBlock finishBlockHandle;        //下载完成后的回调
@property (nonatomic, copy)DownManagerProgressBlock progressBlockHandle;    //下载过程中的回调

@end

@implementation YWebDownManager


#pragma mark - 设置回调的方法
-(void)downManagerFinishBlockHandle:(DownManagerFinishBlock)downManagerFinishBlockHandle
{
    self.finishBlockHandle = downManagerFinishBlockHandle;
}

-(void)downManagerProgressBlockHandle:(DownManagerProgressBlock)downManagerProgressBlockHandle
{
    self.progressBlockHandle = downManagerProgressBlockHandle;
}


#pragma mark - 开始下载图片的方法
-(void)startDownImagePath:(NSString *)imagePath
{
    NSLog(@"开始下载图片啦,路径为:%@",imagePath);
    
    //赋值
    _imagePath = imagePath;
    
    //创建url对象
    NSURL * downURL = [[NSURL alloc]initWithString:_imagePath];

    //开始根据URL请求图片
    [self startDownImageURL:downURL];
    
}

- (void)startDownImageURL:(NSURL *)imageURL
{
    //开始赋值
    _imageURL = imageURL;
    
    //创建请求对象
    NSURLRequest * request = [NSURLRequest requestWithURL:_imageURL];
    
    //创建网络请求对象
    NSURLSession * session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:nil];
    
    //获取下载对象
    NSURLSessionDownloadTask * downLoadTask = [session downloadTaskWithRequest:request];
    
    //开始请求
    [downLoadTask resume];
}



#pragma mark - NSURLSessionDownload Delegate

//下载完成
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location
{
    //路径字符串
    NSString * path = [NSString stringWithFormat:@"%@/YWebImageFile/%@",self.documentPath,self.imageName];
    
    //获取创建下载到的路径url
    NSURL * url = [NSURL fileURLWithPath:path];
    
    //获取文件管理者
    NSFileManager * fileManager = [NSFileManager defaultManager];
    
    //存到文件
    [fileManager moveItemAtURL:location toURL:url error:nil];
    
    
    //主线程回调
    dispatch_async(dispatch_get_main_queue(), ^{
        
        //执行回调,传出路径
        if (self.finishBlockHandle) {
            self.finishBlockHandle(path);
        }
    });
}


- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    //主线程进行回调
    dispatch_async(dispatch_get_main_queue(), ^{
        
        //执行过程的回调
        if (self.progressBlockHandle) {
            self.progressBlockHandle(bytesWritten,totalBytesWritten,totalBytesExpectedToWrite);
        }
    });
}

#pragma mark - Document Path
- (NSString *)documentPath
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true) firstObject];
}

#pragma mark - Image Name Base64
-(NSString *)imageName
{
    return [YWebDataHandle imageNameForBase64Handle:_imageURL.absoluteString];
}

@end

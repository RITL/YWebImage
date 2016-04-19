//
//  ViewController.m
//  WebImageDemo
//
//  Created by YueWen on 16/3/20.
//  Copyright © 2016年 YueWen. All rights reserved.
//

#import "ViewController.h"

#import "UIImageView+YWebImage.h"


#import "YWebFileManager.h"


static NSString * testImageURL1 = @"http://www.bz55.com/uploads/allimg/150417/139-15041G02614.jpg";
static NSString * testImageURL2 = @"http://a.hiphotos.baidu.com/zhidao/pic/item/faedab64034f78f0b7111ba67b310a55b3191c48.jpg";
static NSString * testImageURL3 = @"http://c.hiphotos.baidu.com/zhidao/pic/item/730e0cf3d7ca7bcb48f80cb9bc096b63f724a8a1.jpg";



@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *inputView;

@property (weak, nonatomic) IBOutlet UILabel *lblFileSize;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


//开始加载图片
- (IBAction)startLoadImage:(id)sender
{
    //默认初始化label为本地
    self.label.text = @"本地图片！";
    
    NSString * imageURL = self.inputView.text;
    
    //可看进度的方法   
    [self.imageView yw_setImageWithUrl:imageURL withProgressHandle:^(CGFloat didFinish, CGFloat didFinishTotal, CGFloat Total) {
        
        //更改Label
        NSString * progress = [NSString stringWithFormat:@"%.1f%%",(didFinishTotal * 1.0 / Total) * 100.0];
        self.label.text = progress;
        
    }];
}


//开始计算文件大小
- (IBAction)lookFileSize:(id)sender
{
    NSString * fileSize = [NSString stringWithFormat:@"缓存大小为:%@MB",[[YWebFileManager shareInstance] fileSize]];
    
    self.lblFileSize.text = fileSize;
}


//删除所有的文件
- (IBAction)deleteAllFile:(id)sender
{
    [[YWebFileManager shareInstance] deleteAllCAchesProgress:^(NSString *fileName) {
        
        //更改lable的显示
        self.label.text = [NSString stringWithFormat:@"正在删除%@",fileName];
        
    } Complete:^{
        
        //更改lable的显示
        self.label.text = @"删除完毕!";
        
    }];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

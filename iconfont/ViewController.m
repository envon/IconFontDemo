//
//  ViewController.m
//  iconfont
//
//  Created by chenyingwang on 18/05/16.
//  Copyright © 2016年 chenyingwang. All rights reserved.
//

/*
 
 http://www.iconfont.cn/
 http://johnwong.github.io/mobile/2015/04/03/using-icon-font-in-ios.html
 
 优点：
 减小体积，字体文件比图片要小
 图标保真缩放，解决2x/3x乃至将来的nx图问题
 方便更改颜色大小，图片复用

 缺点：
 只适用于纯色icon
 使用unicode字符难以理解
 需要维护字体库
 
 使用步骤：
 1、把制作好的字体.ttf文件添加到项目
 2、在Info.plist文件，增加键名为UIAppFonts（Fonts provided by application），然后增加各项字体文件名，如：“iconfont.ttf“
 3、通过名称使用字体，如：[UIFont fontWithName:@"iconfont" size: 32];//具体名字在生成ttf时已知
 
 */

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong)UILabel *label1;
@property(nonatomic, strong)UILabel *label2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (NSString *familyName in [UIFont familyNames]) {
        for (NSString *fontName in [UIFont fontNamesForFamilyName:familyName]) {
            NSLog(@"%@", fontName);
        }
    }
    
    [self font1];
 
    [self font2];
    
    [self button1];
    
}

-(void)font1
{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 110, self.view.bounds.size.width, 150)];
    UIFont *iconfont = [UIFont fontWithName:@"iconfont" size: 32];
    label.font = iconfont;
    label.text = @" \U0000e65e \U0000e65f \U0000e663 \U0000e600 \U0000e602 \U0000e608";
    [self.view addSubview: label];
    self.label1 = label;
}

-(void)font2
{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 260, self.view.bounds.size.width, 150)];
    UIFont *iconfont = [UIFont fontWithName:@"uxIconFont" size: 32];
    label.font = iconfont;
    label.text = @" \U00003439 \U000035ad \U000035ae \U000035af \U000035eb \U000035ec";
    [self.view addSubview: label];
    self.label2 = label;
}

#pragma mark - 点击按钮改颜色 -

-(void)button1
{
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 64, 80, 44)];
    btn.backgroundColor = [UIColor grayColor];
    [self.view addSubview:btn];
    [btn setTitle:@"change" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(tapButton1) forControlEvents:UIControlEventTouchUpInside];
}
-(void)tapButton1
{
    NSInteger rnd = (arc4random() % 40) + 20;
    CGFloat r = (arc4random() % 255), g = (arc4random() % 255), b = (arc4random() % 255);
    self.label1.font = [UIFont fontWithName:@"iconfont" size: rnd];
    self.label2.font = [UIFont fontWithName:@"uxIconFont" size: rnd];
    self.label1.textColor = [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:1];
    self.label2.textColor = [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:1];
    //[self randomBackground];
}
-(void)randomBackground
{
    CGFloat r = (arc4random() % 255), g = (arc4random() % 255), b = (arc4random() % 255);
    self.view.backgroundColor = [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:1];
}



@end

# IconFontDemo

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

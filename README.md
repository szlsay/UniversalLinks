# UniversalLinks
When you support universal links, iOS users can tap a link to your website and get seamlessly redirected to your installed app without going through Safari. If your app isn’t installed, tapping a link to your website opens your website in Safari.

## 1.资料
1. [Support Universal Links官方资料](https://developer.apple.com/library/content/documentation/General/Conceptual/AppSearch/UniversalLinks.html#//apple_ref/doc/uid/TP40016308-CH12-SW1)
2. [iOS 9学习系列：打通 iOS 9 的通用链接（Universal Links）](http://www.cocoachina.com/ios/20150902/13321.html)
3. [苹果验证通用链接网站](https://search.developer.apple.com/appsearch-validation-tool/)
4. [苹果支持的https证书列表](https://support.apple.com/en-us/HT204132)

## 2.操作步骤

1. 创建一个 ==apple-app-site-association== 文件，其中包含有关您的应用可以处理的URL的JSON数据。参考数据见下：

```
{
   "activitycontinuation": {
    	"apps": []},

    "applinks": {
        "apps": [],
        "details": [
            {
                "appID": "23P8M9VEK5.com.comtop.eoa",
                "paths": ["*"]
            }
        ]
    }
}  
    
```

2. 将 ==apple-app-site-association== 文件上传到您的HTTPS Web服务器。 您可以将该文件放在服务器的根目录或.well-known子目录中。[参考文件链接](https://stshenzhaoliang.github.io/apple-app-site-association)
3. 准备您的应用程序来处理通用链接。参考下图：
![](https://github.com/STShenZhaoliang/STImage/blob/master/UniversalLinks/image1.png)
设置成功后，在entitlements File中有相同的配置
![](https://github.com/STShenZhaoliang/STImage/blob/master/UniversalLinks/image2.png)
4. 操作成功后的效果图
![](https://github.com/STShenZhaoliang/STImage/blob/master/UniversalLinks/image3.PNG)


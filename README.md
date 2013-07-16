GfanSDKiOS Cocos2d Demo
==============

GfanSDK for iOS Cocos2d Demo

说明

1. 请详细阅读"机锋支付SDK for iOS.pdf"文档，以及本Demo和Demo中的说明部分

2. 本Demo中GfanSDK并未嵌入(GfanSDK.h,UserInfoByGfan.h,OrderInfoByGfan.h,GfanSDKResponse.h,libGfanSDK.a)，如果需要获取最新的SDK，请到 http://dev.gfan.com 下载

3. 代码注释中出现"GfanSDK for iOS"的部分，Add至End中间的代码必须复制如正式项目,否则会导致支付后无响应（无法回调）

4. 不要忘记了AppDelegate.m中的代码和GfanSDKDemo-Info.plist中的URL Types参数

5. 苹果的In-App支付在接入前有较多工作量是对苹果开发者账号的设置和发布应用In-App的设定，建议熟悉阅读该网站 http://www.cocoachina.com/special/iap.html

6. 苹果的In-App Project Build前,请仔细检查您的签名证书是否与发布的In-App应用开发者证书想匹配，否则无法进入沙箱测试

7. 当本Demo能正式跑起来，且可接受支付宝支付、In-App支付后，再移植代码到您的项目中，这样能有效降低接入复杂度



Create by Emck

CopyRight 机锋网(gfan.com)
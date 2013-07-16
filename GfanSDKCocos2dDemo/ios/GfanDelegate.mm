//
//  GfanDelegate.m
//  GfanSDKCocos2dDemo
//
//  Created by Emck on 7/16/13.
//
//

#import "GfanDelegate.h"

@implementation GfanDelegate

// 回调方法定义
extern void Cocos2dGfanSDKCallBack(const char*, const char*);

// Use static varialbe
static GfanDelegate *GfanDelegateInit = nil;
static GfanSDK *GfanSDKInit = nil;

+ (GfanDelegate*)doInit:(NSString *)CPID TimeOutByNetWork:(NSInteger)TimeOutByNetWork
{
    if (GfanDelegateInit != nil) return GfanDelegateInit;
    else {
        GfanDelegateInit = [[GfanDelegate alloc] init];
        GfanSDKInit = [[GfanSDK alloc] init:Cocos2dGetViewController() Delegate:GfanDelegateInit CPID:CPID TimeOutByNetWork:TimeOutByNetWork];
        [[NSNotificationCenter defaultCenter] addObserver: GfanDelegateInit selector: @selector(GfanSDKApplePayCallBack:) name: @"GfanSDKApplePayNotification" object: nil];
        return GfanDelegateInit;
    }
}

+ (GfanSDK*)defaultGfanSdk
{
    //NSLog(@"务必请先初始化 doInit:(NSString *)CPID TimeOutByNetWork:(NSInteger)TimeOutByNetWork");
    if (GfanSDKInit == nil) {
        // 如果应用是支付宝触发启动,很可能初始化doInit方法还未生效,那么临时创建一个实例,处理完支付宝的回调后自动释放
        return [[GfanSDK alloc] init:Cocos2dGetViewController() Delegate:GfanDelegateInit CPID:nil TimeOutByNetWork:30];
    }
    else return GfanSDKInit;
}

// 接口回调方法(根据调用接口的不同,回调不同的接口)
- (void)GfanSDKCallBack:(id)sender
{
    GfanSDKResponse *Response = (GfanSDKResponse *)sender;
    NSString *message;
    if (Response.isSucceed == TRUE) {
        message = [NSString stringWithFormat:@"result=true"];
        if (Response.GfanInfo != nil) message = [message stringByAppendingFormat:@"&%@",Response.GfanInfo];
    }
    else {
        message = [NSString stringWithFormat:@"result=false&StatusCode=%d&Message=%@",Response.StatusCode,Response.StatusMessage];
    }
    
    const char *APIType;
    switch (Response.APIType) {
        case APIdoLogin :
            APIType = "OnLogin";
            break;
        case APIdoLogout :
            APIType = "OnLogout";
            break;
        case APIdoVerifyStatus :
            APIType = "OnVerifyStatus";
            break;
        case APIdoPayOrder :
            APIType = "OnPayForOrder";
            break;
        case APIdoInAppBuyProduct :
            APIType = "OnPayForOrderIAP";
            break;
            
        default:
            return;
    }
	Response = nil;
    
    // 回调Cocos2d中定义的Cocos2dGfanSDKCallBack方法
    Cocos2dGfanSDKCallBack(APIType,[message UTF8String]);
}

// 苹果In-App支付成功回调
- (void)GfanSDKApplePayCallBack:(NSNotification *)Notify
{
    [GfanSDKInit doInAppChargeCallBack:[Notify object]];
}

@end
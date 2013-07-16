//
//  GfanDelegate.h
//  GfanSDKCocos2dDemo
//
//  Created by Emck on 7/16/13.
//
//

#import <Foundation/Foundation.h>

#import "GfanSDK.h"

extern UIViewController* Cocos2dGetViewController();

@interface GfanDelegate : NSObject <GfanSDKDelegate>

+ (GfanDelegate*)doInit:(NSString *)CPID TimeOutByNetWork:(NSInteger)TimeOutByNetWork;

+ (GfanSDK*)defaultGfanSdk;

@end
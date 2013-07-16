//
//  GfanSDKCocos2dDemoAppController.h
//  GfanSDKCocos2dDemo
//
//  Created by Emck on 7/16/13.
//  Copyright mAPPn 2013. All rights reserved.
//

@class RootViewController;

@interface AppController : NSObject <UIAccelerometerDelegate, UIAlertViewDelegate, UITextFieldDelegate,UIApplicationDelegate> {
    UIWindow *window;
    RootViewController    *viewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) RootViewController *viewController;

@end


#include "HelloWorldScene.h"
#include "SimpleAudioEngine.h"

//------------------------GfanSDK for iOS------------- Add -----
#import "GfanDelegate.h"
//------------------------GfanSDK for iOS------------- End -----

using namespace cocos2d;
using namespace CocosDenshion;

CCScene* HelloWorld::scene()
{
    // 'scene' is an autorelease object
    CCScene *scene = CCScene::create();
    
    // 'layer' is an autorelease object
    HelloWorld *layer = HelloWorld::create();

    // add layer as a child to scene
    scene->addChild(layer);

    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
bool HelloWorld::init()
{
    //////////////////////////////
    // 1. super init first
    if ( !CCLayer::init() )
    {
        return false;
    }
    // ask director the the window size
    CCSize size = CCDirector::sharedDirector()->getWinSize();
    
    CCMenuItemFont* LoginButton=CCMenuItemFont::create("Login", this, menu_selector(HelloWorld::menuOnClickLogin));
    LoginButton->setFontSize(50);
    LoginButton->setScale(1.5f);
    LoginButton->setPosition( ccp(size.width / 2, 800));
    CCMenu* menu1 = CCMenu::create(LoginButton,NULL);
    menu1->setPosition(ccp(0, 0));
    this->addChild(menu1);
    
    CCMenuItemFont* PayButton=CCMenuItemFont::create("Pay", this, menu_selector(HelloWorld::menuOnClickPay));
    PayButton->setFontSize(50);
    PayButton->setScale(1.5f);
    PayButton->setPosition( ccp(size.width / 2, 600));
    CCMenu* menu2 = CCMenu::create(PayButton,NULL);
    menu2->setPosition(ccp(0, 0));
    this->addChild(menu2);
    
    CCMenuItemFont* LogOutButton=CCMenuItemFont::create("LogOut", this, menu_selector(HelloWorld::menuOnClickLogOut));
    LogOutButton->setFontSize(50);
    LogOutButton->setScale(1.5f);
    LogOutButton->setPosition( ccp(size.width / 2, 400));
    CCMenu* menu3 = CCMenu::create(LogOutButton,NULL);
    menu3->setPosition(ccp(0, 0));
    this->addChild(menu3);
    
    //// 更多的按钮和SDK调用,这里不再列出,详细可根据SDK文档自行编写,本Demo仅仅演示了3个接口(登陆,退出,支付),还有其他接口可供使用
    
    return true;
}

// 登陆
void HelloWorld::menuOnClickLogin(CCObject* pSender)
{
    [[GfanDelegate defaultGfanSdk] doLoginWithQuickRegister];
}

// 支付
void HelloWorld::menuOnClickPay(CCObject* pSender)
{
    // 以下参数,请查找文档适当填写....
    const char* appKey = "1043071178";          // 支付Key,请通过机锋开发者后台申请支付Appkey(http://dev.gfan.com/Aspx/DevApp/AskKeyStep1.aspx 须先注册为开发者)
    const char* orderId = "";
    const char* productName = "待支付产品名称";
    const char* payDesc = "待支付产品描述";
    int payValue = 1;
    
    OrderInfoByGfan *Order = [[OrderInfoByGfan alloc]init];
    Order.PayCoupon = payValue;
    Order.PayAppKey = [NSString stringWithUTF8String:appKey];
    if (orderId != NULL && strlen(orderId) >0)
        Order.OrderID = [NSString stringWithUTF8String:orderId];
    Order.PayName = [NSString stringWithUTF8String:productName];
    Order.PayDesc = [NSString stringWithUTF8String:payDesc];

    [[GfanDelegate defaultGfanSdk] doPayOrder:Order];
}

// 退出
void HelloWorld::menuOnClickLogOut(CCObject* pSender)
{
    [[GfanDelegate defaultGfanSdk] doLogout];
}

// 被GfanSDK回调的方法,需接入业务自行处理,这里仅仅是显示出日志.....
void Cocos2dGfanSDKCallBack(const char* APIType, const char* Message)
{
    // 这里应该根据APIType来判断是那个接口,并对Message字符串做处理
    // Message字符串在GfanDelegate类的GfanSDKCallBack方法里重新组装的,可根据你自己的需求自己组装,方便识别和判断
    NSLog(@"%s %s",APIType,Message);
}

void HelloWorld::menuCloseCallback(CCObject* pSender)
{
    CCDirector::sharedDirector()->end();

#if (CC_TARGET_PLATFORM == CC_PLATFORM_IOS)
    exit(0);
#endif
}

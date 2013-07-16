#include "HelloWorldScene.h"
#include "SimpleAudioEngine.h"

#import <Foundation/Foundation.h>

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
    CCMenuItemFont* bt1=CCMenuItemFont::create("Login", this, menu_selector(HelloWorld::menuOnClickPay));
    bt1->setFontSize(50);
    bt1->setScale(1.5f);
    
    
    // ask director the the window size
    CCSize size = CCDirector::sharedDirector()->getWinSize();
    
    bt1->setPosition( ccp(size.width / 2, size.height /2));
    
    CCMenu* menu = CCMenu::create(bt1,NULL);
    menu->setPosition(ccp(0, 0));
    this->addChild(menu);
        
    return true;
}

void HelloWorld::menuOnClickPay(CCObject* pSender)
{
}

void HelloWorld::menuCloseCallback(CCObject* pSender)
{
    CCDirector::sharedDirector()->end();

#if (CC_TARGET_PLATFORM == CC_PLATFORM_IOS)
    exit(0);
#endif
}

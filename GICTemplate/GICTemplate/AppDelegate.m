#import "AppDelegate.h"
#import <GICXMLLayout/GICXMLLayout.h>
#import <GICXMLLayout/GICRouter.h>
#import <GICXMLLayout/GICJSAPIManager.h>
#import <GICXMLLayout/GICElementsCache.h>

#import "JSAPIExtension.h"
#import "PackageManager.h"

#pragma mark 自定义元素
#import "TabControllerElements.h"

// 通过方法交换实现 UIViewController 的 hidesBottomBarWhenPushed属性
@implementation UIViewController (TabPage)
+(void)initialize{
    Method method1 = class_getInstanceMethod([self class], @selector(hidesBottomBarWhenPushed));
    Method method2 = class_getInstanceMethod([self class], @selector(tabpage_hidesBottomBarWhenPushed));
    method_exchangeImplementations(method1, method2);
}

-(BOOL)tabpage_hidesBottomBarWhenPushed{
    return self.navigationController.viewControllers.count>1;
}
@end


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    // 注册gic类库默认所有元素
    [GICXMLLayout regiterAllElements];
    [GICRouter regiterAllElements];
    
    //注册自定义元素
    [GICElementsCache registElement:[TabControllerElements class]];
    
    // 注册JSAPI
    [GICJSAPIManager addJSAPIRegisterClass:[JSAPIExtension class]];
    
    // 使用包管理器来启动APP
    [[PackageManager manage] start];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

#import "AppDelegate.h"
#import <GICXMLLayout/GICXMLLayout.h>
#import <GICXMLLayout/GICRouter.h>

#if DEBUG
#import "GICXMLLayoutDevTools.h"
#endif

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // 注册gic类库默认所有元素
    [GICXMLLayout regiterAllElements];
    [GICRouter regiterAllElements];
    
#if DEBUG
    // NOTE: 运行之前，请先使用VSCode打开工程文件夹，然后安装 "GICVSCodeExtension"插件，VSCode会自动启动http服务器，并且会启动一个 websocket ，这样会你直接在VSCode中使用"cmd+r"快捷键来实现"hotreload"功能
    // 设置根目录
    [GICXMLLayout setRootUrl:@"http://localhost:8080"];
    // 通过GIC来加载APP
    [GICXMLLayoutDevTools loadAPPFromPath:@"App.xml"];
#else
    // 设置根目录
    [GICXMLLayout setRootUrl:[[NSBundle mainBundle].bundlePath stringByAppendingPathComponent:@"build/project"]];
    // 通过GIC来加载APP
    [GICRouter loadAPPFromPath:@"App.xml"];
#endif
    
    
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

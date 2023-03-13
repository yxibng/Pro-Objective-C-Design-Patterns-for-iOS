//
//  AppDelegate.m
//  TouchPainter-Arc
//
//  Created by xiaobing yao on 2023/3/12.
//

#import "AppDelegate.h"
#import "CoordinatingController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window.rootViewController = [[CoordinatingController sharedInstance] activeViewController];
    return YES;
}


@end

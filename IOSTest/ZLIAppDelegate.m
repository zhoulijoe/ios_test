#import "ZLIAppDelegate.h"
#import <ZLIUtils/ZLILogger.h>

@implementation ZLIAppDelegate

# pragma mark - Life cycle

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [ZLILogger attachLogger];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];

    [UIApplication sharedApplication].statusBarHidden = NO;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

    UIStoryboard *mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *rootVC = [mainSB instantiateViewControllerWithIdentifier:@"ZLIMainMenuTableNavViewController"];

    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];

    // Set desired notification settings
    UIUserNotificationSettings *notificationSettings =
        [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert |
                                                      UIUserNotificationTypeBadge |
                                                      UIUserNotificationTypeSound)
                                          categories:nil];
    [application registerUserNotificationSettings:notificationSettings];

    // Enable push notification
    [application registerForRemoteNotifications];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

# pragma mark - State restoration

- (BOOL)application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder {
    return YES;
}

- (BOOL)application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder {
    return YES;
}

# pragma mark - Notification delegate methods

- (void)application:(UIApplication *)application
didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    DDLogDebug(@"Registered user notification settings: %@", notificationSettings);
}

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    DDLogDebug(@"Registered for remote notification with device token: %@", deviceToken);
}

- (void)application:(UIApplication *)application
didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    DDLogError(@"Failed to register for remote notification: %@", error);
}

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo {
    DDLogDebug(@"Received remote notification: %@", userInfo);
}

# pragma mark - NSObject method override

/**
 * Indicate which app delegate method are called and in what order
 *
 * @param aSelector selector name
 *
 * @return boolean indicating whether requested method is implemented
 */
- (BOOL)respondsToSelector:(SEL)aSelector {
    DDLogVerbose(@"%@", NSStringFromSelector(aSelector));
    return [super respondsToSelector:aSelector];
}

@end

#import "RSDFSAppDelegate.h"
#import "RSDFDatePickerViewController.h"

@implementation RSDFSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	RSDFDatePickerViewController *datePickerVC = [RSDFDatePickerViewController new];
    UINavigationController *rootNC = [[UINavigationController alloc] initWithRootViewController:datePickerVC];
	self.window.rootViewController = rootNC;
	[self.window makeKeyAndVisible];
	return YES;
}

@end

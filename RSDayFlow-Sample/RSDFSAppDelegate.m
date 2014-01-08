#import "RSDFSAppDelegate.h"
#import "RSDFDatePickerViewController.h"

@implementation RSDFSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	RSDFDatePickerViewController *picker = [RSDFDatePickerViewController new];
	self.window.rootViewController = picker;
	[self.window makeKeyAndVisible];
	return YES;
}

@end

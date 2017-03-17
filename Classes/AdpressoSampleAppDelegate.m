//
//  AdpressoSampleAppDelegate.m
//  adpresso_sample
//
//  Created on 11/19/09.
//  Copyright Atlantis 2009. All rights reserved.
//  Copyright © 2016 ValueCommerce Co., Ltd. All rights reserved.
//

#import "AdpressoSampleAppDelegate.h"
#import "RootViewController.h"
#import "RotatingNavigationController.h"

@interface AdpressoSampleAppDelegate()

@property (nonatomic, strong) UINavigationController *navigationController;

@property (nonatomic, strong) RootViewController *rootViewController;

@end

@implementation AdpressoSampleAppDelegate

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
  // Override point for customization after app launch
  self.rootViewController = [[RootViewController alloc] initWithNibName:@"RootViewController" bundle:nil];
  self.navigationController = [[RotatingNavigationController alloc] initWithRootViewController: self.rootViewController];
  
  self.window.rootViewController = self.navigationController;
  [self.window makeKeyAndVisible];
  
  return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
  // Save data if appropriate
}

@end


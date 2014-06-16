//
//  AppDelegate.m
//  iOSChallenge
//
//  Created by Attila Tamas on 14/06/14.
//  Copyright (c) 2014 Attila Tamas. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "TweetsViewController.h"
#import "DataManager.h"

@interface AppDelegate () <LoginViewControllerDelegate>

@property (nonatomic) DataManager *dataManager;
//@property (nonatomic) RootViewController *rootController;
@property (nonatomic) LoginViewController *loginViewController;


@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    _dataManager = [DataManager sharedInstance];
    
    [self setRootViewController];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [self.dataManager handleOpenURL:url];
}

#pragma mark - UI

- (void)setRootViewController {
    self.loginViewController = [[LoginViewController alloc] init];
    self.loginViewController.delegate = self;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:self.loginViewController];
    navigationController.navigationBarHidden = YES;
    [self.window setRootViewController:navigationController];
}

#pragma mark - LoginViewControllerDelegate

- (void)loginViewControllerDidFinishLogin:(LoginViewController *)loginViewController {
    self.loginViewController.delegate = nil;

    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
    navigationController.viewControllers = @[[[TweetsViewController alloc] init]];
}


@end

//
//  LoginViewController.m
//  iOSChallenge
//
//  Created by Attila Tamas on 14/06/14.
//  Copyright (c) 2014 Attila Tamas. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController () <UIWebViewDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeScreen];
}

#pragma mark - UI

- (void)initializeScreen {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 100.0f, self.view.frame.size.width, 30.0f)];
    label.text = @"Connect to your twitter account";
    label.font = [UIFont systemFontOfSize:14.0f];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [loginButton setTitle:@"Connect" forState:UIControlStateNormal];
    loginButton.frame = CGRectMake(85.0f, CGRectGetMaxY(label.frame) + 20.0f, 150.0f, 40.0f);
    [loginButton addTarget:self action:@selector(loginButtonDidTouch) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
}

#pragma mark - Twitter login

- (void)loginButtonDidTouch {
    [self.dataManager connectToTwitterAccount];
}

#pragma mark - Notifications

- (void)signUpForNotification {
    [super signUpForNotification];
    
    [NotificationCenter addObserver:self selector:@selector(didFinishLogin) name:kNotificationDidFinishLogin object:nil];
    [NotificationCenter addObserver:self selector:@selector(didFailLogin) name:kNotificationDidFailLogin object:nil];
}

- (void)didFinishLogin {
    if ([self.delegate respondsToSelector:@selector(loginViewControllerDidFinishLogin:)]) {
        [self.delegate loginViewControllerDidFinishLogin:self];
    }
}

- (void)didFailLogin {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Did fail login process" message:nil delegate:nil cancelButtonTitle:@"Close" otherButtonTitles: nil];
    [alert show];
}

@end

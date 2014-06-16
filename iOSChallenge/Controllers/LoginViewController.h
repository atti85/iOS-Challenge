//
//  LoginViewController.h
//  iOSChallenge
//
//  Created by Attila Tamas on 14/06/14.
//  Copyright (c) 2014 Attila Tamas. All rights reserved.
//

#import "BaseViewController.h"

@protocol LoginViewControllerDelegate;

@interface LoginViewController : BaseViewController

@property (nonatomic, weak) id<LoginViewControllerDelegate> delegate;

@end

@protocol LoginViewControllerDelegate <NSObject>

@optional
- (void)loginViewControllerDidFinishLogin:(LoginViewController *)loginViewController;

@end

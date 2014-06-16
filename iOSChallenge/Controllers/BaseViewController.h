//
//  BaseViewController.h
//  iOSChallenge
//
//  Created by Attila Tamas on 14/06/14.
//  Copyright (c) 2014 Attila Tamas. All rights reserved.
//

#import "DataManager.h"

@interface BaseViewController : UIViewController

@property (nonatomic) DataManager *dataManager;

- (void)signUpForNotification;

@end

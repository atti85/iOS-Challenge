//
//  BaseViewController.m
//  iOSChallenge
//
//  Created by Attila Tamas on 14/06/14.
//  Copyright (c) 2014 Attila Tamas. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _dataManager = [DataManager sharedInstance];
    
    [self signUpForNotification];
}

- (void)dealloc {
    [NotificationCenter removeObserver:self];
}

- (void)signUpForNotification { /*Should be implemented in child if needed*/}

@end

//
//  GeneralConstants.h
//  iOSChallenge
//
//  Created by Attila Tamas on 14/06/14.
//  Copyright (c) 2014 Attila Tamas. All rights reserved.
//


#define SHARED_INSTANCE_USING_BLOCK(block) \
static dispatch_once_t pred = 0; \
__strong static id _sharedInstance = nil; \
dispatch_once(&pred, ^{ \
_sharedInstance = block(); \
}); \
return _sharedInstance;

#define NotificationCenter              [NSNotificationCenter defaultCenter]

#define CONSUMER_KEY         @"XAFeLySGpyDLjqjAXIfA5z2mN"
#define CONSUMER_SECRET      @"fjRJbYjfNcALMgBuaDpPYiwgfjIZGfSIaxcVeRatXJXgoTinEN"

#define kOATokenUserDefProvider         @"twitter"
#define kOATokenUserDefPrefix           @"prefix"

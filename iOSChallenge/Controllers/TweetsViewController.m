//
//  TweetsViewController.m
//  iOSChallenge
//
//  Created by Attila Tamas on 14/06/14.
//  Copyright (c) 2014 Attila Tamas. All rights reserved.
//

#import "TweetsViewController.h"
#import "NSString+Size.h"
#import "Tweet.h"
#import "User.h"
#import "UIImageView+AFNetworking.h"

@interface TweetsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) UITableView *tableView;
@property (nonatomic) NSArray *tweets;
@property (nonatomic) UIImageView *profileImage;
@property (nonatomic) UILabel *screenNameLabel;;

@end

@implementation TweetsViewController

#pragma mark - Notifications

- (void)signUpForNotification {
    [super signUpForNotification];
    
    [NotificationCenter addObserver:self selector:@selector(didFinishLoadingTweets) name:kNotificationDidFinishLoadingTweets object:nil];
    [NotificationCenter addObserver:self selector:@selector(didFailRequest:) name:kNotificationDidFailLoadingTweets object:nil];
    
    [NotificationCenter addObserver:self selector:@selector(didFinishLoadingUserDetails) name:kNotificationDidFinishLoadingUserDetails object:nil];
    [NotificationCenter addObserver:self selector:@selector(didFailRequest:) name:kNotificationDidFailLoadingUserDetails object:nil];
}

- (void)didFinishLoadingTweets {
    self.tweets = self.dataManager.tweets;
    
    [self addContent];
}

- (void)didFinishLoadingUserDetails {
    [self addContent];
    
    self.screenNameLabel.text = self.dataManager.user.screenName;
    [self.profileImage setImageWithURL:self.dataManager.user.profileImageUrl];
    [self performBlockOnMainThread:^{
        NSLog(@"%@ - %@", NSStringFromCGSize(self.profileImage.image.size), NSStringFromCGRect(self.screenNameLabel.frame));
    } afterDelay:1.0];
}

- (void)didFailRequest:(NSNotification *)notification {
    NSError *error = notification.object;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:error.localizedDescription message:nil delegate:nil cancelButtonTitle:@"Close" otherButtonTitles: nil];
    [alert show];
}

#pragma mark - UI

- (void)addContent {
    if (!self.tableView) {
        self.profileImage = [[UIImageView alloc] init];
        self.profileImage.contentMode = UIViewContentModeScaleAspectFit;
        self.profileImage.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:self.profileImage];
        
        self.screenNameLabel = [[UILabel alloc] init];
        self.screenNameLabel.font = [UIFont systemFontOfSize:16.0];
        self.screenNameLabel.textColor = [UIColor blueColor];
        self.screenNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:self.screenNameLabel];
        
        self.tableView = [[UITableView alloc] init];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:self.tableView];
        
        NSDictionary *views = @{@"profileImage": self.profileImage, @"screenName" : self.screenNameLabel, @"tableView" : self.tableView};
        
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(10)-[profileImage(<=50)]-(10)-[screenName]-(10)-|" options:0 metrics:nil views:views]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|" options:0 metrics:nil views:views]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(30)-[profileImage]-(10)-[tableView]|" options:0 metrics:nil views:views]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.screenNameLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.profileImage attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0]];
        
    } else {
        [self.tableView reloadData];
    }
    
}

#pragma mark - TableView methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweets.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    Tweet *tweet = [self.tweets objectAtIndex:indexPath.row];
    
    return [tweet.text sizeWithFont:[UIFont systemFontOfSize:12.0f] constrainedToSize:CGSizeMake(tableView.frame.size.width - 15.0f, MAXFLOAT)].height + 10.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    Tweet *tweet = [self.tweets objectAtIndex:indexPath.row];
    cell.textLabel.text = tweet.text;
    cell.separatorInset = UIEdgeInsetsZero;
    cell.textLabel.font = [UIFont systemFontOfSize:12.0f];
    cell.textLabel.numberOfLines = 0;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

@end

//
//  BannerCodeViewController.m
//  adpresso_sample
//
//  Created on 7/5/13.
//  Copyright Atlantis 2013. All rights reserved.
//  Copyright © 2016 ValueCommerce Co., Ltd. All rights reserved.
//

#import "BannerCodeViewController.h"
#import "UIViewController+IOS7ViewControllerEdgeSupport.h"

#import "AdpressoView.h"

@interface BannerCodeViewController() <AdlantisViewDelegate>

@property (nonatomic,strong) AdpressoView *adView;
@property (nonatomic,assign) BOOL center;

@end

@implementation BannerCodeViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
    
    _center = YES;
    CGSize suggestedViewSize = AdpressoViewSize();

    _adView = [[AdpressoView alloc] initWithFrame: CGRectMake(0, 0, suggestedViewSize.width, suggestedViewSize.height)];
    _adView.delegate = self;
    
    //
    //
    // 下記の行を管理画面へ表示されたSDK用の広告枠コードをコピーして下さい。
    //
    //
    _adView.publisherID = @"Mjc3NzI%3D%0A";
    
    [self.view addSubview:_adView];
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  [self setExtendedLayoutEdgesToNone];
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  
  [self updateAdViewFrame];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  // Return YES for supported orientations
  return YES;
}

- (void)updateAdViewFrame
{
  CGSize suggestedViewSize = AdpressoViewSize();
  AdlantisViewLocation location = AdpressoLocationForView(_adView);
  
  if (location == AdpressoViewLocationAtTop || location == AdpressoViewLocationAtBottom) {
    CGRect superViewFrame = self.view.bounds;
    CGRect suggestedViewFrame;
    if (location == AdpressoViewLocationAtTop) {
      suggestedViewFrame = CGRectMake(0, 0, suggestedViewSize.width, suggestedViewSize.height);
    }
    else if (location == AdpressoViewLocationAtBottom) {
      suggestedViewFrame = CGRectMake(0, superViewFrame.size.height - suggestedViewSize.height, suggestedViewSize.width, suggestedViewSize.height);
    }
    
    if (_center) {
      suggestedViewFrame.origin.x = suggestedViewFrame.origin.x + (superViewFrame.size.width - suggestedViewSize.width) / 2;
    }
    
    if (!CGRectEqualToRect(suggestedViewFrame, _adView.frame)) {
      _adView.frame = suggestedViewFrame;
    }
  }
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
  [self updateAdViewFrame];
}

#pragma mark - AdpressoViewDelegate methods

- (void)bannerAdRequestComplete:(AdpressoView*)adView
{
  NSLog(@"%@ %@", NSStringFromSelector(_cmd), adView);
}

- (void)bannerAdRequestFailed:(AdpressoView*)adView
{
  NSLog(@"%@ %@", NSStringFromSelector(_cmd), adView);
}

- (void)bannerAdPreviewWillBeShown:(AdpressoView*)adView
{
  NSLog(@"%@ %@", NSStringFromSelector(_cmd), adView);
}

- (void)bannerAdPreviewWillBeHidden:(AdpressoView*)adView
{
  NSLog(@"%@ %@", NSStringFromSelector(_cmd), adView);
}

- (void)bannerAdTouched:(AdpressoView*)adView
{
  NSLog(@"%@ %@", NSStringFromSelector(_cmd), adView);
}

@end

//
//  InterstitialViewController.m
//  adpresso_sample
//
//  Created on 7/4/13.
//  Copyright Atlantis 2013. All rights reserved.
//  Copyright © 2016 ValueCommerce Co., Ltd. All rights reserved.
//

#import "InterstitialViewController.h"
#import "AdpressoInterstitialAd.h"

@interface InterstitialViewController () <AdlantisInterstitialAdDelegate>

@property (nonatomic,strong) AdpressoInterstitialAd *interstitialAd;

@end

@implementation InterstitialViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}


- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  
  // @"" には、Adpresso管理画面で発行されたpublisher IDを記入してください。
  self.interstitialAd = [AdpressoInterstitialAd interstitialAdWithPublisherId:@"Mjc3NzA%3D%0A"];
  _interstitialAd.delegate = self;
  
  [self showInterstitialAd:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
  [super viewWillDisappear:animated];
  
  [_interstitialAd cancel];
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

- (IBAction)showInterstitialAd:(id)sender
{
  [_interstitialAd show];
}

#pragma mark - AdlantisInterstitialAdDelegate methods
- (void)interstitialAdRequestComplete:(AdpressoInterstitialAd*)interstitialAd;
{
  NSLog(@"%@ %@", NSStringFromSelector(_cmd), interstitialAd);
}

- (void)interstitialAdRequestFailed:(AdpressoInterstitialAd*)interstitialAd;
{
  NSLog(@"%@ %@", NSStringFromSelector(_cmd), interstitialAd);
}

@end

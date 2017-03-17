//
//  BannerIBViewController.m
//  adpresso_sample
//
//  Created on 11/19/09.
//  Copyright 2009 Atlantis. All rights reserved.
//  Copyright © 2016 ValueCommerce Co., Ltd. All rights reserved.
//

#import "BannerIBViewController.h"

#import "AdpressoView.h"

#import <MapKit/MapKit.h>

@interface BannerIBViewController() <AdlantisViewDelegate>

@property (nonatomic,strong) IBOutlet MKMapView *mapView;
@property (nonatomic,strong) IBOutlet AdpressoView *adView;

@end

@implementation BannerIBViewController

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
  }
  
  return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [super viewDidLoad];
  
  _adView.delegate = self;
  //
  //
  // 下記の行を管理画面へ表示されたSDK用の広告枠コードをコピーして下さい。
  //
  //
  _adView.publisherID = @"Mjc3NzI%3D%0A";
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  // Return YES for supported orientations
  return YES;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
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
    
    BOOL center = YES;
    if (center) {
      suggestedViewFrame.origin.x = suggestedViewFrame.origin.x + (superViewFrame.size.width - suggestedViewSize.width) / 2;
    }
    
    if (!CGRectEqualToRect(suggestedViewFrame, _adView.frame)) {
      _adView.frame = suggestedViewFrame;
    }
  }
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
  [super viewDidUnload];
    _mapView = nil;
   _adView = nil;
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

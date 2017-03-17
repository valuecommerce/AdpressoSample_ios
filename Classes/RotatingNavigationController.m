//
//  RotatingNavigationController.m
//  adpresso_sample
//
//  Created on 9/20/12.
//  Copyright Atlantis 2014. All rights reserved.
//  Copyright © 2016 ValueCommerce Co., Ltd. All rights reserved.
//

#import "RotatingNavigationController.h"

@interface RotatingNavigationController ()

@end

@implementation RotatingNavigationController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate
{
  return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
  return UIInterfaceOrientationMaskAll;
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  // Return YES for supported orientations
  return YES;
}

@end

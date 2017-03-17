//
//  UIViewController+IOS7ViewControllerEdgeSupport.m
//  adpresso_sample
//
//  Created on 8/7/13.
//  Copyright 2013 Atlantis. All rights reserved.
//  Copyright © 2016 ValueCommerce Co., Ltd. All rights reserved.
//

#import "UIViewController+IOS7ViewControllerEdgeSupport.h"

@implementation UIViewController (ADLIOS7ViewControllerEdgeSupport)

// this is a way to fix layout for iOS 7
- (void)setExtendedLayoutEdgesToNone
{
#if defined(__IPHONE_7_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
  
  if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
    self.edgesForExtendedLayout = UIRectEdgeNone;
  }
  
#endif
}

@end

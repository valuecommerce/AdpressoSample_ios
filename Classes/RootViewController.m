//
//  RootViewController.m
//  adpresso_sample
//
//  Copyright Atlantis 2009. All rights reserved.
//  Copyright © 2016 ValueCommerce Co., Ltd. All rights reserved.
//

#import "RootViewController.h"
#import "AdpressoAdManager.h"
#import "BannerIBViewController.h"
#import "TableViewController.h"

static NSString *kCellIdentifier = @"MyCellIdentifier";
static NSString *kTitleKey = @"title";
static NSString *kViewControllerClassNameKey = @"viewControllerClassName";

@interface RootViewController()

@property (nonatomic, strong) NSArray *menuList;

@end

@implementation RootViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

  self.title = @"Adpresso Sample";
  
  self.menuList = @[@{kTitleKey: NSLocalizedString(@"Banner View (Interface Builder)", @"Banner View (Interface Builder)"),
                      kViewControllerClassNameKey: @"BannerIBViewController"},
                    @{kTitleKey: NSLocalizedString(@"Banner View (Code)", @"Banner View (Code)"),
                      kViewControllerClassNameKey: @"BannerCodeViewController"},
                    @{kTitleKey: NSLocalizedString(@"Banner in Table", @"Banner in Table"),
                      kViewControllerClassNameKey: @"TableViewController"},
                    @{kTitleKey: NSLocalizedString(@"Interstitial Ad", @"Interstitial Ad"),
                      kViewControllerClassNameKey: @"InterstitialViewController"}
                    ];
    
	// create a custom navigation bar button and set it to always say "Back"
	UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
	temporaryBarButtonItem.title = @"Back";
	self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
  
  [self setUpHeaderLabel];
}

- (void)setUpHeaderLabel
{
  UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 22)];
  headerLabel.text = [AdpressoAdManager sharedManager].fullVersionString;
  headerLabel.textAlignment = NSTextAlignmentCenter;
  headerLabel.backgroundColor = [UIColor blackColor];
  headerLabel.textColor = [UIColor whiteColor];
  headerLabel.font = [UIFont systemFontOfSize:12];
  ((UITableView*)self.view).tableHeaderView = headerLabel;
}
 
- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  // this UIViewController is about to re-appear, make sure we remove the current selection in our table view
  NSIndexPath *tableSelection = [self.tableView indexPathForSelectedRow];
  [self.tableView deselectRowAtIndexPath:tableSelection animated:NO];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
	[super viewDidUnload];
  self.menuList = nil;
}

#pragma mark - Table view data source methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.menuList count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
	if (cell == nil)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	
	cell.textLabel.text = (self.menuList)[indexPath.row][kTitleKey];
  
	return cell;
}

#pragma mark - Table view delegate

- (UIViewController *)viewControllerWithDict:(NSDictionary*)dict
{
  NSString *controllerClassName = dict[kViewControllerClassNameKey];
  Class controllerClass = NSClassFromString(controllerClassName);
  UIViewController *viewController = nil;
  
  viewController = [[controllerClass alloc] initWithNibName:controllerClassName bundle:nil];
  
  if (!viewController.title) {
    viewController.title = dict[kTitleKey];
  }
  
  return viewController;
}

// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
  NSDictionary *targetViewControllerDict = (self.menuList)[indexPath.row];
  
  UIViewController *viewController = [self viewControllerWithDict:targetViewControllerDict];
  
	[[self navigationController] pushViewController:viewController animated:YES];
}

@end


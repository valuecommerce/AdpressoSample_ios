//
//  TableViewController.m
//  adpresso_sample
//
//  Created by 2/5/10.
//  Copyright 2010 Atlantis. All rights reserved.
//  Copyright © 2016 ValueCommerce Co., Ltd. All rights reserved.
//

#import "TableViewController.h"

#import "AdpressoView.h"

@interface TableViewController()

@property (nonatomic,strong) NSArray *menuData;

@end

@implementation TableViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [super viewDidLoad];
  
  _menuData = @[@"One", @"Two", @"Three", @"Four", @"Five", @"Six", @"Seven", @"Eight"];

  //
  //
  // 下記の行を管理画面へ表示されたSDK用の広告枠コードをコピーして下さい。
  //
  //
  ((AdpressoView*)self.tableView.tableFooterView).publisherID = @"Mjc3NzI%3D%0A";
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
  _menuData = nil; 
 [super viewDidUnload];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  // Return YES for supported orientations
  return YES;
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return _menuData.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
  }
  
  // Configure the cell.
  cell.textLabel.text = _menuData[indexPath.row];
  
  return cell;
}

@end

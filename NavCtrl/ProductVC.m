//
//  ProductVC.m
//  NavCtrl
//
//  Created by Jesse Sahli on 2/7/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import "ProductVC.h"
#import "Product.h"
#import "ProductWebVC.h"



@interface ProductVC ()

@end

@implementation ProductVC



- (void)viewDidLoad {
  [super viewDidLoad];
  UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(toggleEditMode)];
  
  UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonTapped)];
  //self.navigationItem.rightBarButtonItem = editButton;
  self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:editButton, addButton, nil];
  // Do any additional setup after loading the view from its nib.
  self.dataAccessObject = [CompanyDao sharedManager];
  self.tableView.allowsSelectionDuringEditing = YES;
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.dataAccessObject.productAdd = NO;
  self.dataAccessObject.companyAdd = NO;
  self.dataAccessObject.productEdit = NO;
  self.dataAccessObject.companyEdit = NO;
  [self.tableView reloadData];
}

-(void) toggleEditMode {
  if (self.tableView.editing) {
    [self.tableView setEditing:NO animated: YES];
    self.navigationItem.rightBarButtonItem.title = @"Edit";
  } else {
    [self.tableView setEditing:YES animated:NO];
    self.navigationItem.rightBarButtonItem.title = @"Done";
  }
}

-(void)addButtonTapped {
  self.dataAccessObject.productAdd = YES;
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
  // Return the number of sections.
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
  // Return the number of rows in the section.
  return [self.company.products count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
  }
  
  Product * product = [self.company.products objectAtIndex:indexPath.row];
  
  // Configure the cell...
  cell.textLabel.text = product.productName;
  cell.imageView.image = product.productImage;
  
  return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
  // Return NO if you do not want the specified item to be editable.
  return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (editingStyle == UITableViewCellEditingStyleDelete) {
    // Delete the row from the data source
    [self.company.products removeObjectAtIndex:indexPath.row];
    [self.tableView reloadData];
  }
  else if (editingStyle == UITableViewCellEditingStyleInsert) {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
  }
}


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */


 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
  
  //  self.productDetailViewController = [[ProductDetailViewController alloc]init];
  //  self.productDetailViewController.productURL = self.productURL[indexPath.row];
  //
  //  [self.navigationController pushViewController:self.productDetailViewController animated:YES];
}




- (void)dealloc {
  [_tableView release];
  [super dealloc];
}
@end

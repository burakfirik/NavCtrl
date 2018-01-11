

#import "ProductVC.h"
#import "Product.h"
#import "ProductAddVC.h"
#import "ProductEditVC.h"
#import "WebViewEditVC.h"

@interface ProductVC ()

@end

@implementation ProductVC

- (void)viewDidLoad {
  [super viewDidLoad];
  UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(toggleEditMode)];
  
  UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonTapped)];
  
  self.productTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
  //self.navigationItem.rightBarButtonItem = editButton;
  self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:editButton, addButton, nil];
  // Do any additional setup after loading the view from its nib.
  self.dataAccessObject = [CompanyDao sharedManager];
  self.productTableView.delegate = self;
  self.productTableView.dataSource = self;
  self.productTableView.allowsSelectionDuringEditing = YES;
  
  [self.view addSubview:self.productTableView];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.productTableView reloadData];
}

-(void) toggleEditMode {
  if (self.productTableView.editing) {
    [self.productTableView setEditing:NO animated: YES];
    self.navigationItem.rightBarButtonItem.title = @"Edit";
  } else {
    [self.productTableView setEditing:YES animated:NO];
    self.navigationItem.rightBarButtonItem.title = @"Done";
  }
}

-(void)addButtonTapped {
  ProductAddVC *productAddVC = [[ProductAddVC alloc] init];
  
  productAddVC.company = self.company;
  productAddVC.companyAddIndex = self.companyAddIndex;
  [self.navigationController pushViewController:productAddVC animated:true];
  
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
  
 // [tableView registerClass:[UITableViewCell] forCellReuseIdentifier:<#(nonnull NSString *)#>]
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
  }
  
  Product * product = [self.company.products objectAtIndex:indexPath.row];
  
  // Configure the cell...
  cell.textLabel.text = product.productName;
  //cell.imageView.frame = CGRectMake(cell.imageView.frame.origin.x, cell.imageView.frame.origin.y, 10,10);
  
  cell.imageView.image = [UIImage imageNamed:@"default"];
//  NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:product.productImageURL]];
//  UIImage *image = [[UIImage alloc] initWithData:imageData];
//  if (image != nil) {
//    cell.imageView.image = image;
//  }
   [cell.imageView.image drawInRect:CGRectMake(0, 0, 32, 32)];
   cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:product.productImageURL]]];
  if (cell.imageView.image == nil) {
    cell.imageView.image = [UIImage imageNamed:@"default"];
  }
  
  cell.imageView.clipsToBounds = YES;
  
  UIGraphicsBeginImageContextWithOptions(CGSizeMake(40, 40), NO, UIScreen.mainScreen.scale);
  [cell.imageView.image drawInRect:CGRectMake(0.0, 0.0, 40,40)];
  cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
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
    //[self.company.products removeObjectAtIndex:indexPath.row];
    [self.dataAccessObject removeProduct: (NSInteger*)self.companyAddIndex productIndex: (NSInteger*)indexPath.row];
    [self.productTableView reloadData];
  }
  else if (editingStyle == UITableViewCellEditingStyleInsert) {
   
    
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
  self.productEditViewController = [[ProductEditVC alloc]init];
  
  if (self.productTableView .isEditing) {
    self.productEditViewController.company = self.company;
    self.productEditViewController.productEditIndex = (NSInteger*)(indexPath.row);
    self.productEditViewController.companyEditIndex = self.companyAddIndex;
    [self.navigationController pushViewController:self.productEditViewController animated:true];
  } else {
    WebViewEditVC *webViewEditVC = [[WebViewEditVC alloc] init];
    webViewEditVC.company = self.company;
    webViewEditVC.productURL = [[self.company.products objectAtIndex:indexPath.row] productURL];
    webViewEditVC.productIndex = (NSInteger *) indexPath.row;
    webViewEditVC.companyIndex = (NSInteger *) self.companyAddIndex;
    
    [self.navigationController pushViewController:webViewEditVC animated:true];
    NSLog(@"WEbview");
  }
  
  
}




- (void)dealloc {
  [super dealloc];
}
@end

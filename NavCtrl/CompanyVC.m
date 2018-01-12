

#import "CompanyVC.h"
#import "Product.h"
#import "Company.h"
#import "StockFetcher.h"
#import "StockVC.h"

@interface CompanyVC ()
@property (retain, nonatomic) StockFetcher *stockFetcher;
@property (retain, nonatomic) NSMutableArray *stockPrices;
@end

@implementation CompanyVC

- (void)viewDidLoad {
  [super viewDidLoad];
  _stockFetcher = [[StockFetcher alloc]init];
  self.stockFetcher.delegate = self;
  
  UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(toggleEditMode)];
  
  UIBarButtonItem *addButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonTapped)];
  
  UIBarButtonItem *undoButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemUndo target:self action:@selector(undoButtonTapped)];
  
  self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:editButton, addButton,undoButton, nil];
  self.companyTableView = [[[UITableView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain] autorelease];
  
  
  [editButton release];
  [addButton release];
  [undoButton release];
  
  self.navigationItem.leftBarButtonItem.tintColor = [UIColor clearColor];
  self.navigationItem.leftBarButtonItem.enabled = NO;
  
  self.dataAccessObject = [CompanyDao sharedManager];
  if (self.dataAccessObject.companyList == nil) {
    self.dataAccessObject.companyList = [[[NSMutableArray alloc] init] autorelease];
  }
  self.companyList = self.dataAccessObject.companyList;
//  [self loadStockPrices];
  self.companyTableView .allowsSelectionDuringEditing = YES;
  self.companyTableView.delegate = self;
  self.companyTableView.dataSource = self;
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadCompanyVCTable) name:@"reloadCompanyVC" object:nil];
  [self.view addSubview:self.companyTableView];
  if (self.companyList.count == 0) {
    self.title = @"Add Company";
    self.companyTableView.hidden = YES;
  } else {
    self.title = @"Watch List";
    self.companyTableView.hidden = NO;
  }
  
  
}

-(void) undoButtonTapped {
  [self.dataAccessObject undo];
}

-(NSMutableString*) getStocksString {
  NSMutableString *tickers = [[NSMutableString alloc] init];
  NSMutableArray* companyList = [[CompanyDao sharedManager] companyList];
  for (int i = 0; i < companyList.count; i++) {
    Company* currentCompany = companyList[i];
    if (i == companyList.count - 1){
      if ([currentCompany.stockTick isEqualToString:@""]){
        [tickers appendFormat: @""];
      } else {
        [tickers appendFormat:@"%@", currentCompany.stockTick];
      }
    } else {
      if ([currentCompany.stockTick isEqualToString:@""]){
        [tickers appendFormat: @""];
      } else {
        [tickers appendFormat:@"%@,", currentCompany.stockTick];
      }
    }
  }
  return [tickers autorelease];
}

-(void) loadStockPrices {
  //  NSString *tickerSymbol = self.tickerTextField.text;
  //  [self.stockFetcher fetchStockPriceForTicker:tickerSymbol];
  
  NSString* ticks = [self getStocksString];
  _stockFetcher.companyTableView = self.companyTableView;
  [_stockFetcher fetchStockPriceForTicker:ticks];
  
}

-(void) viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.companyList = self.dataAccessObject.companyList;
  if (self.companyList.count > 0) {
    self.companyTableView.hidden = NO;
  } else {
    self.companyTableView.hidden = YES;
  }
  [self.companyTableView  reloadData];
  [self loadStockPrices];
  
}

-(void) reloadCompanyVCTable {
  [self.companyList removeAllObjects];
  self.companyList = [self.dataAccessObject companyList];
  [self.companyTableView reloadData];
  [self loadStockPrices];
}


- (void)toggleEditMode {
  
  if (self.companyTableView .editing) {
    [self.companyTableView  setEditing:NO animated:YES];
    self.navigationItem.rightBarButtonItem.title = @"Edit";
  } else {
    [self.companyTableView  setEditing:YES animated:NO];
    self.navigationItem.rightBarButtonItem.title = @"Done";
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor blueColor];
    self.navigationItem.leftBarButtonItem.enabled = YES;
  }
  
}
- (void) addButtonTapped {
  NSLog(@"Add button Tapped");
  self.companyAddViewController  = [[[CompanyAddVC alloc] init] autorelease];
  NSMutableArray* compList = self.dataAccessObject.companyList;
  self.companyAddViewController.companyList = compList;
  [self.navigationController pushViewController:self.companyAddViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [self.dataAccessObject.companyList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
  }
  
  Company* company = [self.dataAccessObject.companyList objectAtIndex:indexPath.row];
  
  cell.textLabel.text = company.name;
  cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
 
  [ cell.imageView.image drawInRect:CGRectMake(0, 0, 32, 32)];
  NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:company.logoURL]];
  UIImage *imageToAdd = [[UIImage alloc] initWithData:imageData];
  cell.imageView.image = imageToAdd;
  [imageToAdd release];
  [imageData release];
  if (cell.imageView.image == nil) {
   
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"https://i.imgur.com/HBhdyQc.png"]];
    UIImage *imageTo = [[UIImage alloc] initWithData:imageData];
    cell.imageView.image = imageTo;
    [imageData release];
    [imageTo release];
    
  }
  cell.imageView.clipsToBounds = YES;
  cell.imageView.frame = CGRectMake(0, 0, 40, 40);
  if (indexPath.row < self.stockPrices.count) {
    cell.detailTextLabel.text = [[self.stockPrices  objectAtIndex:indexPath.row] stringValue];
    [cell.detailTextLabel setTextColor: [UIColor grayColor]];
  }
  cell.showsReorderControl = YES;
  
  cell.preservesSuperviewLayoutMargins = false;
  cell.separatorInset = UIEdgeInsetsZero;
  cell.layoutMargins = UIEdgeInsetsZero;
  return cell;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  //  [self.tickerTextField resignFirstResponder];
}


#pragma mark Required Delegate Methods
//
//-(void)stockFetchSuccessWithPriceString: (NSString*) priceString rowIndex: (NSInteger*) index {
//  NSLog(@"Stock price received");
//  NSString *dollarSignPrice = [NSString stringWithFormat:@"$%@", priceString];
//  [self.stockPrices  addObject:dollarSignPrice];
////  self.priceLabel.text = dollarSignPrice;
//}
//
//-(void)stockFetchDidFailWithError: (NSError*) error rowIndex:(NSInteger*) index {
//  [self.stockPrices  addObject:@" "];
//}
//
//#pragma mark Optional Delegate Methods
//
//-(void)stockFetchDidFailWithError:(NSError *)error {
//  NSLog(@"Couldn't fetch stock price, this is a description of the error:%@", error.localizedDescription);
//  //do some sort of error handling here
//}


-(void)stockFetchSuccessWithPriceString:(NSArray *)priceArray{
  NSLog(@"Stock price received");
  
  if(_stockPrices)[_stockPrices release];
  
  _stockPrices = [[NSMutableArray alloc] init];
  

 
 
//  _stockPrices = [[NSMutableArray alloc] init];
  
  
  for (NSDictionary *compStock in priceArray) {
    NSLog(@"s");
    @try{
      NSString *price = [compStock objectForKey:@"lastSalePrice"];
      [self.stockPrices addObject:price];
    }
    @catch (NSException *exception){
      NSLog(@"Stock has missing tick");
    }    
  }
  //[array release];
  [self.companyTableView reloadData];
 
}
      


//[0]  (null)  @"error" : @"child \"symbols\" fails because [\"symbols\" is not allowed to be empty]"
#pragma mark Optional Delegate Methods

-(void)stockFetchDidFailWithError:(NSError *)error {
  NSLog(@"Couldn't fetch stock price, this is a description of the error:%@", error.localizedDescription);
  //do some sort of error handling here
}

-(void)stockFetchDidStart {
  NSLog(@"Initiating stock fetch...");
  //could start an activity indicator here
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
   // [self.dataAccessObject.companyList removeObjectAtIndex:indexPath.row];
    [self.dataAccessObject deleteCompany: (NSInteger*)(indexPath.row)];
    [self.companyTableView  reloadData];
    if (self.companyList.count > 0) {
      self.companyTableView.hidden = NO;
    } else {
      self.companyTableView.hidden = YES;
    }
  }
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
  Company * company = [self.dataAccessObject.companyList objectAtIndex:fromIndexPath.row];
  [self.dataAccessObject.companyList removeObjectAtIndex:fromIndexPath.row];
  [self.dataAccessObject.companyList insertObject:company atIndex:toIndexPath.row];
  [self.companyTableView  moveRowAtIndexPath:fromIndexPath toIndexPath:toIndexPath];
  [self.companyTableView  endUpdates];
  
}



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
  if (self.companyTableView .isEditing) {
    self.companyEditVC = [[[CompanyEditVC alloc] init] autorelease];
    self.companyEditVC.deleteIndex = (NSInteger*) (indexPath.row);
    [self.navigationController pushViewController:self.companyEditVC animated:true];
   
  } else {
    self.productViewController = [[[ProductVC alloc]init] autorelease];
    Company* company = [self.dataAccessObject.companyList objectAtIndex:indexPath.row];
    self.productViewController.company = company;
    self.productViewController.companyAddIndex = (NSInteger*) indexPath.row;
    [self.navigationController
     pushViewController:self.productViewController
     animated:YES];
  }
  
  
}

- (void)dealloc {
  [_productViewController release];
  _productViewController = nil;
  [_twitterProducts release];
  _productViewController = nil;
  [_stockPrices release];
  _stockPrices = nil;
  [_teslaProducts release];
  _teslaProducts = nil;
  [_companyList release];
  _companyList = nil;
  [_appleProducts release];
  _appleProducts = nil;
  [_dataAccessObject release];
  _dataAccessObject = nil;
  [_companyEditVC release];
  _companyEditVC = nil;
  [_companyTableView release];
  _companyTableView = nil;
  [_companyAddViewController release];
  _companyAddViewController = nil;
  [_stockFetcher release];
  _stockFetcher  = nil;
  [_googleProducts release];
  _googleProducts = nil;
  
  [super dealloc];
}
@end

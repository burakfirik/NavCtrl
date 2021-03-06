

#import "CompanyDao.h"
#import "CompanyData+CoreDataClass.h"
#import "ProductData+CoreDataClass.h"

@implementation CompanyDao

+(id) sharedManager {
  static CompanyDao * sharedManager = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    
    sharedManager = [[self alloc] init];
    sharedManager.navControllerAppDelegate = (NavControllerAppDelegate *)[[UIApplication sharedApplication] delegate];
    sharedManager.context = [sharedManager.navControllerAppDelegate managedObjectContext];
    sharedManager.request = [NSFetchRequest fetchRequestWithEntityName:@"CompanyData"];
    sharedManager.companyDataList = [[[NSMutableArray alloc] initWithArray:[sharedManager.context executeFetchRequest:sharedManager.request error:nil]] autorelease];
    
    if (sharedManager.companyDataList.count) {
      [sharedManager loadCompaniesFromCoreData];
    } else {
      [sharedManager createCompanyAndProduct];
    }
  });
  return sharedManager;
}

-(void) createCompanyAndProduct {
  Product* pixel = [[[Product alloc] initName:@"Pixel" productURL:@"https:store.google.com/product/pixel_phone" productImageURL:@"https://i.imgur.com/m6gspIF.jpg"] autorelease];
  
  ProductData *pixelData = [NSEntityDescription insertNewObjectForEntityForName:@"ProductData" inManagedObjectContext:self.context];
  pixelData.productName = @"Pixel";
  pixelData.productURL = @"https:store.google.com/product/pixel_phone";
  pixelData.productImageURL = @"https://i.imgur.com/m6gspIF.jpg";
  
  Product* nexus = [[[Product alloc] initName:@"Nexus" productURL:@"https://www.google.com/nexus/" productImageURL:@"https://i.imgur.com/uqaQWsd.jpg"] autorelease];
  ProductData *nexusData = [NSEntityDescription insertNewObjectForEntityForName:@"ProductData" inManagedObjectContext:self.context];
  nexusData.productName = @"Nexus";
  nexusData.productURL = @"https://www.google.com/nexus/";
  nexusData.productImageURL = @"https://i.imgur.com/uqaQWsd.jpg";
  
  Product* dream = [[[Product alloc] initName:@"Daydream Device" productURL:@"https://vr.google.com/daydream/" productImageURL:@"https://i.imgur.com/Mq4d6XN.jpg"] autorelease];
  ProductData *dreamData = [NSEntityDescription insertNewObjectForEntityForName:@"ProductData" inManagedObjectContext:self.context];
  dreamData.productName = @"Daydream Device";
  dreamData.productURL = @"https://vr.google.com/daydream/";
  dreamData.productImageURL = @"https://i.imgur.com/Mq4d6XN.jpg";
  
  
  NSMutableArray *prod = [[[NSMutableArray alloc] initWithObjects:pixel, nexus, dream, nil] autorelease];
  Company *g = [[[Company alloc] initName:@"Google" logo:@"https://i.imgur.com/0mNt3ax.png" products: prod stock:@"GOOG"] autorelease];
  CompanyData *companyG = [NSEntityDescription insertNewObjectForEntityForName:@"CompanyData" inManagedObjectContext:self.context];
  
  companyG.name = g.name;
  companyG.logo = @"https://i.imgur.com/0mNt3ax.png";
  companyG.stock = @"GOOG";
  
  companyG.products = [[[NSSet alloc] initWithObjects:pixelData,nexusData,dreamData, nil] autorelease];
  
  Product* models = [[[Product alloc] initName:@"Model S" productURL:@"https://www.tesla.com/models" productImageURL:@"https://i.imgur.com/gNuBMw8.png"] autorelease];
  
  ProductData *modelsData = [NSEntityDescription insertNewObjectForEntityForName:@"ProductData" inManagedObjectContext:self.context];
  modelsData.productName = models.productName;
  modelsData.productURL = models.productURL;
  modelsData.productImageURL = models.productImageURL;
  
  Product* modely = [[[Product alloc] initName:@"Model Y" productURL:@"https://www.tesla.com/models" productImageURL:@"https://i.imgur.com/ptbOkTl.png"] autorelease];
  ProductData *modelyData = [NSEntityDescription insertNewObjectForEntityForName:@"ProductData" inManagedObjectContext:self.context];
  modelyData.productName = modely.productName;
  modelyData.productURL = modely.productURL;
  modelyData.productImageURL = modely.productImageURL;
  
  Product* truck = [[[Product alloc] initName:@"Semi" productURL:@"https://www.tesla.com/semi" productImageURL:@"https://i.imgur.com/cG8VCPf.png"] autorelease];
  ProductData *truckData = [NSEntityDescription insertNewObjectForEntityForName:@"ProductData" inManagedObjectContext:self.context];
  truckData.productName = truck.productName;
  truckData.productURL = truck.productURL;
  truckData.productImageURL = truck.productImageURL;
  NSMutableArray *teslaProd = [[[NSMutableArray alloc] initWithObjects:models, modely, truck, nil] autorelease];
  Company *tesla = [[[Company alloc] initName:@"Tesla" logo:@"https://i.imgur.com/PX6Xpao.png" products:teslaProd stock:@"TSLA"] autorelease];
  CompanyData *companyT = [NSEntityDescription insertNewObjectForEntityForName:@"CompanyData" inManagedObjectContext:self.context];
  
  companyT.name = tesla.name;
  companyT.logo = @"https://i.imgur.com/PX6Xpao.png";
  companyT.stock = @"TSLA";
  companyT.products = [[[NSSet alloc] initWithObjects:modelsData, modelyData,truckData, nil] autorelease];
  
  Product* ipad = [[[Product alloc] initName:@"iPad" productURL:@"http://www.apple.com/ipad/" productImageURL:@"https://i.imgur.com/7sLcXKC.png"] autorelease];
  ProductData *ipadData = [NSEntityDescription insertNewObjectForEntityForName:@"ProductData" inManagedObjectContext:self.context];
  ipadData.productName = ipad.productName;
  ipadData.productURL = ipad.productURL;
  ipadData.productImageURL = ipad.productImageURL;
  
  
  Product* ipod = [[[Product alloc] initName:@"ipod Touch" productURL:@"http://www.apple.com/ipod/" productImageURL:@"https://i.imgur.com/7sLcXKC.png"] autorelease];
  ProductData *ipodData = [NSEntityDescription insertNewObjectForEntityForName:@"ProductData" inManagedObjectContext:self.context];
  ipodData.productName = ipod.productName;
  ipodData.productURL = ipod.productURL;
  ipodData.productImageURL = ipod.productImageURL;
  
  Product* iphone = [[[Product alloc] initName:@"iPhone" productURL:@"http://www.apple.com/iphone/" productImageURL:@"https://i.imgur.com/7sLcXKC.png"] autorelease];
  ProductData *iphoneData = [NSEntityDescription insertNewObjectForEntityForName:@"ProductData" inManagedObjectContext:self.context];
  iphoneData.productName = iphone.productName;
  iphoneData.productURL = iphone.productURL;
  iphoneData.productImageURL = iphone.productImageURL;
  NSMutableArray *appleProd = [[[NSMutableArray alloc] initWithObjects:ipad, ipod, iphone, nil] autorelease];
  Company *apple = [[[Company alloc] initName:@"Apple" logo:@"https://i.imgur.com/sfAbBdz.png" products:appleProd stock: @"AAPL"] autorelease];
  ProductData *appleData = [NSEntityDescription insertNewObjectForEntityForName:@"ProductData" inManagedObjectContext:self.context];
  appleData.productName = ipad.productName;
  appleData.productURL = iphone.productURL;
  appleData.productImageURL = iphone.productImageURL;
  CompanyData *companyA = [NSEntityDescription insertNewObjectForEntityForName:@"CompanyData" inManagedObjectContext:self.context];
  companyA.name = apple.name;
  companyA.logo = @"https://i.imgur.com/sfAbBdz.png";
  companyA.stock = @"AAPL";
  companyA.products = [[[NSSet alloc] initWithObjects:ipadData, ipodData, iphoneData, nil] autorelease];
  
  _companyList = [[[NSMutableArray alloc] initWithObjects:g,apple,tesla, nil] autorelease];
  self.companyDataList = [[[NSMutableArray alloc] initWithObjects:companyG, companyA,companyT, nil] autorelease];
  [self.navControllerAppDelegate saveContext];
}


-(void) editCompany:compName stock:(NSString*)compStock compURL:(NSString*)compImgURL deleteAt: (NSInteger*)deleteIndex {
  Company *companyToEdit = [self.companyList objectAtIndex: (int)deleteIndex] ;
  companyToEdit.name = compName;
  companyToEdit.stockTick = compStock;
  companyToEdit.logoURL = compImgURL;
  
  CompanyData *companyEditData = [self.companyDataList objectAtIndex:(int)deleteIndex];
  companyEditData.name = compName;
  companyEditData.stock = compStock;
  companyEditData.logo = compImgURL;
  [self.navControllerAppDelegate saveContext];
}

-(void) deleteCompany: (NSInteger*) deleteCompanyIndex {
  [self.companyList removeObjectAtIndex:(int)deleteCompanyIndex];
  [self.context deleteObject:[self.companyDataList objectAtIndex:(int)deleteCompanyIndex]];
  [self.companyDataList removeObjectAtIndex:(int)deleteCompanyIndex];
  [self.navControllerAppDelegate saveContext];
}

-(void) addProductToCompany:(NSInteger*)companyAddIndex product: (Product*)prod {
  Company *company = [self.companyList objectAtIndex:(int)companyAddIndex];
  [company.products addObject:prod];
  
  
  ProductData *newProduct = [NSEntityDescription insertNewObjectForEntityForName:@"ProductData" inManagedObjectContext:self.context];
  newProduct.productName = prod.productName;
  newProduct.productURL = prod.productURL;
  newProduct.productImageURL = prod.productImageURL;
  CompanyData *companyToInsert = [self.companyDataList objectAtIndex:(int)companyAddIndex];
  companyToInsert.products = [companyToInsert.products setByAddingObject:newProduct];
  [self.navControllerAppDelegate saveContext];
}

-(void) editProduct: (NSInteger*)companyEditIndex prodIndex: (NSInteger*)productEditIndex name: (NSString*)prodName url:(NSString*)prodURL imgURL: (NSString*)prodImgURL {
  Product *productToEdit = [[self.companyList objectAtIndex:(int)companyEditIndex].products objectAtIndex:(int)productEditIndex];
  productToEdit.productName = prodName;
  productToEdit.productImageURL = prodImgURL;
  CompanyData *companyData = [self.companyDataList objectAtIndex:(int)companyEditIndex];
  NSArray* productArray = [companyData.products  allObjects];
  ProductData *productToEditData = [productArray objectAtIndex:(int)productEditIndex];
  productToEditData.productName = prodName;
  productToEditData.productURL = prodURL;
  productToEditData.productImageURL = prodImgURL;
  [self.navControllerAppDelegate saveContext];
}

-(void) addNewCompany: (NSString*)comName stockTick:(NSString*)comStock downloadURL:(NSString*)compImgURL {
  Company *newCompany = [[[Company alloc] initWithName:comName stockTick:comStock downloadURL:compImgURL] autorelease];
  [self.companyList addObject:newCompany];
  CompanyData *companyToAdd = [NSEntityDescription insertNewObjectForEntityForName:@"CompanyData" inManagedObjectContext:_context];
  [self.companyDataList addObject:companyToAdd];
  companyToAdd.name = comName;
  companyToAdd.logo = compImgURL;
  companyToAdd.stock = comStock;
  companyToAdd.products = [[[NSSet<ProductData*> alloc] init] autorelease];
  [_navControllerAppDelegate saveContext];
}

-(void)removeProduct: (NSInteger*)companyAddIndex productIndex: (NSInteger*)prodIndex {
  [[self.companyList objectAtIndex:(int)companyAddIndex].products removeObjectAtIndex:(int)prodIndex];
  CompanyData *companyData = [self.companyDataList objectAtIndex:(int)companyAddIndex];
  NSArray* productArray = [companyData.products  allObjects];
  ProductData *productToDelete = [productArray objectAtIndex:(int)prodIndex];
  [[[self.companyDataList objectAtIndex:(int)companyAddIndex] products] removeObject:productToDelete];
  [self.context deleteObject:[productArray objectAtIndex:(int)prodIndex]];
  [self.navControllerAppDelegate saveContext];
}

-(void)undo{
 // [self.companyList removeAllObjects];
  dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
    [self.context undo];
    [self.navControllerAppDelegate saveContext];
    self.companyDataList = [[[NSMutableArray alloc] initWithArray:[self.context executeFetchRequest:self.request error:nil]] autorelease];
    dispatch_async(dispatch_get_main_queue(), ^(void){
      [self loadCompaniesFromCoreData];
      [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadCompanyVCTable" object:nil];
      
    });
  });
}

-(void)redo{
  // [self.companyList removeAllObjects];
  dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
    [self.context redo];
    [self.navControllerAppDelegate saveContext];
    self.companyDataList = [[[NSMutableArray alloc] initWithArray:[self.context executeFetchRequest:self.request error:nil]] autorelease];
    dispatch_async(dispatch_get_main_queue(), ^(void){
      [self loadCompaniesFromCoreData];
      [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadCompanyVC" object:nil];
      
    });
  });
}

-(void)loadCompaniesFromCoreData{
  
  if(_companyList){
    [_companyList removeAllObjects];
  }
  else {
    _companyList = [[NSMutableArray alloc] init];
  }
  
  for (CompanyData *existingCompany in _companyDataList) {
    Company *companyToAdd = [[[Company alloc] initWithName:existingCompany.name stockTick:existingCompany.stock downloadURL:existingCompany.logo] autorelease];
    companyToAdd.products = [[[NSMutableArray alloc] init] autorelease];
    for (ProductData *product in existingCompany.products) {
      Product *productToAdd = [[[Product alloc] initName:product.productName productURL:product.productURL productImageURL:product.productImageURL] autorelease];
      [companyToAdd.products addObject:productToAdd];
    }
    [_companyList addObject:companyToAdd];
  }
}

- (void)dealloc
{
  [_stockArray release];
  _stockArray = nil;
  [_request release];
  _request = nil;
  [_navControllerAppDelegate release];
  _navControllerAppDelegate = nil;
  [_companyDataList release];
  _companyDataList = nil;
  [_companyList release];
  _companyList = nil;
  [_objectModel release];
  _objectModel = nil;
  [_context  release];
  _stockArray = nil;
  [super  dealloc];
}

@end

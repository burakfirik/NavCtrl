

#import "CompanyDao.h"

@implementation CompanyDao

+(id) sharedManager {
  static CompanyDao * sharedManager = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{

    sharedManager = [[self alloc] init];
    sharedManager.navControllerAppDelegate = (NavControllerAppDelegate *)[[UIApplication sharedApplication] delegate];
    sharedManager.context = [sharedManager.navControllerAppDelegate managedObjectContext];
    sharedManager.request = [NSFetchRequest fetchRequestWithEntityName:@"CompanyData"];
    sharedManager.companyListManaged = [[NSMutableArray alloc] initWithArray:[sharedManager.context executeFetchRequest:sharedManager.request error:nil]];
    
   if (sharedManager.companyListManaged.count) {
      [sharedManager loadCompaniesFromCoreData];
    } else {
      [sharedManager createCompanyAndProduct];
    }
  });
  return sharedManager;
}

-(void) createCompanyAndProduct {
  

  Product* pixel = [[Product alloc] initName:@"Pixel" productURL:@"https:store.google.com/product/pixel_phone" productImage:@"pixel.jpeg"];
  Product* nexus = [[Product alloc] initName:@"Nexus" productURL:@"https://www.google.com/nexus/" productImage:@"nexus.jpg"];
  Product* dream = [[Product alloc] initName:@"Daydream Device" productURL:@"https://vr.google.com/daydream/" productImage:@"daydream.jpg"];
  Company *g = [[Company alloc] initName:@"Google" logo:@"google.png" products:[[NSMutableArray alloc] initWithObjects:pixel, nexus, dream, nil] stock:@"GOOG"];
  
  Product* models = [[Product alloc] initName:@"Model S" productURL:@"https://www.tesla.com/models" productImage:@"models.jpeg"];
  Product* modely = [[Product alloc] initName:@"Model Y" productURL:@"https://www.tesla.com/models" productImage:@"modely.jpg"];
  Product* truck = [[Product alloc] initName:@"Semi" productURL:@"https://www.tesla.com/semi" productImage:@"truck.jpg"];
 
  Company *tesla = [[Company alloc] initName:@"Tesla" logo:@"tesla.png" products:[[NSMutableArray alloc] initWithObjects:models, modely, truck, nil] stock:@"TSLA"];
  
  
  Product* ipad = [[Product alloc] initName:@"iPad" productURL:@"http://www.apple.com/ipad/" productImage:@"ipad.png"];
  Product* ipod = [[Product alloc] initName:@"ipod Touch" productURL:@"http://www.apple.com/ipod/" productImage:@"ipod.png"];
  Product* iphone = [[Product alloc] initName:@"iPhone" productURL:@"http://www.apple.com/iphone/" productImage:@"iphone.png"];
  Company *apple = [[Company alloc] initName:@"Apple" logo:@"apple.jpg" products:[[NSMutableArray alloc] initWithObjects:ipad, ipod, iphone, nil] stock: @"AAPL"];
  self.companyList = [[NSMutableArray alloc] initWithObjects:g,tesla,apple, nil];
}


-(void) editCompany:compName stock:(NSString*)compStock compURL:(NSString*)compImgURL deleteAt: (NSInteger*)deleteIndex {
  Company *companyToEdit = [self.companyList objectAtIndex: (int)deleteIndex] ;
  companyToEdit.name = compName;
  companyToEdit.stockTick = compStock;
  NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:compImgURL]];
  UIImage *image = [[UIImage alloc] initWithData:imageData];
  if (image != nil) {
    companyToEdit.logo = image;
  } else {
    companyToEdit.logo = [UIImage imageNamed:@"default"];
  }
  
}

-(void) addProductToCompany:(NSInteger*)companyAddIndex product: (Product*)prod {
  Company *company = [self.companyList objectAtIndex:(int)companyAddIndex];
  [company.products addObject:prod];
}

-(void) editProduct: (NSInteger*)companyEditIndex prodIndex: (NSInteger*)productEditIndex name: (NSString*)prodName url:(NSString*)prodURL imgURL: (NSString*)prodImgURL {
  Product *productToEdit = [[self.companyList objectAtIndex:(int)companyEditIndex].products objectAtIndex:(int)productEditIndex];
  productToEdit.productName = prodName;
  NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:prodImgURL]];
  UIImage *image = [[UIImage alloc] initWithData:imageData];
  if (image != nil) {
    productToEdit.productImage = image;
  } else {
    productToEdit.productImage = [UIImage imageNamed:@"default"];
  }
}

-(void)addNewCompany: (Company*)comp {
  [self.companyList addObject:comp];
}

-(void)loadCompaniesFromCoreData{
  self.companyList = [[NSMutableArray alloc] init];
  for (Company *existingCompany in self.companyListManaged) {
    Company *companyToAdd = [[Company alloc] initWithName:existingCompany.name stockTick:existingCompany.stockTick downloadURL:existingCompany.logoURL];
    for (Product *product in existingCompany.products) {
      Product *productToAdd = [[Product alloc] initName:product.productName productURL:product.productURL productImageURL:product.productImageURL];
      [companyToAdd.products addObject:productToAdd];
    }
    [self.companyList addObject:companyToAdd];
  }
}



@end

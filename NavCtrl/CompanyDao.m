

#import "CompanyDao.h"

@implementation CompanyDao

+(id) sharedManager {
  static CompanyDao * sharedManager = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedManager = [[self alloc] init];
    [sharedManager createCompanyAndProduct];
  });
  return sharedManager;
}

-(void) createCompanyAndProduct {
  
  self.companyAdd = NO;
  self.productAdd = NO;
  self.companyEdit = NO;
  self.productEdit = NO;
  
  Product* pixel = [[Product alloc] initName:@"Pixel" productURL:@"https:store.google.com/product/pixel_phone" productImage:@"pixel.jpeg"];
  Product* nexus = [[Product alloc] initName:@"Nexus" productURL:@"https://www.google.com/nexus/" productImage:@"nexus.jpg"];
  Product* dream = [[Product alloc] initName:@"Daydream Device" productURL:@"https://vr.google.com/daydream/" productImage:@"daydream.jpg"];
  Company *g= [[Company alloc] initName:@"Google" logo:@"google.png" products:[[NSMutableArray alloc] initWithObjects:pixel, nexus, dream, nil]];
  
  Product* models = [[Product alloc] initName:@"Model S" productURL:@"https://www.tesla.com/models" productImage:@"models.jpeg"];
  Product* modely = [[Product alloc] initName:@"Model Y" productURL:@"https://www.tesla.com/models" productImage:@"modely.jpg"];
  Product* truck = [[Product alloc] initName:@"Semi" productURL:@"https://www.tesla.com/semi" productImage:@"truck.jpg"];
  Company *tesla = [[Company alloc] initName:@"Tesla" logo:@"tesla.png" products:[[NSMutableArray alloc] initWithObjects:models, modely, truck, nil]];
  
  
  Product* ipad = [[Product alloc] initName:@"iPad" productURL:@"http://www.apple.com/ipad/" productImage:@"ipad.png"];
  Product* ipod = [[Product alloc] initName:@"ipod Touch" productURL:@"http://www.apple.com/ipod/" productImage:@"ipod.png"];
  Product* iphone = [[Product alloc] initName:@"iPhone" productURL:@"http://www.apple.com/iphone/" productImage:@"iphone.png"];
  Company *apple = [[Company alloc] initName:@"Apple" logo:@"apple.jpg" products:[[NSMutableArray alloc] initWithObjects:ipad, ipod, iphone, nil]];
  self.companyList = [[NSMutableArray alloc] initWithObjects:g,tesla,apple, nil];
}


@end

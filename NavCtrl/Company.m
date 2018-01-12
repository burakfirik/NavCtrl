#import "Company.h"

@implementation Company

- (instancetype) initName:(NSString *)nameGiven
                     logo:(NSString *)logoGiven
                 products:(NSMutableArray *)productsGiven
                    stock: (NSString*) stockTick {
  if (self = [super init]) {
    self.name = nameGiven;
    self.logoURL = logoGiven;
    self.products = productsGiven;
    self.stockTick = stockTick;
  }
  return self;
}

-(instancetype) initWithName: (NSString*) name
                   stockTick: (NSString*) stock
                 downloadURL: (NSString*) url {
  
  if (self = [self init]) {
    _name = [name retain];
    _products = [[NSMutableArray alloc] init];
    _logoURL = [url retain];
    _stockTick = [stock retain];
  }
  return self;
}


-(void) editCompany: (NSString *)compName stock: (NSString * )compStock  compURL: (NSString *)compImgURL {
  self.name = compName;
  self.stockTick = compStock;
  
  NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:compImgURL]];
  UIImage *image = [[UIImage alloc] initWithData:imageData];
  if (image != nil) {
    self.logo = image;
  } else {
    self.logo = [UIImage imageNamed:@"default"];
  }
  [imageData release];
  [image release];
}

- (void)dealloc
{
  [_products release];
  _products = nil;
  
  [_logo release];
  _logo = nil;
  [_name release];
  _name = nil;
  [_stockPrice release];
  _stockPrice = nil;
  [_stockTick release];
  _stockTick = nil;
  [_products release];
  _products = nil;
  [_logoURL release];
  _logoURL = nil;
  [_products release];
  _products = nil;
  
  [super dealloc];
}


@end

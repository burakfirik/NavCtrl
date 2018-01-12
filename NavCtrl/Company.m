

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
    self.name = name;
    self.products = [[NSMutableArray alloc] init];
    self.logoURL = url;
    self.stockTick = stock;
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
  [_logo release];
  [_name release];
  [_stockPrice release];
  [_stockTick release];
  [_products release];
  [_logoURL release];
  [_products release];
  
  [super dealloc];
}


@end

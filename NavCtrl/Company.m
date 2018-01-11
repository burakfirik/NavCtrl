

#import "Company.h"


@implementation Company

- (instancetype) initName:(NSString *)nameGiven
                     logo:(NSString *)logoGiven
                 products:(NSMutableArray *)productsGiven
                    stock: (NSString*) stockTick {
  if (self = [super init]) {
    self.name = nameGiven;
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:logoGiven]];
    UIImage *image = [[UIImage alloc] initWithData:imageData];
    if (image != nil) {
      self.logo = image;
    } else {
      self.logo = [UIImage imageNamed:@"default"];
    }
    self.logoURL = logoGiven;
    self.logo = [UIImage imageNamed:logoGiven];
    self.products = productsGiven;
    self.stockTick = stockTick;
  }
  return self;
}

- (instancetype) initName:(NSString *)nameGiven downloadLogo:(id)logoGiven {
  self.name = nameGiven;
  self.logo = logoGiven;
  self.products = [[NSMutableArray alloc] init];
  return self;
}


-(instancetype) initWithName: (NSString*) name
                   stockTick: (NSString*) stock
                 downloadURL: (NSString*) url {
    
    self.name = name;
    self.products = [[NSMutableArray alloc] init];
    self.logoURL = url;
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:url]];
    UIImage *image = [[UIImage alloc] initWithData:imageData];
    if (image != nil) {
      self.logo = image;
    } else {
      self.logo = [UIImage imageNamed:@"default"];
    }
  self.stockTick = stock;
    //self.logo = [UIImage imageNamed:@"google"];
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
}




@end

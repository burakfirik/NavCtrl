

#import "Product.h"

@implementation Product
-(instancetype) initName:(NSString *)givenName
                productURL:(NSString *)givenURL
            productImage:(NSString *)imageInput {
  if (self = [super init]) {
    self.productName = givenName;
    self.productURL = givenURL;
    self.productImage = [UIImage imageNamed:imageInput];
  }
  return self;
  
}

-(instancetype) initName:(NSString *)givenName logo:(UIImage *)productLogo {
  self.productName = givenName;
  self.productImage = productLogo;
  return self;
}

@end

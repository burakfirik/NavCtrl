

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

-(instancetype) initName:(NSString *)givenName
              productURL:(NSString *)givenURL
            productImageURL:(NSString *)productImageURL {
  if (self = [super init]) {
    self.productName = givenName;
    self.productURL = givenURL;
    self.productImageURL = productImageURL;
  }
  return self;
}

-(instancetype) initName:(NSString *)givenName logo:(UIImage *)productLogo {
  self.productName = givenName;
  self.productImage = productLogo;
  return self;
}

-(void) editProduct: (NSString *)newName imgURL: (NSString *) imgUrl{
  self.productName = newName;
  NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:imgUrl]];
  UIImage *image = [[UIImage alloc] initWithData:imageData];
  if (image != nil) {
    self.productImage = image;
  } else {
    self.productImage = [UIImage imageNamed:@"default"];
  }
}
@end

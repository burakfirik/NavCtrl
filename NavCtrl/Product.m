

#import "Product.h"

@implementation Product
-(instancetype) initName:(NSString *)givenName
              productURL:(NSString *)givenURL
         productImageURL:(NSString *)imageURL {
  if (self = [super init]) {
    self.productName = givenName;
    self.productURL = givenURL;
    self.productImageURL = imageURL;
  }
  return self;
}


-(void) editProduct: (NSString *)newName imgURL: (NSString *) imgUrl{
  self.productName = newName;
  self.productImageURL = imgUrl;
}
@end

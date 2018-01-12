

#import "Product.h"

@implementation Product
-(instancetype) initName:(NSString *)givenName
              productURL:(NSString *)givenURL
         productImageURL:(NSString *)imageURL {
  if (self = [super init]) {
    _productName = [givenName retain];;
    _productURL = [givenURL retain];
    _productImageURL = [imageURL retain];
  }
  return self;
}


-(void) editProduct: (NSString *)newName imgURL: (NSString *) imgUrl{
  _productName = [newName retain];
  _productImageURL = [imgUrl retain];
}

- (void)dealloc
{
  [_productImageURL release];
  _productImageURL = nil;
  [_productName release];
   _productName = nil;
  [_productURL release];
   _productURL = nil;
  [super dealloc];
}

@end

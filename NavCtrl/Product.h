

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (nonatomic, retain) NSString* productName;
@property (nonatomic, retain) NSString* productURL;
@property (nonatomic, retain) UIImage* productImage;
@property (nonatomic, retain) NSString* productImageURL;


-(instancetype) initName: (NSString*) givenName
              productURL: (NSString*) givenURL
            productImage: (NSString*) imageInput;

- (instancetype) initName: (NSString*) givenName
                     logo: (UIImage*) productLogo;

-(instancetype) initName:(NSString *)givenName
              productURL:(NSString *)givenURL
         productImageURL:(NSString *)productImageURL;

-(void) editProduct: (NSString *)newName imgURL: (NSString *) url ;

@end

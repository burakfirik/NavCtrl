

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (nonatomic, retain) NSString* productName;
@property (nonatomic, retain) NSString* productURL;
@property (nonatomic, retain) NSString* productImageURL;


-(instancetype) initName:(NSString *)givenName
              productURL:(NSString *)givenURL
         productImageURL:(NSString *)imageURL;

-(void) editProduct: (NSString *)newName imgURL: (NSString *) url ;

@end

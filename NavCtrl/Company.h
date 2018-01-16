

#import <Foundation/Foundation.h>

@interface Company : NSObject

@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) UIImage* logo;
@property (nonatomic, retain) NSMutableArray * products;
@property (nonatomic, retain) NSString* stockTick;
@property (nonatomic, retain) NSString* stockPrice;
@property (nonatomic, retain) NSString* logoURL;

- (instancetype) initName: (NSString*) name
                     logo: (NSString*) logo
                 products: (NSMutableArray*) products
                    stock: (NSString*) stockTick;


-(instancetype) initWithName: (NSString*) name
                stockTick: (NSString*) stock
                downloadURL: (NSString*) url;


@end

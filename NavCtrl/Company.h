

#import <Foundation/Foundation.h>

@interface Company : NSObject

@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) UIImage* logo;
@property (nonatomic, retain) NSMutableArray * products;

- (instancetype) initName: (NSString*) name
                     logo: (NSString*) logo
                 products: (NSMutableArray*) products;


-(instancetype) initName: (NSString*) name
            downloadLogo: logo;

-(instancetype) initWithName: (NSString*) name
                stockTick: (NSString*) stock
                downloadURL: (NSString*) url;

@end

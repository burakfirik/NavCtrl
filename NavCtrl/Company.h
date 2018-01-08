

#import <Foundation/Foundation.h>

@interface Company : NSObject

@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) UIImage* logo;
@property (nonatomic, retain) NSMutableArray * products;
@property (nonatomic, retain) NSString* stockTick;


- (instancetype) initName: (NSString*) name
                     logo: (NSString*) logo
                 products: (NSMutableArray*) products
                    stock: (NSString*) stockTick;


-(instancetype) initName: (NSString*) name
            downloadLogo: logo;

-(instancetype) initWithName: (NSString*) name
                stockTick: (NSString*) stock
                downloadURL: (NSString*) url;

-(void) editCompany: (NSString *)compName stock: (NSString * )CompStock  compURL: (NSString *)compImgURL;

@end

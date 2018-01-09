
#import <Foundation/Foundation.h>
#import "Company.h"
#import "Product.h"

@interface CompanyDao : NSObject

@property (retain, nonatomic) NSMutableArray<Company*> * companyList;
@property BOOL companyAdd;
@property BOOL productAdd;
@property BOOL companyEdit;
@property BOOL productEdit;
@property (retain, nonatomic) NSMutableArray * stockArray;

+ (id) sharedManager;
-(void) createCompanyAndProduct;
-(void) editCompany:compName stock:(NSString*)compStock compURL:(NSString*)compImgURL deleteAt: (NSInteger*)deleteIndex;
-(void) addProductToCompany:(NSInteger*)companyAddIndex product: (Product*)prod;
-(void) editProduct: (NSInteger*)companyEditIndex prodIndex: (NSInteger*)productEditIndex name: (NSString*)prodName url:(NSString*)prodURL imgURL: (NSString*)prodImgURL;

@end

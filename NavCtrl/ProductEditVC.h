

#import <UIKit/UIKit.h>
#import "Product.h"
#import "CompanyDao.h"
#import "Company.h"
@interface ProductEditVC : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) CompanyDao* dataAccessObject;
@property (nonatomic, retain) NSMutableArray *companyList;
@property (nonatomic, retain) Company *company;
@property (nonatomic, assign) NSInteger *productEditIndex;
@property (nonatomic, assign) NSInteger *companyEditIndex;

@end

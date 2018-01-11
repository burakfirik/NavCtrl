
#import <UIKit/UIKit.h>
#import "Product.h"
#import "CompanyDao.h"
#import "Company.h"

@interface ProductAddVC : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) CompanyDao* dataAccessObject;
@property (nonatomic, retain) NSMutableArray *companyList;
@property (nonatomic, retain) Company *company;
@property (nonatomic) NSInteger* companyAddIndex;

@end

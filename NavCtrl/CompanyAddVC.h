

#import <UIKit/UIKit.h>
#import "CompanyDao.h"
#import "Company.h"

@interface CompanyAddVC : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) CompanyDao* dataAccessObject;
@property (nonatomic, retain) NSMutableArray *companyList;

-(void) cancelButtonTapped;
-(void) saveButtonTapped;


@end

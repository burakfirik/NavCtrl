

#import <UIKit/UIKit.h>
//#import "ProductDetailViewController.h"
#import "Company.h"
#import "CompanyDao.h"
#import "ProductEditVC.h"

@interface ProductVC : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain) NSMutableArray *products;
@property (nonatomic, retain) UITableView *productTableView;
@property (nonatomic, retain) ProductEditVC *productEditViewController;
@property (nonatomic, retain) Company* company;
@property (nonatomic, retain) CompanyDao* dataAccessObject;
@property (nonatomic, assign) NSInteger* companyAddIndex;


@end

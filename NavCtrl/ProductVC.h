

#import <UIKit/UIKit.h>
//#import "ProductDetailViewController.h"
#import "Company.h"
#import "CompanyDao.h"

@interface ProductVC : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain) NSMutableArray *products;
@property (nonatomic, retain) UITableView *productTableView;
@property (nonatomic, retain) Company* company;
@property (nonatomic, retain) CompanyDao* dataAccessObject;


@end

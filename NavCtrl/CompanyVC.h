

#import <UIKit/UIKit.h>
#import "ProductVC.h"
#import "CompanyDao.h"
#import "CompanyAddVC.h"


@interface CompanyVC : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) CompanyDao * dataAccessObject;

@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *companyList;
@property (nonatomic, retain) ProductVC *productViewController;
@property (nonatomic, retain) CompanyAddVC *companyAddViewController;


@property (nonatomic, retain) NSMutableArray* appleProducts;
@property (nonatomic, retain) NSMutableArray* teslaProducts;
@property (nonatomic, retain) NSMutableArray* googleProducts;
@property (nonatomic, retain) NSMutableArray* twitterProducts;

@end

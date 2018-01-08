

#import <UIKit/UIKit.h>
#import "ProductVC.h"
#import "CompanyDao.h"
#import "CompanyAddVC.h"
#import "CompanyEditVC.h"
#import "StockFetcherDelegate.h"

@interface CompanyVC : UIViewController<UITableViewDelegate, UITableViewDataSource, StockFetcherDelegate>

@property (nonatomic, retain) CompanyDao * dataAccessObject;
@property (nonatomic, retain) UITableView *companyTableView;
@property (nonatomic, retain) NSMutableArray *companyList;
@property (nonatomic, retain) ProductVC *productViewController;
@property (nonatomic, retain) CompanyAddVC *companyAddViewController;
@property (nonatomic, retain) CompanyEditVC *companyEditVC;


@property (nonatomic, retain) NSMutableArray* appleProducts;
@property (nonatomic, retain) NSMutableArray* teslaProducts;
@property (nonatomic, retain) NSMutableArray* googleProducts;
@property (nonatomic, retain) NSMutableArray* twitterProducts;

@end

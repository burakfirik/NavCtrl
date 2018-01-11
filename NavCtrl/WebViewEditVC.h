

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "Product.h"
#import "CompanyDao.h"
#import "Company.h"

@interface WebViewEditVC : UIViewController<WKNavigationDelegate,WKUIDelegate>

@property (nonatomic, strong) CompanyDao* dataAccessObject;
@property (nonatomic, retain) NSMutableArray *companyList;
@property (nonatomic, retain) Company *company;
@property (nonatomic, assign) NSNumber *deleteIndex;
@property (nonatomic, assign) NSInteger* productIndex;
@property (nonatomic, assign) NSInteger* companyIndex;

@property(strong,nonatomic) WKWebView *webView;
@property (strong, nonatomic) NSString *productURL;



@end

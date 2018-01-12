
#import "WebViewEditVC.h"
#import "ProductEditVC.h"

@interface WebViewEditVC ()

@end

@implementation WebViewEditVC

- (void)viewDidLoad {
  [super viewDidLoad];
  UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(editButtonPressed)];
  self.navigationItem.rightBarButtonItem = editButton;
  [editButton release];
  
}

-(void) editButtonPressed {
  ProductEditVC *productEditVC = [[ProductEditVC alloc] init];
  productEditVC.productEditIndex = self.productIndex;
  productEditVC.companyEditIndex = self.companyIndex;
  productEditVC.company = self.company;
  [self.navigationController pushViewController:productEditVC animated:true];
  [productEditVC release];
}

-(void) viewWillAppear:(BOOL)animated {
  [super viewWillAppear:true];
   NSURL *url = [NSURL URLWithString:self.productURL];
  if ([UIApplication.sharedApplication canOpenURL:url] ) {
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    _webView = [[WKWebView alloc]init] ;
    
    _webView.UIDelegate = self;
    _webView.navigationDelegate = self;
    [_webView loadRequest:request];
    _webView.frame = CGRectMake(0,self.navigationController.navigationBar.bounds.size.height,self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:_webView];
    [self addWebViewConstraint];
  }
  
}

-(void)viewDidAppear:(BOOL)animated {
  [super  viewDidAppear:true];
}

-(void) addWebViewConstraint {
  NSLayoutConstraint *webViewTopConstraint = [NSLayoutConstraint constraintWithItem:self.webView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:self.navigationController.navigationBar.bounds.size.height];
  
  NSLayoutConstraint *webViewBottomConstraint = [NSLayoutConstraint constraintWithItem:self.webView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
  
  NSLayoutConstraint *webViewLeadingConstraint = [NSLayoutConstraint constraintWithItem:self.webView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
  
  NSLayoutConstraint *webViewTrainlingConstraint = [NSLayoutConstraint constraintWithItem:self.webView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
  [NSLayoutConstraint activateConstraints:@[webViewTopConstraint, webViewBottomConstraint, webViewLeadingConstraint, webViewTrainlingConstraint]];
  
  
}

- (void)dealloc
{
  [_productURL release];
  [_company release];
  [_companyList release];
  [_webView release];
  [_dataAccessObject release];
  [super  dealloc];
}

@end

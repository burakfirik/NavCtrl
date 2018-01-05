

#import "ProductWebVC.h"
#import <WebKit/WebKit.h>

@interface ProductWebVC ()

@end

@implementation ProductWebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  WKWebViewConfiguration *conf = [[WKWebViewConfiguration alloc] init];
  WKWebView* productView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:conf];
  
  NSMutableURLRequest *req = [[NSMutableURLRequest alloc] init];
  req.URL = [NSURL URLWithString:self.url];
  
  if (req.URL == nil) {
    req.URL = [NSURL URLWithString:@"https://www.apple.com"];
  }

  NSURLRequest *productRequest = [NSURLRequest requestWithURL:req.URL];
  
  [productView loadRequest:productRequest];
  [self.view addSubview:productView];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

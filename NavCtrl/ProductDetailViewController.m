//
//  ProductDetailViewController.m
//  NavCtrl
//
//  Created by Burak Firik on 1/3/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import "ProductDetailViewController.h"

@interface ProductDetailViewController ()

@end

@implementation ProductDetailViewController

@synthesize webView;
@synthesize webConfiguration;



- (void)viewDidLoad {
    [super viewDidLoad];
  webConfiguration = [[WKWebViewConfiguration alloc] init];
  webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - 20 ) configuration:webConfiguration];
  webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  webView.navigationDelegate = self;
  [self.view addSubview:webView];
  
  //NSString *google = @"http://www.google.com";
  NSURL *url = [[NSURL alloc] initWithString:self.productURL];
  NSURLRequest *nsrequest = [NSURLRequest requestWithURL:url];
  [webView loadRequest:nsrequest];
  
  
    // Do any additional setup after loading the view from its nib.
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

- (void)dealloc {
    [webView release];
    [super dealloc];
}
@end

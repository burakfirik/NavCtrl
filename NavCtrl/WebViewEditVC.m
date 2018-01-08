//
//  WebViewEditVC.m
//  NavCtrl
//
//  Created by Burak Firik on 1/8/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import "WebViewEditVC.h"
#import "ProductEditVC.h"

@interface WebViewEditVC ()

@end

@implementation WebViewEditVC

- (void)viewDidLoad {
  [super viewDidLoad];
  UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(editButtonPressed)];
  self.navigationItem.rightBarButtonItem = editButton;
  
  NSURL *url = [NSURL URLWithString:self.productURL];
  NSURLRequest *request = [NSURLRequest requestWithURL: url];
  self.webView = [[WKWebView alloc]init] ;
  self.webView.UIDelegate = self;
  self.webView.navigationDelegate = self;
  [self.webView loadRequest:request];
  self.webView.frame = CGRectMake(0, self.navigationController.navigationBar.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height);
  
 
  
  
  [self.view addSubview:self.webView];
}

-(void) editButtonPressed {
  ProductEditVC *productEditVC = [[ProductEditVC alloc] init];
  productEditVC.company = self.company;
  productEditVC.deleteIndex = [NSNumber numberWithInt:self.deleteIndex.intValue];
  [self.navigationController pushViewController:productEditVC animated:true];
}

-(void) viewWillAppear:(BOOL)animated {
//   [self.navigationItem.rightBarButtonItem set];
}

-(void)viewDidAppear:(BOOL)animated {
  
 
  [self addWebViewConstraint];
}

-(void) addWebViewConstraint {
  NSLayoutConstraint *webViewTopConstraint = [NSLayoutConstraint constraintWithItem:self.webView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.navigationController.navigationBar attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
  
  NSLayoutConstraint *webViewBottomConstraint = [NSLayoutConstraint constraintWithItem:self.webView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
  
  NSLayoutConstraint *webViewLeadingConstraint = [NSLayoutConstraint constraintWithItem:self.webView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
  
  NSLayoutConstraint *webViewTrainlingConstraint = [NSLayoutConstraint constraintWithItem:self.webView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
  
  
  
  [NSLayoutConstraint activateConstraints:@[webViewTopConstraint, webViewBottomConstraint, webViewLeadingConstraint, webViewTrainlingConstraint]];
  
  
}



@end

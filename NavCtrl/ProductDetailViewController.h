//
//  ProductDetailViewController.h
//  NavCtrl
//
//  Created by Burak Firik on 1/3/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface ProductDetailViewController : UIViewController
@property (retain, nonatomic) IBOutlet WKWebView *webView;
@property (nonatomic, retain) WKWebViewConfiguration *webConfiguration;
@property (nonatomic, retain) NSString *productURL;
@end

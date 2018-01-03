//
//  ProductVC.h
//  NavCtrl
//
//  Created by Jesse Sahli on 2/7/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductDetailViewController.h"
#import "Company.h"
#import "CompanyDao.h"

@interface ProductVC : UIViewController<UITableViewDelegate, UITableViewDataSource>


@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *products;
@property (nonatomic, retain) Company* company;
@property (nonatomic, retain) CompanyDao* dataAccessObject;


@end

//
//  StockVC.h
//  NavCtrl
//
//  Created by Burak Firik on 1/8/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StockVC : UIViewController

-(void)setStockPrice;
@property (nonatomic, assign) UITableView *companyTableView;
@end

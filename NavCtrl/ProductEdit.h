//
//  EditProductVC.h
//  NavCtrl
//
//  Created by Burak Firik on 1/7/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "CompanyDao.h"
#import "Company.h"
@interface ProductEditVC : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) CompanyDao* dataAccessObject;
@property (nonatomic, retain) NSMutableArray *companyList;
@property (nonatomic, retain) Company *company;
@property (nonatomic, assign) NSNumber *deleteIndex;

@end

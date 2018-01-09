//
//  CompanyEditVC.h
//  NavCtrl
//
//  Created by Burak Firik on 1/8/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "CompanyDao.h"
#import "Company.h"

@interface CompanyEditVC : UIViewController <UITextFieldDelegate>
@property (nonatomic, strong) CompanyDao* dataAccessObject;
@property (nonatomic, retain) Company *company;
@property (nonatomic, assign) NSInteger* deleteIndex;

@end

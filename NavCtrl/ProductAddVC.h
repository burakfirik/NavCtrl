//
//  ProductAddVC.h
//  NavCtrl
//
//  Created by Aditya Narayan on 1/5/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "CompanyDao.h"
#import "Company.h"

@interface ProductAddVC : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) CompanyDao* dataAccessObject;
@property (nonatomic, retain) NSMutableArray *companyList;
@property (nonatomic, retain) Company *company;


-(void) cancelButtonTapped;
-(void) saveButtonTapped;


@end

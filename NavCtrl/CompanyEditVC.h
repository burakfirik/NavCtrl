//
//  EditCompanyVC.h
//  NavCtrl
//
//  Created by Burak Firik on 1/6/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Company.h"
#import "CompanyDao.h"

@interface EditCompanyVC : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) CompanyDao* dataAccessObject;
@property (nonatomic, retain) NSMutableArray *companyList;
@property (nonatomic, retain) Company *company;


-(void) cancelButtonTapped;
-(void) saveButtonTapped;


@end

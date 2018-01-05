//
//  CompanyAddVC.h
//  NavCtrl
//
//  Created by Aditya Narayan on 1/5/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompanyDao.h"
#import "Company.h"

@interface CompanyAddVC : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) CompanyDao* dataAccessObject;
@property (nonatomic, retain) NSMutableArray *companyList;



-(void) cancelButtonTapped;
-(void) saveButtonTapped;


@end

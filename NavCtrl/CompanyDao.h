//
//  CompanyDao.h
//  NavCtrl
//
//  Created by Burak Firik on 1/3/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Company.h"
#import "Product.h"

@interface CompanyDao : NSObject

@property (retain, nonatomic) NSMutableArray<Company*> * companyList;
@property BOOL companyAdd;
@property BOOL productAdd;
@property BOOL companyEdit;
@property BOOL productEdit;
@property (retain, nonatomic) NSMutableArray * stockArray;


+ (id) sharedManager;
-(void) createCompanyAndProduct;

@end

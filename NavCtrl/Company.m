//
//  Company.m
//  NavCtrl
//
//  Created by Burak Firik on 1/3/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import "Company.h"

@implementation Company

- (instancetype) initName:(NSString *)nameGiven
                     logo:(NSString *)logoGiven
                 products:(NSMutableArray *)productsGiven {
  if (self = [super init]) {
    self.name = nameGiven;
    self.logo = [UIImage imageNamed:logoGiven];
    self.products = productsGiven;
  }
  return self;
}

- (instancetype) initName:(NSString *)nameGiven downloadLogo:(id)logoGiven {
  self.name = nameGiven;
  self.logo = logoGiven;
  self.products = [[NSMutableArray alloc] init];
  return self;
}


@end

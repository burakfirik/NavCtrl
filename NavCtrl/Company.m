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
                 products:(NSMutableArray *)productsGiven
                    stock: (NSString*) stockTick {
  if (self = [super init]) {
    self.name = nameGiven;
    self.logo = [UIImage imageNamed:logoGiven];
    self.products = productsGiven;
    self.stockTick = stockTick;
  }
  return self;
}

- (instancetype) initName:(NSString *)nameGiven downloadLogo:(id)logoGiven {
  self.name = nameGiven;
  self.logo = logoGiven;
  self.products = [[NSMutableArray alloc] init];
  return self;
}


-(instancetype) initWithName: (NSString*) name
                   stockTick: (NSString*) stock
                 downloadURL: (NSString*) url {
    
    self.name = name;
    self.products = [[NSMutableArray alloc] init];
    self.logo = [UIImage imageNamed:@"google"];
    return self;
}




@end

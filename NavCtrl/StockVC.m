//
//  StockVC.m
//  NavCtrl
//
//  Created by Burak Firik on 1/8/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import "StockVC.h"
#import "CompanyDao.h"



@implementation StockVC

- (void) setStockPrice{
  NSString * apiKey = @"SPHRPVAD4UQ9C5EZ";
  NSMutableString *tickers = [[NSMutableString alloc] init];
  NSMutableArray* companyList = [[CompanyDao sharedManager] companyList];
  for (int i = 0; i < companyList.count; i++) {
    Company* currentCompany = companyList[i];
    if (i == companyList.count - 1){
      if ([currentCompany.stockTick isEqualToString:@""]){
        [tickers appendFormat: @""];
      } else {
        [tickers appendFormat:@"%@", currentCompany.stockTick];
      }
    } else {
      if ([currentCompany.stockTick isEqualToString:@""]){
        [tickers appendFormat: @"N/a"];
      } else {
        [tickers appendFormat:@"%@+", currentCompany.stockTick];
      }
    }
  }
 

  NSString *url= [NSString stringWithFormat: @"https://www.alphavantage.co/query?apikey=SPHRPVAD4UQ9C5EZ&function=TIME_SERIES_DAILY_ADJUSTED&symbol=TSLA",@""];
  NSURL *urlone = [NSURL URLWithString:url];
  NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession]
                                        dataTaskWithURL:urlone completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                          NSString *responseData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                          
                                          if(error){
                                            
                                          } else {
                                            NSArray *seporetByCompany = [responseData componentsSeparatedByString:@"\n"];
                                            for (int i = 0; i < seporetByCompany.count-1; i++) {
                                              Company* currentCompany = companyList[i];
                                              NSArray *getPrice = [seporetByCompany[i] componentsSeparatedByString:@","];
                                              currentCompany.stockPrice = getPrice[getPrice.count - 1];
                                              
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                [self.companyTableView reloadData];
                                              });
                                            }
                                          }
                                        }];
  
  [downloadTask resume];
}
@end

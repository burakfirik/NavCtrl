
#import "StockFetcher.h"

@implementation StockFetcher

//calling delegate methods during the fetching process so that the delegate can respond accordingly

-(void)fetchStockPriceForTicker: (NSString*) ticker {
  
  //responds to selector is necessary for optional methods in our delegate protocol "StockFetcherDelegate", if our delegate does not implement them and we try to call them.. the app will crash
  
  if ([self.delegate respondsToSelector:@selector(stockFetchDidStart)]) {
    [self.delegate stockFetchDidStart];
  }
  NSString *urlString = [NSString stringWithFormat:@"https://ws-api.iextrading.com/1.0/tops?symbols=%@", ticker];
  NSURL *url = [NSURL URLWithString:urlString];
  
  NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    
    if (error) {
      if ([self.delegate respondsToSelector:@selector(stockFetchDidFailWithError:) ]) {
        
        //we are not on the main queue at this point so it is important to dispatch blocks
        dispatch_async(dispatch_get_main_queue(), ^{
          
          //communicate with the delegate that we have failed and give it the error object for further handling
          [self.delegate stockFetchDidFailWithError:error];
        });
      }
    } else {
      
      dispatch_async(dispatch_get_main_queue(), ^{
        NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        [self.delegate stockFetchSuccessWithPriceString:json];
      });
    }
  }];
  //[urlString release];
 
  [task resume];
  
}
- (void)dealloc
{
  [_delegate release];
  [_companyTableView release];
  [super dealloc];
}
@end

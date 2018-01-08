
#import <Foundation/Foundation.h>
#import "StockFetcherDelegate.h"

@interface StockFetcher : NSObject

-(void)fetchStockPriceForTicker: (NSString*) ticker;

@property (retain, nonatomic) id<StockFetcherDelegate> delegate;
@property (retain, nonatomic) UITableView * companyTableView;

@end

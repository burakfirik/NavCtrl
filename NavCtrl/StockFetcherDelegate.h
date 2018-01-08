
#import <Foundation/Foundation.h>

@protocol StockFetcherDelegate <NSObject>

-(void)stockFetchSuccessWithPriceString: (NSArray*) priceArray;

@optional
-(void)stockFetchDidFailWithError: (NSError*) error;
-(void)stockFetchDidStart;


@end



#import <Foundation/Foundation.h>

@protocol ImageFetcherDelegate <NSObject>

-(void)imageFetchSuccess: (NSArray*) priceArray;

@optional
-(void)stockFetchDidFailWithError: (NSError*) error;
-(void)stockFetchDidStart;


@end


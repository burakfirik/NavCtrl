
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Company.h"
#import "Product.h"
#import "NavControllerAppDelegate.h"
@interface CompanyDao : NSObject

@property (retain, nonatomic) NSMutableArray<Company*> * companyList;
@property (retain, nonatomic) NSMutableArray<Company*> * companyListManaged;

@property (retain, nonatomic) NSMutableArray * stockArray;
@property (retain, nonatomic) NavControllerAppDelegate *navControllerAppDelegate;
@property (retain, nonatomic) NSFetchRequest *request;
@property (retain, nonatomic) NSManagedObjectContext *context;
@property (strong, nonatomic) NSManagedObjectModel *objectModel;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSPersistentStoreCoordinator *storeCoordinator;

+ (id) sharedManager;
-(void) createCompanyAndProduct;
-(void) editCompany:compName stock:(NSString*)compStock compURL:(NSString*)compImgURL deleteAt: (NSInteger*)deleteIndex;
-(void) addProductToCompany:(NSInteger*)companyAddIndex product: (Product*)prod;
-(void) editProduct: (NSInteger*)companyEditIndex prodIndex: (NSInteger*)productEditIndex name: (NSString*)prodName url:(NSString*)prodURL imgURL: (NSString*)prodImgURL;
-(void)addNewCompany: (Company*)comp;

@end

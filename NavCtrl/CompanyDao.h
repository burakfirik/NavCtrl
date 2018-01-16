
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Company.h"
#import "Product.h"
#import "NavControllerAppDelegate.h"
#import "CompanyData+CoreDataClass.h"
@interface CompanyDao : NSObject

@property (retain, nonatomic) NSMutableArray<Company*> *companyList;
@property (retain, nonatomic) NSMutableArray *companyDataList;
@property (retain, nonatomic) NSMutableArray * stockArray;
@property (retain, nonatomic) NavControllerAppDelegate *navControllerAppDelegate;
@property (retain, nonatomic) NSFetchRequest *request;
@property (retain, nonatomic) NSManagedObjectContext *context;
@property (strong, nonatomic) NSManagedObjectModel *objectModel;


+ (id) sharedManager;
-(void) createCompanyAndProduct;
-(void) editCompany:compName stock:(NSString*)compStock compURL:(NSString*)compImgURL deleteAt: (NSInteger*)deleteIndex;
-(void) addProductToCompany:(NSInteger*)companyAddIndex product: (Product*)prod;
-(void) editProduct: (NSInteger*)companyEditIndex prodIndex: (NSInteger*)productEditIndex name: (NSString*)prodName url:(NSString*)prodURL imgURL: (NSString*)prodImgURL;
-(void)removeProduct: (NSInteger*)companyAddIndex productIndex: (NSInteger*)prodIndex;
-(void)undo;
-(void)redo;
-(void) deleteCompany: (NSInteger*) deleteCompanyIndex;
-(void) addNewCompany: (NSString*)comName stockTick:(NSString*)comStock downloadURL:(NSString*)compImgURL;


@end

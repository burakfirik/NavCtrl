
#import "NavControllerAppDelegate.h"
#import "CompanyVC.h"

@implementation NavControllerAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  
  // Override point for customization after application launch.
  CompanyVC *companyVC = [[CompanyVC alloc] init];
  
  //CompanyVC *rootController = companyVC;
 
  
  if (_navigationController) [_navigationController release];
  
  UINavigationController *navCont = [[UINavigationController alloc]
                                     initWithRootViewController:companyVC];

  _navigationController = navCont;
  UIWindow *mainWindow = [[UIWindow alloc]
                      initWithFrame:[[UIScreen mainScreen] bounds]];
  
  _window = mainWindow;
  [_window setRootViewController:_navigationController];
  [_window makeKeyAndVisible];
  [companyVC release];
  return YES;
  
  
  /*
   self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
   // Override point for customization after application launch.
   self.window.backgroundColor = [UIColor whiteColor];
   [self.window makeKeyAndVisible];
   return YES;
   */
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
   [self saveContext];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
   [self saveContext];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  [self saveContext];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  [self saveContext];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  [self saveContext];
}



@synthesize managedObjectModel = _managedObjectModel;
@synthesize managedObjectContext = _managedObjectContext;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL*)applicationDocumentsDirectory {
  return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel*)managedObjectModel {
  if (_managedObjectModel != nil) {
    return _managedObjectModel;
  }
  NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CompanyModel" withExtension:@"momd"];
  _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
  return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
  if (_persistentStoreCoordinator != nil) {
    return _persistentStoreCoordinator;
  }
  NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CompanyModel.sqlite"];
  NSError *error = nil;
  _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
  if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
    NSLog(@"error %@, %@", error, [error userInfo]);
    abort();
  }
  return _persistentStoreCoordinator;
}


- (NSManagedObjectContext*)managedObjectContext {
  
  if (_managedObjectContext != nil) {
    return _managedObjectContext;
  }
  
  NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
  if (!coordinator) {
    return nil;
  }
  _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
  NSUndoManager *undoManager = [[NSUndoManager alloc] init];
  _managedObjectContext.undoManager = undoManager;
  
  [_managedObjectContext setPersistentStoreCoordinator:coordinator];
  [undoManager release];
  return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
  NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
  if (managedObjectContext != nil) {
    NSError *error = nil;
    if([managedObjectContext hasChanges] &&
       ![managedObjectContext save:&error]) {
      NSLog(@"error %@, %@", error, [error userInfo]);
      abort();
    }
  }
}

- (void)dealloc
{
  [_managedObjectModel release];
  [_persistentStoreCoordinator release];
  [_window release];
  [_managedObjectContext release];
  [_navigationController release];
  [super dealloc];
}

@end

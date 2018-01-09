
#import "ProductEditVC.h"

@interface ProductEditVC ()

@property (retain, nonatomic) UIView *topView;
@property (retain, nonatomic) UITextField *productNameTextField;
@property (retain, nonatomic) UITextField *productStockTextField;
@property (retain, nonatomic) UITextField *productImgURLTextField;
@property (retain, nonatomic) UIButton *deleteButton;


@property (nonatomic) CGFloat middleTop;
@property (nonatomic) CGFloat bottomTop;
@property (nonatomic) NSLayoutConstraint *productImgURLTextFieldLeadingContraints;
@property (nonatomic) NSLayoutConstraint *productImgURLTextFieldTrailingContraints;
@property (nonatomic) NSLayoutConstraint *productImgURLTextFieldTopContraints;
@property (nonatomic) NSLayoutConstraint *productImgURLTextFieldBottomContraints;

@property (nonatomic) NSLayoutConstraint *productStockTextFieldLeadingContraints;
@property (nonatomic) NSLayoutConstraint *productStockTextFieldTrailingContraints;
@property (nonatomic) NSLayoutConstraint *productStockTextFieldTopContraints;
@property (nonatomic) NSLayoutConstraint *productStockTextFieldBottomContraints;

@property (nonatomic) NSLayoutConstraint *deleteButtonLeadingContraints;
@property (nonatomic) NSLayoutConstraint *deleteButtonTrailingContraints;
@property (nonatomic) NSLayoutConstraint *deleteButtonTopContraints;
@property (nonatomic) NSLayoutConstraint *deleteButtonBottomContraints;


@end

@implementation ProductEditVC

- (void)viewDidLoad {
  [super viewDidLoad];
  //NSNumber *val = [NSNumber numberWithUnsignedInt:200];
  self.middleTop = 250;
  self.bottomTop = 400;
  
  
  
  UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveProductButtonTapped)];
  UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelProductButtonTapped)];
  self.navigationItem.rightBarButtonItem = saveButton;
  self.navigationItem.leftBarButtonItem = cancelButton;
  self.dataAccessObject = [CompanyDao sharedManager];
  
  
  
  
  self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationController.navigationBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)];
  self.topView.backgroundColor = [UIColor lightGrayColor];
  
  self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(40, 280, 200, 20)];
  [self.deleteButton addTarget:self action:@selector(deleteButtonTapped)
              forControlEvents:UIControlEventTouchUpInside];
  
  [self.deleteButton setTitle:@"Delete" forState:UIControlStateNormal];
  CompanyDao* dataAccessObject = [CompanyDao sharedManager];
  
  self.productStockTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 80, 200, 20)];
  self.productImgURLTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 120, 200, 20)];
  self.productNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 240, 200, 20)];
  Product *prodToEdit = [[dataAccessObject.companyList objectAtIndex:(int)(self.companyEditIndex)].products objectAtIndex:(int)(self.productEditIndex) ];
  self.productNameTextField.text = [prodToEdit productName];
  self.productStockTextField.text = [self.company stockTick];
  self.productImgURLTextField.text = [prodToEdit productURL];
  
  self.productNameTextField.delegate = self;
  self.productStockTextField.delegate = self;
  self.productImgURLTextField.delegate = self;
  
  self.productNameTextField.backgroundColor = [UIColor whiteColor];
  self.productStockTextField.backgroundColor = [UIColor whiteColor];
  self.productImgURLTextField.backgroundColor = [UIColor whiteColor];
  
  [self.topView addSubview:self.productNameTextField];
  [self.topView addSubview:self.productStockTextField];
  [self.topView addSubview:self.productImgURLTextField];
  [self.topView addSubview:self.deleteButton];
  self.title = @"Edit Product";
  
  
  [self.view addSubview:self.topView];
  // Do any additional setup after loading the view from its nib.
  
  self.topView.translatesAutoresizingMaskIntoConstraints = NO;
  self.productNameTextField.translatesAutoresizingMaskIntoConstraints = NO;
  self.productStockTextField.translatesAutoresizingMaskIntoConstraints = NO;
  self.productImgURLTextField.translatesAutoresizingMaskIntoConstraints = NO;
  self.deleteButton.translatesAutoresizingMaskIntoConstraints = NO;
  [self addTopViewConsraints];
  [self addProductNameTextFieldContraints];
  [self addProductStockTextFieldContraints: 250];
  [self addProductImgURLTextFieldContraints:400];
  [self addDeleteButtonContraints];
  
  
}

-(void) addTopViewConsraints {
  
  NSLayoutConstraint *topViewLeadingContraint = [NSLayoutConstraint
                                                 constraintWithItem:self.topView
                                                 attribute:NSLayoutAttributeLeading
                                                 relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                                 attribute:NSLayoutAttributeLeading                                                        multiplier:1.0
                                                 constant:0];
  
  //
  NSLayoutConstraint *topViewTrailingContraint = [NSLayoutConstraint
                                                  constraintWithItem:self.topView
                                                  attribute:NSLayoutAttributeTrailing
                                                  relatedBy:NSLayoutRelationEqual
                                                  toItem:self.view
                                                  attribute:NSLayoutAttributeTrailing                                                       multiplier:1.0
                                                  constant:0];
  NSLayoutConstraint *topViewBottomContraint = [NSLayoutConstraint
                                                constraintWithItem:self.topView
                                                attribute:NSLayoutAttributeBottom
                                                relatedBy:NSLayoutRelationEqual
                                                toItem:self.view
                                                attribute:NSLayoutAttributeBottom                                                       multiplier:1.0
                                                constant:0];
  NSLayoutConstraint *topViewTopContraint = [NSLayoutConstraint
                                             constraintWithItem:self.topView
                                             attribute:NSLayoutAttributeTop
                                             relatedBy:NSLayoutRelationEqual
                                             toItem:self.view
                                             attribute:NSLayoutAttributeTop                                                     multiplier:1.0
                                             constant:self.navigationController.navigationController.navigationBar.frame.size.height];
  [NSLayoutConstraint activateConstraints:@[topViewLeadingContraint, topViewTrailingContraint, topViewTopContraint, topViewBottomContraint]];
  
}

-(void) addProductNameTextFieldContraints {
  NSLayoutConstraint *productNameTextField = [NSLayoutConstraint
                                              constraintWithItem:self.productNameTextField
                                              attribute:NSLayoutAttributeLeading
                                              relatedBy:NSLayoutRelationEqual
                                              toItem:self.topView
                                              attribute:NSLayoutAttributeLeading                                                        multiplier:1.0
                                              constant:30];
  NSLayoutConstraint *productNameTextFieldTrailingContraints = [NSLayoutConstraint
                                                                constraintWithItem:self.productNameTextField
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                toItem:self.topView
                                                                attribute:NSLayoutAttributeTrailing                                                        multiplier:1.0
                                                                constant:-30];
  NSLayoutConstraint *productNameTextFieldTopContraints = [NSLayoutConstraint
                                                           constraintWithItem:self.productNameTextField
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                           toItem:self.topView
                                                           attribute:NSLayoutAttributeTop                                                       multiplier:1.0
                                                           constant:self.navigationController.navigationBar.frame.size.height + 70];
  NSLayoutConstraint *productNameTextFieldBottomContraints = [NSLayoutConstraint
                                                              constraintWithItem:self.productNameTextField
                                                              attribute:NSLayoutAttributeHeight
                                                              relatedBy:NSLayoutRelationEqual
                                                              toItem:nil
                                                              attribute:NSLayoutAttributeHeight                                                       multiplier:0.0
                                                              constant:40];
  //[self.view addConstraints:];
  [NSLayoutConstraint activateConstraints:@[productNameTextField, productNameTextFieldTrailingContraints,productNameTextFieldTopContraints, productNameTextFieldBottomContraints]];
  
}


-(void) addProductStockTextFieldContraints:(CGFloat) middle {
  
  self.productStockTextFieldLeadingContraints = [NSLayoutConstraint
                                                 constraintWithItem:self.productStockTextField
                                                 attribute:NSLayoutAttributeLeading
                                                 relatedBy:NSLayoutRelationEqual
                                                 toItem:self.topView
                                                 attribute:NSLayoutAttributeLeading                                                        multiplier:1.0
                                                 constant:30];
  self.productStockTextFieldTrailingContraints = [NSLayoutConstraint
                                                  constraintWithItem:self.productStockTextField
                                                  attribute:NSLayoutAttributeTrailing
                                                  relatedBy:NSLayoutRelationEqual
                                                  toItem:self.topView
                                                  attribute:NSLayoutAttributeTrailing                                                        multiplier:1.0
                                                  constant:-30];
  self.productStockTextFieldTopContraints = [NSLayoutConstraint
                                             constraintWithItem:self.productStockTextField
                                             attribute:NSLayoutAttributeTop
                                             relatedBy:NSLayoutRelationEqual
                                             toItem:self.topView
                                             attribute:NSLayoutAttributeTop                                                       multiplier:1.0
                                             constant:middle];
  
  self.productStockTextFieldBottomContraints = [NSLayoutConstraint
                                                constraintWithItem:self.productStockTextField
                                                attribute:NSLayoutAttributeHeight
                                                relatedBy:NSLayoutRelationEqual
                                                toItem:nil
                                                attribute:NSLayoutAttributeHeight                                                       multiplier:0.0
                                                constant:40];
  //[self.view addConstraints:];
  [NSLayoutConstraint activateConstraints:@[self.productStockTextFieldLeadingContraints, self.productStockTextFieldTrailingContraints,self.productStockTextFieldTopContraints, self.productStockTextFieldBottomContraints]];
  
}


-(void) addProductImgURLTextFieldContraints: (CGFloat) top {
  
  self.productImgURLTextFieldLeadingContraints = [NSLayoutConstraint
                                                  constraintWithItem:self.productImgURLTextField
                                                  attribute:NSLayoutAttributeLeading
                                                  relatedBy:NSLayoutRelationEqual
                                                  toItem:self.topView
                                                  attribute:NSLayoutAttributeLeading                                                        multiplier:1.0
                                                  constant:30];
  self.productImgURLTextFieldTrailingContraints = [NSLayoutConstraint
                                                   constraintWithItem:self.productImgURLTextField
                                                   attribute:NSLayoutAttributeTrailing
                                                   relatedBy:NSLayoutRelationEqual
                                                   toItem:self.topView
                                                   attribute:NSLayoutAttributeTrailing                                                        multiplier:1.0
                                                   constant:-30];
  self.productImgURLTextFieldTopContraints = [NSLayoutConstraint
                                              constraintWithItem:self.productImgURLTextField
                                              attribute:NSLayoutAttributeTop
                                              relatedBy:NSLayoutRelationEqual
                                              toItem:self.topView
                                              attribute:NSLayoutAttributeTop                                                       multiplier:1.0
                                              constant:top];
  
  self.productImgURLTextFieldBottomContraints = [NSLayoutConstraint
                                                 constraintWithItem:self.productImgURLTextField
                                                 attribute:NSLayoutAttributeHeight
                                                 relatedBy:NSLayoutRelationEqual
                                                 toItem:nil
                                                 attribute:NSLayoutAttributeHeight                                                       multiplier:0.0
                                                 constant:40];
  //[self.view addConstraints:];
  [NSLayoutConstraint activateConstraints:@[self.productImgURLTextFieldLeadingContraints, self.productImgURLTextFieldTrailingContraints,self.productImgURLTextFieldTopContraints, self.productImgURLTextFieldBottomContraints]];
  
}


-(void) addDeleteButtonContraints {
  
  self.deleteButtonLeadingContraints = [NSLayoutConstraint
                                        constraintWithItem:self.deleteButton
                                        attribute:NSLayoutAttributeLeading
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:self.topView
                                        attribute:NSLayoutAttributeLeading                                                        multiplier:1.0
                                        constant:60];
  self.deleteButtonTrailingContraints = [NSLayoutConstraint
                                         constraintWithItem:self.deleteButton
                                         attribute:NSLayoutAttributeTrailing
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:self.topView
                                         attribute:NSLayoutAttributeTrailing                                                        multiplier:1.0
                                         constant:-60];
  self.deleteButtonTopContraints = [NSLayoutConstraint
                                    constraintWithItem:self.deleteButton
                                    attribute:NSLayoutAttributeTop
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self.productImgURLTextField
                                    attribute:NSLayoutAttributeBottom                                                       multiplier:1.0
                                    constant:20];
  
  self.deleteButtonBottomContraints = [NSLayoutConstraint
                                       constraintWithItem:self.deleteButton
                                       attribute:NSLayoutAttributeHeight
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:nil
                                       attribute:NSLayoutAttributeHeight                                                       multiplier:0.0
                                       constant:45];
  //[self.view addConstraints:];
  [NSLayoutConstraint activateConstraints:@[self.deleteButtonLeadingContraints, self.deleteButtonTrailingContraints,self.deleteButtonTopContraints, self.deleteButtonBottomContraints]];
  
}


-(void) cancelProductButtonTapped {
  [self.navigationController popViewControllerAnimated:true];
}



-(void) saveProductButtonTapped {
  NSString *prodName = [self.productNameTextField text];
  NSString *prodURL = [self.productStockTextField text];
  NSString *prodImgURL = [self.productImgURLTextField text];
  
  if (prodName != nil && prodURL != nil && prodImgURL != nil) {
    NSLog(@"Sel");
    CompanyDao *dataAccessObject = [CompanyDao sharedManager];
    [dataAccessObject editProduct: self.companyEditIndex prodIndex: self.productEditIndex name: prodName url:prodURL imgURL: prodImgURL];
    [self.navigationController popViewControllerAnimated:true];
  } else {
    // Alert to user to fill all the fields
  }
  
}

-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
  NSLog(@"Keyboard show");
  return YES;
}



- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
  
  [self.view endEditing:YES];
  return YES;
}


- (void)keyboardDidShow:(NSNotification *)notification
{
  self.middleTop = 183;
  self.bottomTop = 250;
  
  [NSLayoutConstraint deactivateConstraints:@[self.productImgURLTextFieldLeadingContraints, self.productImgURLTextFieldTrailingContraints,self.productImgURLTextFieldTopContraints, self.productImgURLTextFieldBottomContraints]];
  [NSLayoutConstraint deactivateConstraints:@[self.productStockTextFieldLeadingContraints, self.productStockTextFieldTrailingContraints,self.productStockTextFieldTopContraints, self.productStockTextFieldBottomContraints]];
  
  [self addProductStockTextFieldContraints:self.middleTop];
  [self addProductImgURLTextFieldContraints:self.bottomTop];
  [UIView animateWithDuration:0.7
                   animations:^{
                     [self.topView layoutIfNeeded]; // Called on parent view
                   }];
  
}

-(void)deleteButtonTapped {
  NSLog(@"Delete Button Tapped");
}

-(void)keyboardDidHide:(NSNotification *)notification
{
  // [self.addTopView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
  self.bottomTop = 400;
  [self addProductImgURLTextFieldContraints:self.bottomTop];
  [self.topView setNeedsLayout];
  
  NSLog(@"Keyboard is gone");
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)dealloc {
  [_topView release];
  [_productNameTextField release];
  [_productStockTextField release];
  [_productImgURLTextField release];
  [super dealloc];
}
@end


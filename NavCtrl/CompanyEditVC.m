

#import "CompanyEditVC.h"
#import "CompanyDao.h"

@interface CompanyEditVC ()

@property (retain, nonatomic) UIView *topView;
@property (retain, nonatomic) UITextField *companyNameTextField;
@property (retain, nonatomic) UITextField *companyStockTickTextField;
@property (retain, nonatomic) UITextField *companyImgURLTextField;
@property (retain, nonatomic) UIButton *deleteButton;


@property (nonatomic) CGFloat middleTop;
@property (nonatomic) CGFloat bottomTop;
@property (nonatomic) NSLayoutConstraint *companyImgURLTextFieldLeadingContraints;
@property (nonatomic) NSLayoutConstraint *companyImgURLTextFieldTrailingContraints;
@property (nonatomic) NSLayoutConstraint *companyImgURLTextFieldTopContraints;
@property (nonatomic) NSLayoutConstraint *companyImgURLTextFieldBottomContraints;

@property (nonatomic) NSLayoutConstraint *companyStockTickTextFieldLeadingContraints;
@property (nonatomic) NSLayoutConstraint *companyStockTickTextFieldTrailingContraints;
@property (nonatomic) NSLayoutConstraint *companyStockTickTextFieldTopContraints;
@property (nonatomic) NSLayoutConstraint *companyStockTickTextFieldBottomContraints;

@property (nonatomic) NSLayoutConstraint *deleteButtonLeadingContraints;
@property (nonatomic) NSLayoutConstraint *deleteButtonTrailingContraints;
@property (nonatomic) NSLayoutConstraint *deleteButtonTopContraints;
@property (nonatomic) NSLayoutConstraint *deleteButtonBottomContraints;


@end

@implementation CompanyEditVC

- (void)viewDidLoad {
  [super viewDidLoad];
  //NSNumber *val = [NSNumber numberWithUnsignedInt:200];
  self.middleTop = 250;
  self.bottomTop = 400;
  
  
  
  UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveCompanyButtonTapped)];
  UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelCompanyButtonTapped)];
  self.navigationItem.rightBarButtonItem = saveButton;
  self.navigationItem.leftBarButtonItem = cancelButton;
  self.dataAccessObject = [CompanyDao sharedManager];
  
  
  
  
  self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationController.navigationBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)];
  self.topView.backgroundColor = [UIColor lightGrayColor];
  
  self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(40, 280, 200, 20)];
  [self.deleteButton addTarget:self action:@selector(deleteButtonTapped)
              forControlEvents:UIControlEventTouchUpInside];
  
  [self.deleteButton setTitle:@"Delete" forState:UIControlStateNormal];
  
  
  self.companyStockTickTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 80, 200, 20)];
  self.companyImgURLTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 120, 200, 20)];
  self.companyNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 240, 200, 20)];
  
  self.companyNameTextField.text = [self.company name];
  self.companyStockTickTextField.text = [self.company stockTick];
  self.companyImgURLTextField.text = @"Img Url";
  
  self.companyNameTextField.delegate = self;
  self.companyStockTickTextField.delegate = self;
  self.companyImgURLTextField.delegate = self;
  
  self.companyNameTextField.backgroundColor = [UIColor whiteColor];
  self.companyStockTickTextField.backgroundColor = [UIColor whiteColor];
  self.companyImgURLTextField.backgroundColor = [UIColor whiteColor];
  
  [self.topView addSubview:self.companyNameTextField];
  [self.topView addSubview:self.companyStockTickTextField];
  [self.topView addSubview:self.companyImgURLTextField];
  [self.topView addSubview:self.deleteButton];
  self.title = @"Edit Product";
  
  
  [self.view addSubview:self.topView];
  // Do any additional setup after loading the view from its nib.
  
  self.topView.translatesAutoresizingMaskIntoConstraints = NO;
  self.companyNameTextField.translatesAutoresizingMaskIntoConstraints = NO;
  self.companyStockTickTextField.translatesAutoresizingMaskIntoConstraints = NO;
  self.companyImgURLTextField.translatesAutoresizingMaskIntoConstraints = NO;
  self.deleteButton.translatesAutoresizingMaskIntoConstraints = NO;
  [self addTopViewConsraints];
  [self addcompanyNameTextFieldContraints];
  [self addcompanyStockTickTextFieldContraints: 250];
  [self addcompanyImgURLTextFieldContraints:400];
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

-(void) addcompanyNameTextFieldContraints {
  NSLayoutConstraint *companyNameTextField = [NSLayoutConstraint
                                              constraintWithItem:self.companyNameTextField
                                              attribute:NSLayoutAttributeLeading
                                              relatedBy:NSLayoutRelationEqual
                                              toItem:self.topView
                                              attribute:NSLayoutAttributeLeading                                                        multiplier:1.0
                                              constant:30];
  NSLayoutConstraint *companyNameTextFieldTrailingContraints = [NSLayoutConstraint
                                                                constraintWithItem:self.companyNameTextField
                                                                attribute:NSLayoutAttributeTrailing
                                                                relatedBy:NSLayoutRelationEqual
                                                                toItem:self.topView
                                                                attribute:NSLayoutAttributeTrailing                                                        multiplier:1.0
                                                                constant:-30];
  NSLayoutConstraint *companyNameTextFieldTopContraints = [NSLayoutConstraint
                                                           constraintWithItem:self.companyNameTextField
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                           toItem:self.topView
                                                           attribute:NSLayoutAttributeTop                                                       multiplier:1.0
                                                           constant:self.navigationController.navigationBar.frame.size.height + 70];
  NSLayoutConstraint *companyNameTextFieldBottomContraints = [NSLayoutConstraint
                                                              constraintWithItem:self.companyNameTextField
                                                              attribute:NSLayoutAttributeHeight
                                                              relatedBy:NSLayoutRelationEqual
                                                              toItem:nil
                                                              attribute:NSLayoutAttributeHeight                                                       multiplier:0.0
                                                              constant:40];
  //[self.view addConstraints:];
  [NSLayoutConstraint activateConstraints:@[companyNameTextField, companyNameTextFieldTrailingContraints,companyNameTextFieldTopContraints, companyNameTextFieldBottomContraints]];
  
}


-(void) addcompanyStockTickTextFieldContraints:(CGFloat) middle {
  
  self.companyStockTickTextFieldLeadingContraints = [NSLayoutConstraint
                                                     constraintWithItem:self.companyStockTickTextField
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                     toItem:self.topView
                                                     attribute:NSLayoutAttributeLeading                                                        multiplier:1.0
                                                     constant:30];
  self.companyStockTickTextFieldTrailingContraints = [NSLayoutConstraint
                                                      constraintWithItem:self.companyStockTickTextField
                                                      attribute:NSLayoutAttributeTrailing
                                                      relatedBy:NSLayoutRelationEqual
                                                      toItem:self.topView
                                                      attribute:NSLayoutAttributeTrailing                                                        multiplier:1.0
                                                      constant:-30];
  self.companyStockTickTextFieldTopContraints = [NSLayoutConstraint
                                                 constraintWithItem:self.companyStockTickTextField
                                                 attribute:NSLayoutAttributeTop
                                                 relatedBy:NSLayoutRelationEqual
                                                 toItem:self.topView
                                                 attribute:NSLayoutAttributeTop                                                       multiplier:1.0
                                                 constant:middle];
  
  self.companyStockTickTextFieldBottomContraints = [NSLayoutConstraint
                                                    constraintWithItem:self.companyStockTickTextField
                                                    attribute:NSLayoutAttributeHeight
                                                    relatedBy:NSLayoutRelationEqual
                                                    toItem:nil
                                                    attribute:NSLayoutAttributeHeight                                                       multiplier:0.0
                                                    constant:40];
  //[self.view addConstraints:];
  [NSLayoutConstraint activateConstraints:@[self.companyStockTickTextFieldLeadingContraints, self.companyStockTickTextFieldTrailingContraints,self.companyStockTickTextFieldTopContraints, self.companyStockTickTextFieldBottomContraints]];
  
}


-(void) addcompanyImgURLTextFieldContraints: (CGFloat) top {
  
  self.companyImgURLTextFieldLeadingContraints = [NSLayoutConstraint
                                                  constraintWithItem:self.companyImgURLTextField
                                                  attribute:NSLayoutAttributeLeading
                                                  relatedBy:NSLayoutRelationEqual
                                                  toItem:self.topView
                                                  attribute:NSLayoutAttributeLeading                                                        multiplier:1.0
                                                  constant:30];
  self.companyImgURLTextFieldTrailingContraints = [NSLayoutConstraint
                                                   constraintWithItem:self.companyImgURLTextField
                                                   attribute:NSLayoutAttributeTrailing
                                                   relatedBy:NSLayoutRelationEqual
                                                   toItem:self.topView
                                                   attribute:NSLayoutAttributeTrailing                                                        multiplier:1.0
                                                   constant:-30];
  self.companyImgURLTextFieldTopContraints = [NSLayoutConstraint
                                              constraintWithItem:self.companyImgURLTextField
                                              attribute:NSLayoutAttributeTop
                                              relatedBy:NSLayoutRelationEqual
                                              toItem:self.topView
                                              attribute:NSLayoutAttributeTop                                                       multiplier:1.0
                                              constant:top];
  
  self.companyImgURLTextFieldBottomContraints = [NSLayoutConstraint
                                                 constraintWithItem:self.companyImgURLTextField
                                                 attribute:NSLayoutAttributeHeight
                                                 relatedBy:NSLayoutRelationEqual
                                                 toItem:nil
                                                 attribute:NSLayoutAttributeHeight                                                       multiplier:0.0
                                                 constant:40];
  //[self.view addConstraints:];
  [NSLayoutConstraint activateConstraints:@[self.companyImgURLTextFieldLeadingContraints, self.companyImgURLTextFieldTrailingContraints,self.companyImgURLTextFieldTopContraints, self.companyImgURLTextFieldBottomContraints]];
  
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
                                    toItem:self.companyImgURLTextField
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


-(void) cancelCompanyButtonTapped {
  [self.navigationController popViewControllerAnimated:true];
}



-(void) saveCompanyButtonTapped {
  NSString *compName = [self.companyNameTextField text];
  NSString *compStock = [self.companyStockTickTextField text];
  NSString *compImgURL = [self.companyImgURLTextField text];
  
  if (compName != nil && compStock != nil &&compImgURL != nil) {
    NSLog(@"Sel");
    CompanyDao *dataAccessObject = [CompanyDao sharedManager];
    [dataAccessObject editCompany:compName stock:compStock compURL:compImgURL deleteAt: (self.deleteIndex)];
    // Company *comp = self.company;
    //[comp editCompany:compName stock:compStock compURL:compImgURL];
    
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
  
  [NSLayoutConstraint deactivateConstraints:@[self.companyImgURLTextFieldLeadingContraints, self.companyImgURLTextFieldTrailingContraints,self.companyImgURLTextFieldTopContraints, self.companyImgURLTextFieldBottomContraints]];
  [NSLayoutConstraint deactivateConstraints:@[self.companyStockTickTextFieldLeadingContraints, self.companyStockTickTextFieldTrailingContraints,self.companyStockTickTextFieldTopContraints, self.companyStockTickTextFieldBottomContraints]];
  
  [self addcompanyStockTickTextFieldContraints:self.middleTop];
  [self addcompanyImgURLTextFieldContraints:self.bottomTop];
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
  [self addcompanyImgURLTextFieldContraints:self.bottomTop];
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
  [_companyNameTextField release];
  [_companyStockTickTextField release];
  [_companyImgURLTextField release];
  [super dealloc];
}
@end



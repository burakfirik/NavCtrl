#import "CompanyAddVC.h"


@interface CompanyAddVC ()


@property (retain, nonatomic) UIView *topView;
@property (retain, nonatomic) UITextField *topTextField;
@property (retain, nonatomic) UITextField *middleTextField;
@property (retain, nonatomic) UITextField *bottomTextField;


@property (nonatomic) CGFloat middleTop;
@property (nonatomic) CGFloat bottomTop;
@property (nonatomic) NSLayoutConstraint *bottomTextFieldLeadingContraints;
@property (nonatomic) NSLayoutConstraint *bottomTextFieldTrailingContraints;
@property (nonatomic) NSLayoutConstraint *bottomTextFieldTopContraints;
@property (nonatomic) NSLayoutConstraint *bottomTextFieldBottomContraints;

@property (nonatomic) NSLayoutConstraint *middleTextFieldLeadingContraints;
@property (nonatomic) NSLayoutConstraint *middleTextFieldTrailingContraints;
@property (nonatomic) NSLayoutConstraint *middleTextFieldTopContraints;
@property (nonatomic) NSLayoutConstraint *middleTextFieldBottomContraints;


@end

@implementation CompanyAddVC

- (void)viewDidLoad {
  [super viewDidLoad];
  self.middleTop = 250;
  self.bottomTop = 400;
  
  UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveButtonTapped)];
  UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelButtonTapped)];
  self.navigationItem.rightBarButtonItem = saveButton;
  self.navigationItem.leftBarButtonItem = cancelButton;
  self.dataAccessObject = [CompanyDao sharedManager];
  
  
  
  
  self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationController.navigationBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)];
  self.topView.backgroundColor = [UIColor lightGrayColor];
  
  
  self.topTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 240, 200, 20)];
  self.middleTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 80, 200, 20)];
  self.bottomTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 120, 200, 20)];
  
  self.topTextField.delegate = self;
  self.middleTextField.delegate = self;
  self.bottomTextField.delegate = self;
  
  self.topTextField.backgroundColor = [UIColor whiteColor];
  self.middleTextField.backgroundColor = [UIColor whiteColor];
  self.bottomTextField.backgroundColor = [UIColor whiteColor];
  
  [self.topView addSubview:self.topTextField];
  [self.topView addSubview:self.middleTextField];
  [self.topView addSubview:self.bottomTextField];
  self.title = @"Add Company";
  
  
  [self.view addSubview:self.topView];
  // Do any additional setup after loading the view from its nib.
  
  self.topView.translatesAutoresizingMaskIntoConstraints = NO;
  self.topTextField.translatesAutoresizingMaskIntoConstraints = NO;
  self.middleTextField.translatesAutoresizingMaskIntoConstraints = NO;
  self.bottomTextField.translatesAutoresizingMaskIntoConstraints = NO;
  [self addTopViewConsraints];
  [self addTopTextFieldContraints];
  [self addMiddleTextFieldContraints: 300];
  [self addBottomTextFieldContraints:400];
  
  
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

-(void) addTopTextFieldContraints {
  NSLayoutConstraint *topTextFieldLeadingContraints = [NSLayoutConstraint
                                                       constraintWithItem:self.topTextField
                                                       attribute:NSLayoutAttributeLeading
                                                       relatedBy:NSLayoutRelationEqual
                                                       toItem:self.topView
                                                       attribute:NSLayoutAttributeLeading                                                        multiplier:1.0
                                                       constant:30];
  NSLayoutConstraint *topTextFieldTrailingContraints = [NSLayoutConstraint
                                                        constraintWithItem:self.topTextField
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                        toItem:self.topView
                                                        attribute:NSLayoutAttributeTrailing                                                        multiplier:1.0
                                                        constant:-30];
  NSLayoutConstraint *topTextFieldTopContraints = [NSLayoutConstraint
                                                   constraintWithItem:self.topTextField
                                                   attribute:NSLayoutAttributeTop
                                                   relatedBy:NSLayoutRelationEqual
                                                   toItem:self.topView
                                                   attribute:NSLayoutAttributeTop                                                       multiplier:1.0
                                                   constant:self.navigationController.navigationBar.frame.size.height + 70];
  NSLayoutConstraint *topTextFieldBottomContraints = [NSLayoutConstraint
                                                      constraintWithItem:self.topTextField
                                                      attribute:NSLayoutAttributeHeight
                                                      relatedBy:NSLayoutRelationEqual
                                                      toItem:nil
                                                      attribute:NSLayoutAttributeHeight                                                       multiplier:0.0
                                                      constant:40];
  //[self.view addConstraints:];
  [NSLayoutConstraint activateConstraints:@[topTextFieldLeadingContraints, topTextFieldTrailingContraints,topTextFieldTopContraints, topTextFieldBottomContraints]];
  
}


-(void) addMiddleTextFieldContraints:(CGFloat) middle {
  
  self.middleTextFieldLeadingContraints = [NSLayoutConstraint
                                           constraintWithItem:self.middleTextField
                                           attribute:NSLayoutAttributeLeading
                                           relatedBy:NSLayoutRelationEqual
                                           toItem:self.topView
                                           attribute:NSLayoutAttributeLeading                                                        multiplier:1.0
                                           constant:30];
  self.middleTextFieldTrailingContraints = [NSLayoutConstraint
                                            constraintWithItem:self.middleTextField
                                            attribute:NSLayoutAttributeTrailing
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:self.topView
                                            attribute:NSLayoutAttributeTrailing                                                        multiplier:1.0
                                            constant:-30];
  self.middleTextFieldTopContraints = [NSLayoutConstraint
                                       constraintWithItem:self.middleTextField
                                       attribute:NSLayoutAttributeTop
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.topView
                                       attribute:NSLayoutAttributeTop                                                       multiplier:1.0
                                       constant:middle];
  
  self.middleTextFieldBottomContraints = [NSLayoutConstraint
                                          constraintWithItem:self.middleTextField
                                          attribute:NSLayoutAttributeHeight
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:nil
                                          attribute:NSLayoutAttributeHeight                                                       multiplier:0.0
                                          constant:40];
  //[self.view addConstraints:];
  [NSLayoutConstraint activateConstraints:@[self.middleTextFieldLeadingContraints, self.middleTextFieldTrailingContraints,self.middleTextFieldTopContraints, self.middleTextFieldBottomContraints]];
  
}


-(void) addBottomTextFieldContraints: (CGFloat) top {
  
  self.bottomTextFieldLeadingContraints = [NSLayoutConstraint
                                           constraintWithItem:self.bottomTextField
                                           attribute:NSLayoutAttributeLeading
                                           relatedBy:NSLayoutRelationEqual
                                           toItem:self.topView
                                           attribute:NSLayoutAttributeLeading                                                        multiplier:1.0
                                           constant:30];
  self.bottomTextFieldTrailingContraints = [NSLayoutConstraint
                                            constraintWithItem:self.bottomTextField
                                            attribute:NSLayoutAttributeTrailing
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:self.topView
                                            attribute:NSLayoutAttributeTrailing                                                        multiplier:1.0
                                            constant:-30];
  self.bottomTextFieldTopContraints = [NSLayoutConstraint
                                       constraintWithItem:self.bottomTextField
                                       attribute:NSLayoutAttributeTop
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.topView
                                       attribute:NSLayoutAttributeTop                                                       multiplier:1.0
                                       constant:top];
  
  self.bottomTextFieldBottomContraints = [NSLayoutConstraint
                                          constraintWithItem:self.bottomTextField
                                          attribute:NSLayoutAttributeHeight
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:nil
                                          attribute:NSLayoutAttributeHeight                                                       multiplier:0.0
                                          constant:40];
  //[self.view addConstraints:];
  [NSLayoutConstraint activateConstraints:@[self.bottomTextFieldLeadingContraints, self.bottomTextFieldTrailingContraints,self.bottomTextFieldTopContraints, self.bottomTextFieldBottomContraints]];
  
}



-(void) cancelButtonTapped {
  [self.navigationController popViewControllerAnimated:true];
}

-(void) saveButtonTapped {
  NSString *comName = [self.topTextField text];
  NSString *comStock = [self.middleTextField text];
  NSString *compImgURL = [self.bottomTextField text];
  
  if (comName != nil && comStock != nil && compImgURL != nil) {
    NSLog(@"Sel");
    Company *comp = [[Company alloc] initWithName:comName stockTick:comStock downloadURL:compImgURL];
    [self.dataAccessObject addNewCompany: comp];
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
  
  [NSLayoutConstraint deactivateConstraints:@[self.bottomTextFieldLeadingContraints, self.bottomTextFieldTrailingContraints,self.bottomTextFieldTopContraints, self.bottomTextFieldBottomContraints]];
  [NSLayoutConstraint deactivateConstraints:@[self.middleTextFieldLeadingContraints, self.middleTextFieldTrailingContraints,self.middleTextFieldTopContraints, self.middleTextFieldBottomContraints]];
  
  [self addMiddleTextFieldContraints:self.middleTop];
  [self addBottomTextFieldContraints:self.bottomTop];
  [UIView animateWithDuration:0.7
                   animations:^{
                     [self.topView layoutIfNeeded]; // Called on parent view
                   }];
  
  
  //
  //  [self.middleTextField setNeedsLayout];
  // [self.bottomTextField setNeedsLayout];
  
  
  
  
  NSLog(@"Keyboard show");
  
  // Assign new frame to your view
  // [self.addTopView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 110)]; //here taken -110 for example i.e. your view will be scrolled to -110. change its value according to your requirement.
  
}

-(void)keyboardDidHide:(NSNotification *)notification
{
  // [self.addTopView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
  self.bottomTop = 400;
  [self addBottomTextFieldContraints:self.bottomTop];
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
  [_topTextField release];
  [_middleTextField release];
  [_bottomTextField release];
  [super dealloc];
}
@end

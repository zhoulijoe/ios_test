#import "ZLIConstraintInCodeVC.h"

@implementation ZLIConstraintInCodeVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(30, 84, 260, 400)];
    v1.backgroundColor = [UIColor colorWithRed:1 green:0.4 blue:1 alpha:1];
    UIView* v2 = [UIView new];
    v2.backgroundColor = [UIColor colorWithRed:.5 green:1 blue:0 alpha:1];
    UIView* v3 = [UIView new];
    v3.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];

    [self.view addSubview:v1];
    [v1 addSubview:v2];
    [v1 addSubview:v3];
    v2.translatesAutoresizingMaskIntoConstraints = NO;
    v3.translatesAutoresizingMaskIntoConstraints = NO;

    [v1 addConstraint:
     [NSLayoutConstraint constraintWithItem:v2
                                  attribute:NSLayoutAttributeLeft
                                  relatedBy:0
                                     toItem:v1
                                  attribute:NSLayoutAttributeLeft
                                 multiplier:1
                                   constant:0]];
    [v1 addConstraint:
     [NSLayoutConstraint
      constraintWithItem:v2 attribute:NSLayoutAttributeRight
      relatedBy:0
      toItem:v1 attribute:NSLayoutAttributeRight
      multiplier:1 constant:0]];
    [v1 addConstraint:
     [NSLayoutConstraint
      constraintWithItem:v2 attribute:NSLayoutAttributeTop
      relatedBy:0
      toItem:v1 attribute:NSLayoutAttributeTop
      multiplier:1 constant:0]];
    [v2 addConstraint:
     [NSLayoutConstraint
      constraintWithItem:v2 attribute:NSLayoutAttributeHeight
      relatedBy:0
      toItem:nil attribute:0
      multiplier:1 constant:10]];
    [v3 addConstraint:
     [NSLayoutConstraint
      constraintWithItem:v3 attribute:NSLayoutAttributeWidth
      relatedBy:0
      toItem:nil attribute:0
      multiplier:1 constant:20]];
    [v3 addConstraint:
     [NSLayoutConstraint
      constraintWithItem:v3 attribute:NSLayoutAttributeHeight
      relatedBy:0
      toItem:nil attribute:0
      multiplier:1 constant:20]];
    [v1 addConstraint:
     [NSLayoutConstraint
      constraintWithItem:v3 attribute:NSLayoutAttributeRight
      relatedBy:0
      toItem:v1 attribute:NSLayoutAttributeRight
      multiplier:1 constant:0]];
    [v1 addConstraint:
     [NSLayoutConstraint
      constraintWithItem:v3 attribute:NSLayoutAttributeBottom
      relatedBy:0
      toItem:v1 attribute:NSLayoutAttributeBottom
      multiplier:1 constant:0]];
}

@end

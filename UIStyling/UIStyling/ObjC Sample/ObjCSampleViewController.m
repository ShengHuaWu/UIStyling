//
//  ObjCSmapleViewController.m
//  UIStyling
//
//  Created by ShengHua Wu on 19.08.18.
//  Copyright © 2018 ShengHua Wu. All rights reserved.
//

#import "ObjCSampleViewController.h"
#import "UIStyling-Swift.h"

@interface ObjCSampleViewController ()

@end

@implementation ObjCSampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Do Something" forState:UIControlStateNormal];
    [button setActionRoundedStyle];
    [self.view addSubview:button];
    [self.view addConstraints:@[
        [button.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:32],
        [button.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:16],
        [button.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-16],
        [button.heightAnchor constraintEqualToConstant:44] ]];
}

@end

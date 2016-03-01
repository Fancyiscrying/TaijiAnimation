//
//  ViewController.m
//  TaijiAnimation
//
//  Created by Fancy on 16/2/29.
//  Copyright © 2016年 Fancy. All rights reserved.
//

#import "ViewController.h"
#import "TaijiView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    taiji = [[TaijiView alloc] initWithFrame:CGRectMake(50.0f, 80.0f, 230.0f, 320.0f)];
    [self.view addSubview:taiji];
    

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

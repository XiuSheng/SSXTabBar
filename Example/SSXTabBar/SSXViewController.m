//
//  SSXViewController.m
//  SSXTabBar
//
//  Created by sishengxiu@gmail.com on 05/23/2018.
//  Copyright (c) 2018 sishengxiu@gmail.com. All rights reserved.
//

#import "SSXViewController.h"

@interface SSXViewController ()

@end

@implementation SSXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"leftTest" style:UIBarButtonItemStyleDone target:self action:@selector(leftClick)];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
}

- (void)leftClick{
    NSLog(@"test");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

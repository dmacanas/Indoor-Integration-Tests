//
//  VisoViewController.m
//  IndoorTest
//
//  Created by Dominic Macanas on 3/6/17.
//  Copyright © 2017 MeetBall. All rights reserved.
//

#import "VisoViewController.h"

@interface VisoViewController ()

@end

@implementation VisoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.mapView loadMap];
    [self setTitle:@"Visioglobe"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    self.view
//    CGContextFlush(ctx);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

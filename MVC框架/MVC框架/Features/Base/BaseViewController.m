//
//  BaseViewController.m
//  BJNurse
//
//  Created by boocca on 16/12/2.
//  Copyright © 2016年 李爽. All rights reserved.
//

#import "BaseViewController.h"


@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

}



- (void)isNetworkEnable {
    if (![CoreStatus isNetworkEnable]) {
        [self showHint:@"好像没有网络哦"];
        return;
    }
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

@end

//
//  BYNavigationController.m
//  布医医护
//
//  Created by 康帅 on 16/3/1.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#import "BYNavigationController.h"

@interface BYNavigationController ()
@end
@implementation BYNavigationController
- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self configUI];
}

/**
 * 设置UI
 */
- (void)configUI{
    
    self.navigationBar.barTintColor=[UIColor whiteColor];
    /*
     ** 设置导航栏不透明
     */
    self.navigationController.navigationBar.translucent = YES;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    //设置导航栏标题的字体颜色和大小
    [self.navigationBar setTitleTextAttributes:
     
     @{NSFontAttributeName:[UIFont boldSystemFontOfSize:19],
       NSForegroundColorAttributeName:[UIColor blackColor]}];
}


/**
 *  重写这个方法目的：能够拦截所有push进来的控制器
 *
 *  @param viewController 即将push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        /* 自动显示和隐藏tabbar */
        viewController.hidesBottomBarWhenPushed = YES;
        
        /* 设置导航栏上面的内容 */
        // 设置左边的返回按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"BACK" highImage:@"BACK"];
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back {
#warning 这里要用self，不是self.navigationController
    // 因为self本来就是一个导航控制器，self.navigationController这里是nil的
    [self popViewControllerAnimated:YES];
}

- (void)more
{
    [self popToRootViewControllerAnimated:YES];
}

@end

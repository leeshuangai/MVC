//
//  BYTabbarController.m
//  布医医护
//
//  Created by 康帅 on 16/3/1.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#import "BYTabbarController.h"
#import "UIBarButtonItem+Extension.h"
#import "BYNavigationController.h"
#import "MyViewController.h"
#import "TaskViewController.h"
#import "WalletViewController.h"
#define TabbarItemNums 2.0
@interface BYTabbarController ()
{
    UIView *tabview;
}
@end

@implementation BYTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置自定义的tabbar的背景颜色
    UIView *backView = [[UIView alloc] init];
    backView.frame=CGRectMake(0, 0, SCREEN_WIDTH, 49);
    backView.backgroundColor =[UIColor whiteColor];
    [self.tabBar insertSubview:backView atIndex:0];
    self.tabBar.opaque = YES;
    
    //1.初始化子控制器
     TaskViewController *home = [[TaskViewController alloc] init];
    [self addChildVc:home title:@"任务" image:@"task" selectedImage:@"taskpress"];
    
    WalletViewController *Wallet=[[WalletViewController alloc]init];
    [self addChildVc:Wallet title:@"钱包" image:@"money" selectedImage:@"moneypress"];
    
    MyViewController *messare = [[MyViewController alloc] init];
    [self addChildVc:messare title:@"我的" image:@"mine" selectedImage:@"minepress"];
}




/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = StyleColor;
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    // 先给外面传进来的小控制器 包装 一个导航控制器
    BYNavigationController *nav = [[BYNavigationController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [self addChildViewController:nav];
}


@end

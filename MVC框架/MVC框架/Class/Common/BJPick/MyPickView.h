//
//  MyPickView.h
//  布医医护
//
//  Created by 康帅 on 16/4/6.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MyPickDelegate <NSObject>
@optional
-(void)didSelectIndex:(NSInteger)index;
@end

@interface MyPickView : UIView<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>{
    UITableView *view;
    UIButton *selsectapily;
    UIButton *selsectweichat;
}
-(id)initWithlist:(NSArray *)list height:(CGFloat)height AndNum:(int)i AndData:(NSArray *)arr AndTitle:(NSString *)title;
- (void)showInView:(UIViewController *)Sview;
@property(nonatomic,assign) id <MyPickDelegate> delegate;
@end

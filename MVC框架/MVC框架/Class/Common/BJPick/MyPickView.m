//
//  MyPickView.m
//  布医医护
//
//  Created by 康帅 on 16/4/6.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#import "MyPickView.h"
#define RGBACOLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
@interface MyPickView()
{
    int num;
    NSArray *data;
    NSString *_title;
}
@end
@implementation MyPickView
- (id)initWithFrame:(CGRect)frame
{
   
    self = [super initWithFrame:frame];
    //self.frame =  CGRectMake(0, -64, SCREEN_WIDTH, SCREEN_HEIGHT);
    if (self) {
        
    }
    return self;
}

-(id)initWithlist:(NSArray *)list height:(CGFloat)height AndNum:(int)i AndData:(NSArray *)arr AndTitle:(NSString *)title{
    self = [super init];
    if(self){
        self.frame =  CGRectMake(0, -64, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.backgroundColor = RGBACOLOR(160, 160, 160, 0);
        /*
         ** 控制弹出界面大小高度
         */
        view = [[UITableView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH,44+66*i) style:UITableViewStylePlain];
        view.dataSource = self;
        view.delegate = self;
        view.scrollEnabled = NO;
        view.separatorStyle=UITableViewCellSeparatorStyleNone;
        [self addSubview:view];
        [self animeData];
        num=i;
        data=[NSArray arrayWithArray:arr];
        _title=title;
    }
    return self;
}

-(void)animeData{
    //self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedCancel)];
    [self addGestureRecognizer:tapGesture];
    tapGesture.delegate = self;
    [UIView animateWithDuration:.25 animations:^{
        self.backgroundColor = RGBACOLOR(160, 160, 160, .4);
        [UIView animateWithDuration:.25 animations:^{
            [view setFrame:CGRectMake(view.frame.origin.x, SCREEN_HEIGHT-view.frame.size.height, view.frame.size.width, view.frame.size.height)];
        }];
    } completion:^(BOOL finished) {
    }];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if([touch.view isKindOfClass:[self class]]){
        return YES;
    }
    return NO;
}

-(void)tappedCancel{
    [UIView animateWithDuration:.25 animations:^{
        [view setFrame:CGRectMake(0, SCREEN_HEIGHT,SCREEN_WIDTH, 0)];
        self.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
           
            [self removeFromSuperview];
        }
    }];
}

- (void)showInView:(UIViewController *)Sview
{
     [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    if(Sview==nil){
        // 当前顶层窗口
        UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
        [window.rootViewController.view addSubview:self];
    }else{
        [Sview.view addSubview:self];
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    /*
     ** 设置工具条
     */
    UIView *tools=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    tools.backgroundColor=StyleColor;

    UILabel *title=[[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-150)/2, 0, 150, 44)];
    title.text=_title;
    title.textColor=[UIColor whiteColor];
    title.textAlignment=NSTextAlignmentCenter;
    title.font=FONT16;
    
    UIView *head=[[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH,44*6) ];
    head.backgroundColor=[UIColor whiteColor];
    
    /*
     ** 设置支付方式的选择
     */
    for (int j=0; j<num; j++) {
        UIButton *btn=[[UIButton alloc]init];
        btn.frame=CGRectMake(0, (44+66*j), SCREEN_WIDTH, 66);
        btn.backgroundColor=[UIColor whiteColor];
        btn.titleLabel.font=FONT16;
        btn.titleLabel.textAlignment=NSTextAlignmentCenter;
        btn.tag=j;
        [btn setTitle:data[j] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithR:120 G:120 B:120 A:1] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [head addSubview:btn];
    }
    /*
     ** 添加分割线
     */
    for (int j=0; j<num-1; j++) {
        UIView *sepera=[[UIView alloc]initWithFrame:CGRectMake(0, 44+66*(j+1)-1, SCREEN_WIDTH, 1)];
        sepera.backgroundColor=BJColor(241, 242, 244);
        [head addSubview:sepera];
    }
    [tools addSubview:title];
    [head addSubview:tools];
    
    return head;
}
-(void)clickcancle
{
    [self tappedCancel];
    
}

-(void)clicksure
{
    [self tappedCancel];
}

-(void)clickBtn:(UIButton *)sender
{
    [self tappedCancel];
        if(_delegate!=nil && [_delegate respondsToSelector:@selector(didSelectIndex:)]){
            [_delegate didSelectIndex:sender.tag];
            return;
        }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}
/*
 ** 不影响弹出view的大小高度
 */
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44+66*num;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
}
@end

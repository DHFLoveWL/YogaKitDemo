//
//  ViewController.m
//  YogaKitDemo
//
//  Created by 潜水的鱼儿的IMac on 2021/12/7.
//

#import "ViewController.h"

#import "UIView+Yoga.h"
#import "menuViewController.h"
#define UI_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define UI_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define Mode1Arr @[@"门票", @"酒店", @"周边游", @"民宿客栈", @"国际酒店", @"周边精选"]
#define Mode2Arr @[@"机票", @"国际机票", @"火车票", @"极速抢票", @"汽车票", @"用车*接送机"]
#define Mode3Arr @[@"出境游", @"邮轮", @"国内游", @"攻略游记"]
#define Mode4Arr @[@"金融理财", @"保险", @"贷款*分期游"]

#define paddingNo   3
#define marginNo    .5f
#define columnNo    3
#define btnHeight   62
#define btnWidth    ((UI_SCREEN_WIDTH - paddingNo*2 - columnNo*marginNo*2) / columnNo)
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //模块1
    UIView *boxView1 = [[UIView alloc]init];
    [self.view addSubview:boxView1];
    [boxView1 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;//设置布局方向为水平布局
        layout.padding = YGPointValue(paddingNo);//设置内间距
        layout.flexWrap = YGWrapWrap;//自动换行
        layout.height = YGPointValue(btnHeight*2+marginNo*2*2+paddingNo*2);
    }];
    //模块1容器添加button
    for (int i = 0; i<Mode1Arr.count; i++) {
        UIButton *btn = [self createBtnWithTitle:Mode1Arr[i] BackgroundColor:[UIColor systemPinkColor] ImageIndex:i+1];
        [boxView1 addSubview:btn];
        
        [btn configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.width = YGPointValue(btnWidth);
            layout.height = YGPointValue(btnHeight);
            layout.margin = YGPointValue(marginNo);
        }];
    }
    
    // 模块2
    
    UIView *boxView2 =  [[UIView alloc]init];
    [self.view addSubview:boxView2];
    [boxView2 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
       
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;
        layout.padding = YGPointValue(paddingNo);
        layout.flexWrap = YGWrapWrap;
        
    }];
    //模块2的按钮
    for (int i = 0; i<Mode2Arr.count; i++) {
        UIButton *btn = [self createBtnWithTitle:Mode2Arr[i] BackgroundColor:[UIColor systemGreenColor] ImageIndex:(i+(int)Mode1Arr.count)];
        [boxView2 addSubview:btn];
        [btn configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
           
            layout.isEnabled = YES;
            layout.width = YGPointValue(btnWidth);
            layout.height = YGPointValue(btnHeight);
            layout.margin = YGPointValue(marginNo);
        }];
        
        
        
    }
    
    //模块3
    UIView * boxView3 = [[UIView alloc]init];
    [self.view addSubview:boxView3];
    
    [boxView3 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
    
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;
        layout.padding = YGPointValue(paddingNo);

    }];
    
    //大的按钮
    UIButton *bigBtn = [self createBtnWithTitle:@"旅游" BackgroundColor:[UIColor systemTealColor] ImageIndex:(int)(Mode1Arr.count +Mode2Arr.count)];
    [boxView3 addSubview:bigBtn];
    [bigBtn configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
       
        layout.isEnabled = YES;
        layout.width = YGPointValue(btnWidth);
        layout.height = YGPointValue(btnHeight*2+marginNo*2);
        layout.margin = YGPointValue(marginNo);
    }];
    //右边的视图
    
    UIView *boxRightView3  = [[UIView alloc]init];
    [boxView3 addSubview:boxRightView3];
    [boxRightView3 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;
//        layout.padding = YGPointValue(<#CGFloat value#>)
        layout.flexWrap = YGWrapWrap;
        layout.width = YGPointValue(UI_SCREEN_WIDTH/columnNo*(columnNo-1));
        
    }];
    
    //右边的小按钮
    for (int i = 0; i<Mode3Arr.count; i++) {
        
        UIButton *btn = [self createBtnWithTitle:Mode3Arr[i] BackgroundColor:[UIColor systemTealColor] ImageIndex:(int)(Mode1Arr.count +Mode2Arr.count+i+1)];
        
        [boxRightView3 addSubview:btn];
        [btn configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
           
            layout.isEnabled = YES;
            layout.width = YGPointValue(btnWidth);
            layout.height = YGPointValue(btnHeight);
            layout.margin = YGPointValue(marginNo);
        }];
        
    }
    
    
    //模块4
    UIView * boxView4 = [[UIView alloc]init];
    [self.view addSubview:boxView4];
    
    [boxView4 configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
    
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;
        layout.padding = YGPointValue(paddingNo);

    }];
    
    for (int i = 0; i<Mode4Arr.count; i++) {
        
        UIButton *btn = [self createBtnWithTitle:Mode4Arr[i] BackgroundColor:[UIColor systemPurpleColor] ImageIndex:(int)(Mode1Arr.count +Mode2Arr.count+Mode4Arr.count+i+1)];
        
        [boxView4 addSubview:btn];
        
        [btn configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.width = YGPointValue(btnWidth);
            layout.height = YGPointValue(btnHeight);
            layout.margin = YGPointValue(marginNo);
        }];
    }
    
    
    
    //主界面设置Layout
    [self.view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.paddingTop = YGPointValue(100);//距离屏幕顶部的高度
    }];

    [self.view.yoga applyLayoutPreservingOrigin:YES];//父视图执行布局计算并使用结果更新层次结构中视图的帧
}
- (UIButton *)createBtnWithTitle:(NSString *)title BackgroundColor:(UIColor *)color ImageIndex:(int)index {
    UIButton *commonBtn = [[UIButton alloc] init];
    [commonBtn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"btnImg_%d", index]] forState:UIControlStateNormal];
    commonBtn.backgroundColor = color;
    [commonBtn setTitle:title forState:UIControlStateNormal];
    [commonBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    commonBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    commonBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [commonBtn setTitleEdgeInsets:UIEdgeInsetsMake(index==12?-btnHeight:0, 10, 0, 0)];
    [commonBtn addTarget:self action:@selector(commonBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return commonBtn;
}

- (void)commonBtnAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    UIViewAnimationTransition tra = sender.selected?UIViewAnimationTransitionFlipFromLeft:UIViewAnimationTransitionFlipFromRight;
    [UIView animateWithDuration:.35 animations:^{
        [UIView setAnimationTransition:tra forView:sender cache:YES];
       

    }];
}
- (IBAction)pushAction:(id)sender {
    [self.navigationController pushViewController:[menuViewController new] animated:YES];
}

@end

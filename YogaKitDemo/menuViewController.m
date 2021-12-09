//
//  menuViewController.m
//  YogaKitDemo
//
//  Created by 潜水的鱼儿的IMac on 2021/12/9.
//

#import "menuViewController.h"
#import "UIView+Yoga.h"

#define UI_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define UI_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define paddingNo   3
#define marginNo    .5f
#define columnNo    4
#define btnHeight   62
#define btnWidth    ((UI_SCREEN_WIDTH - paddingNo*2 - columnNo*marginNo*2) / columnNo)
@implementation menuViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *arr = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
    
    UIView *templateView = [[UIView alloc] init];
//    templateView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:templateView];
    [templateView configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;
        layout.height = YGPointValue(40*(arr.count/3));
        layout.width = YGPointValue(UI_SCREEN_WIDTH);
        layout.flexWrap = YGWrapWrap;
        layout.padding = YGPointValue(3);
    }];

    for (NSString *str in arr) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor yellowColor];
        [templateView addSubview:view];
        [view configureLayoutWithBlock:^(YGLayout * layout) {
            layout.isEnabled = YES;
            layout.width = YGPointValue(UI_SCREEN_WIDTH/3-4);
            layout.height = YGPointValue(40);
            layout.margin = YGPointValue(1);
        }];

        UILabel *lbl = [[UILabel alloc] init];
        lbl.text = str;
        lbl.textAlignment = NSTextAlignmentCenter;
        [lbl configureLayoutWithBlock:^(YGLayout * layout) {
            layout.isEnabled = YES;
            layout.flexGrow = 1.0;
//            layout.padding = YGPointValue(0);
        }];
        [view addSubview:lbl];
    }
    [self.view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.paddingTop = YGPointValue(100);
    }];
    [self.view.yoga applyLayoutPreservingOrigin:YES];
    
}

@end

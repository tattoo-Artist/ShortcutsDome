//
//  CYTabBarController.m
//  ShortCutsDome
//
//  Created by zcy on 2018/9/19.
//  Copyright © 2018年 CY. All rights reserved.
//

#import "CYTabBarController.h"
#import "ViewController.h"
#import "CYViewController1.h"

@interface CYTabBarController ()

@end

@implementation CYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化子控制器
    [self addSubViews];
    
}

#pragma mark - custom method

- (void)addSubViews{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 49)];
    backView.backgroundColor = [UIColor clearColor];
    [self.tabBar insertSubview:backView atIndex:0];
    self.tabBar.opaque = YES;
    
    ViewController *VC1 = [[ViewController alloc] init];
    [self addChildVc:VC1 title:@"设置" tabBarItemTitle:@"" image:@"jp_btn" selectedImage:@"jp_img"];
    
    CYViewController1 *VC2 = [[CYViewController1 alloc] init];
    [self addChildVc:VC2 title:@"去提现" tabBarItemTitle:@"" image:@"jp_btn" selectedImage:@"jp_img"];
    
}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title tabBarItemTitle:(NSString *)itemTitle image:(NSString *)image selectedImage:(NSString *)selectedImage{
    //导航栏跟tabitem的标题一次性设置
    childVc.title = title;
    childVc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.title = itemTitle;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
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

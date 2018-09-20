//
//  CYViewController1.m
//  ShortCutsDome
//
//  Created by zcy on 2018/9/19.
//  Copyright © 2018年 CY. All rights reserved.
//

#import "CYViewController1.h"
#import "CYSiriFinishController.h"

@interface CYViewController1 ()

@end

@implementation CYViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn2.frame = CGRectMake(100, 300, 100, 30);
    [btn2 setTitle:@"去提现" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(gotoFinishAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
}

- (void)gotoFinishAction{
    CYSiriFinishController *siriVC = [[CYSiriFinishController alloc] initWithNibName:@"CYSiriFinishController" bundle:nil];
    [self.navigationController pushViewController:siriVC animated:YES];
    
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

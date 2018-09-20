//
//  ViewController.m
//  ShortCutsDome
//
//  Created by zcy on 2018/9/19.
//  Copyright © 2018年 CY. All rights reserved.
//

#import "ViewController.h"
#import <CoreSpotlight/CoreSpotlight.h>
#import <Intents/Intents.h>
#import "CYWithdrowIntent.h"
#import <IntentsUI/IntentsUI.h>

@interface ViewController ()<INUIAddVoiceShortcutViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self donateSportActivity];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn2.frame = CGRectMake(100, 300, 100, 30);
    [btn2 setTitle:@"设置语音捷径" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(gotoAddCustomVoiceShortcutView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
 
}


//此方法返回一个 NSUserActivity 对象。
- (void)donateSportActivity{
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:@"com.test.ShortCutsDome-sports"];
    userActivity.eligibleForSearch = YES;
    userActivity.title = @"提现";
    if (@available(iOS 12.0, *)) {
        userActivity.eligibleForPrediction = YES;// 新属性，赋值为 true 后可以暴露给 `SiriKit`
        userActivity.suggestedInvocationPhrase = @"我要开始提现了";//搜索的关键字
    }
    CSSearchableItemAttributeSet * attributes = [[CSSearchableItemAttributeSet alloc] init];
    UIImage *icon = [UIImage imageNamed:@"searchIcon_60.png"];
    attributes.thumbnailData = UIImagePNGRepresentation(icon);
    attributes.contentDescription = @"提现捷径";
    userActivity.contentAttributeSet = attributes;
    self.userActivity = userActivity;//self 为controller
    
}


- (void)gotoAddCustomVoiceShortcutView {
    CYWithdrowIntent *intent = [[CYWithdrowIntent alloc] init];
    intent.money = @"1200.00元";
    intent.suggestedInvocationPhrase = @"我想提现";//提示用户
    INUIAddVoiceShortcutViewController *vc = [[INUIAddVoiceShortcutViewController alloc] initWithShortcut:[[INShortcut alloc] initWithIntent:intent]];
    vc.delegate = self;
    [self presentViewController:vc animated:YES completion:^{
    }];
    
}


- (void)addVoiceShortcutViewControllerDidCancel:(INUIAddVoiceShortcutViewController *)controller{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)addVoiceShortcutViewController:(INUIAddVoiceShortcutViewController *)controller didFinishWithVoiceShortcut:(INVoiceShortcut *)voiceShortcut error:(NSError *)error{
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

#pragma 删除

- (void)deleteUserActivity{
    [NSUserActivity deleteSavedUserActivitiesWithPersistentIdentifiers:@[@"com.test.ShortCutsDome-sportse"] completionHandler:^{
    }];
    
    [NSUserActivity deleteAllSavedUserActivitiesWithCompletionHandler:^{
    }];
    
    [INInteraction deleteInteractionsWithIdentifiers:@[@"ur id"] completion:^(NSError * _Nullable error) {
        ;
    }];
    [INInteraction deleteAllInteractionsWithCompletion:^(NSError * _Nullable error) {
        ;
    }];
    [INInteraction deleteInteractionsWithGroupIdentifier:@"ur group id" completion:^(NSError * _Nullable error) {
        ;
    }];
}

@end

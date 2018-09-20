//
//  CYWithdrowIntentHandler.m
//  ShortCutsDome
//
//  Created by zcy on 2018/9/19.
//  Copyright © 2018年 CY. All rights reserved.
//

#import "CYWithdrowIntentHandler.h"

@implementation CYWithdrowIntentHandler

- (void)confirmWithdrow:(CYWithdrowIntent *)intent completion:(void (^)(CYWithdrowIntentResponse * _Nonnull))completion{
    NSLog(@"confirmWithdrow");

}

- (void)handleWithdrow:(CYWithdrowIntent *)intent completion:(void (^)(CYWithdrowIntentResponse * _Nonnull))completion{
    NSLog(@"handleWithdrow");

}

@end

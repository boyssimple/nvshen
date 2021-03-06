//
//  ILSettingTableViewController.m
//  ItheimaLottery
//
//  Created by apple on 14-9-9.
//  Copyright (c) 2014年 Hoolang. All rights reserved.
//

#import "HLSettingTableViewController.h"
#import "HLSettingCell.h"
#import "HLSettingItem.h"
#import "HLSettingArrowItem.h"
#import "HLSettingSwitchItem.h"
#import "HLSettingGroup.h"
#import "HLTestViewController.h"
#import "MBProgressHUD+MJ.h"
#import "HLProductViewController.h"
#import "HLPushNoticeController.h"
#import "HLHelpViewController.h"
#import "HLShareViewController.h"
#import "HLAboutViewController.h"
#import "HLHttpTool.h"

@interface HLSettingTableViewController ()


@end

@implementation HLSettingTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 0组
    [self addGroup0];
    
    // 1组
    [self addGroup1];
}
- (void)addGroup1
{
    // 1组
    HLSettingItem *newVersion = [HLSettingArrowItem itemWithIcon:@"MoreUpdate" title:@"检查新版本"];
    // 保存了一段检查更新的功能
    newVersion.option = ^{
//        // 1.显示蒙板
//        [MBProgressHUD showMessage:@"正在检查ing......."];
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            // 2.隐藏蒙板
//            [MBProgressHUD hideHUD];
//            
//            // 3.提示用户
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"有更新版本" message:nil delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"立即更新", nil];
//            // 显示UIAlertView
//            [alert show];
//            
//        });
        
        // 2.发送请求
//        [HLHttpTool get:CHECK_VERSION_URL
//                 params:nil success:^(id json) {
//                     
//                     HLLog(@"version json:%@", json);
//                     
//                 } failure:^(NSError *error) {
//                     HLLog(@"请求失败-%@", error);
//                     [MBProgressHUD showError:@"网络异常，请稍微再试！"];
//                 }];
        
    };
//    HLSettingItem *help = [HLSettingArrowItem itemWithIcon:@"MoreHelp" title:@"帮助" destVcClass:[HLHelpViewController class]];
    
    HLSettingItem *MoreShare = [HLSettingArrowItem itemWithIcon:@"MoreShare" title:@"分享" destVcClass:[HLShareViewController class]];
//    HLSettingItem *MoreMessage = [HLSettingArrowItem itemWithIcon:@"MoreMessage" title:@"查看消息" destVcClass:[HLTestViewController class]];
    //HLSettingItem *MoreNetease = [HLSettingArrowItem itemWithIcon:@"MoreNetease" title:@"产品推荐" destVcClass:[HLProductViewController class]];
    HLSettingItem *MoreAbout = [HLSettingArrowItem itemWithIcon:@"MoreAbout" title:@"关于" destVcClass:[HLAboutViewController class]];
    
    HLSettingGroup *group1 = [[HLSettingGroup alloc] init];
    //group1.header = @"帮助";
    group1.items = @[newVersion,MoreShare,MoreAbout];
    

    [self.dataList addObject:group1];
}

- (void)addGroup0
{
    // 0组
    HLSettingArrowItem *pushNotice = [HLSettingArrowItem itemWithIcon:@"MorePush" title:@"推送和提醒" destVcClass:[HLPushNoticeController class]];
    
    
    HLSettingItem *yaoyiyao = [HLSettingSwitchItem itemWithIcon:@"handShake" title:@"摇一摇机选"];
    
    HLSettingItem *sound = [HLSettingSwitchItem itemWithIcon:@"sound_Effect" title:@"声音效果"];
    
    
    HLSettingGroup *group0 = [[HLSettingGroup alloc] init];
    group0.items = @[pushNotice,yaoyiyao,sound];
    
    [self.dataList addObject:group0];
}

/**
 *  检查新版本
 */
- (void)checkVersion:(NSString *)result
{

    //"version":"1.0"
//    NSRange substr = [result rangeOfString:@"\"version\":\""];
//    NSRange substr2 =[result rangeOfString:@"\"" options:NULL range:NSRange{substr.location+substr.length,10}];
//    NSRange range = {substr.location+substr.length,substr2.location-substr.location-substr.length};
//    NSString *newVersion =[file substringWithRange:range];
//    if([nowVersion isEqualToString:newVersion]==NO)
//    {
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"版本有更新" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"更新", nil];
//        [alert show];
//    }
    
}
@end

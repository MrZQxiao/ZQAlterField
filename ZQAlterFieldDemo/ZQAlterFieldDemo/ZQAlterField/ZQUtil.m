//
//  ZQUtil.m
//  ZQAlterTextField
//
//  Created by 肖兆强 on 2018/2/6.
//  Copyright © 2018年 ZQ. All rights reserved.
//

#import "ZQUtil.h"
#import "MBProgressHUD.h"

@implementation ZQUtil

+ (void)msgHint:(NSString *)msg {
    
    NSArray *windows = [UIApplication sharedApplication].windows;
    UIWindow *window;
    if ([windows count] > 1) {
        window = [windows objectAtIndex:1];
    } else {
        window = [windows objectAtIndex:0];
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.labelText = msg;
    hud.margin = 20.0f;
    hud.yOffset = 25.0f;
    hud.opacity = 0.8f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1];
}



@end

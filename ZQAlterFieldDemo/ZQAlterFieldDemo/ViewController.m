//
//  ViewController.m
//  ZQAlterFieldDemo
//
//  Created by 肖兆强 on 2018/2/6.
//  Copyright © 2018年 ZQ. All rights reserved.
//

#import "ViewController.h"
#import "ZQAlterField.h"
#import "ZQUtil.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)showZQAlterField:(id)sender {
    
    ZQAlterField *alertView = [ZQAlterField alertView];
    alertView.placeholder = @"请输入20位激活码";
    alertView.title = @"激活码激活";
    alertView.Maxlength = 20;
    alertView.intervalNum = 5;
    alertView.intervalStr = @"*";
    //    alertView.titleColor = [UIColor redColor];
    //    alertView.ensureBgColor = [UIColor greenColor];
    //    alertView.textFieldBgColor = [UIColor blueColor];
    //    alertView.textColor = [UIColor whiteColor];
    
    [alertView ensureClickBlock:^(NSString *inputString) {
        NSLog(@"输入内容为%@",inputString);
        [ZQUtil msgHint:inputString];
    }];
    [alertView show];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

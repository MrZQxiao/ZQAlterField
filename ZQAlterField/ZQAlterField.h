//
//  ZQAlterField.h
//  ZQAlterFieldDemo
//
//  Created by 肖兆强 on 2018/2/6.
//  Copyright © 2018年 ZQ. All rights reserved.
//

#import <UIKit/UIKit.h>
//输入内容回调
typedef void(^ensureCallback)(NSString *inputString);


@interface ZQAlterField : UIView
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *textFieldBG;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UIButton *ensureBtn;


/**
 按钮颜色
 */
@property (nonatomic, strong) UIColor *ensureBgColor;

/**
 输入框背景色
 */
@property (nonatomic, strong) UIColor *textFieldBgColor;


/**
 字体颜色
 */
@property (nonatomic, strong) UIColor *textColor;

/**
 标题颜色
 */
@property (nonatomic, strong) UIColor *titleColor;

/**
 标题
 */
@property (nonatomic,copy)NSString *title;

/**
 placeholder
 */
@property (nonatomic, strong) NSString *placeholder;


/**
 间隔
 */
@property (nonatomic,assign)NSInteger intervalNum;


/**
 间隔符，需设置intervalNum后生效
 */
@property (nonatomic,copy)NSString *intervalStr;


/**
 最大输入字符
 */
@property (nonatomic,assign)NSInteger Maxlength;


/**
 初始化
 */
+ (instancetype)alertView;


/**
 显示
 */
- (void)show;
/**
 隐藏
 */
- (void)dismiss;

/**
 结果回调
 */
- (void)ensureClickBlock:(ensureCallback) block;



@end

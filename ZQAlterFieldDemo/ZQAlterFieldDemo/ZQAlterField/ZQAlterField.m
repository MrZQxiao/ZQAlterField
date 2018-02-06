//
//  ZQAlterField.m
//  ZQAlterFieldDemo
//
//  Created by 肖兆强 on 2018/2/6.
//  Copyright © 2018年 ZQ. All rights reserved.
//

#import "ZQAlterField.h"
#import "ZQUtil.h"
#define kZLPhotoBrowserBundle [NSBundle bundleForClass:[self class]]

#define ZQWindow [UIApplication sharedApplication].keyWindow

@interface ZQAlterField ()<UITextFieldDelegate>

/**
 回调block
 */
@property (nonatomic, copy) ensureCallback ensureBlock;

/**
 蒙板
 */
@property (nonatomic, weak) UIView *becloudView;


@end



@implementation ZQAlterField

+ (instancetype)alertView
{
    return [[kZLPhotoBrowserBundle loadNibNamed:@"ZQAlterField" owner:self options:nil] lastObject];;
}
- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setCornerRadius:self];
    [self setCornerRadius:self.ensureBtn];
    [self setCornerRadius:self.textFieldBG];
    
    // 添加点击手势
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(exitKeyboard)];
    [self addGestureRecognizer:tapGR];
    self.textFieldBG.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
    self.textField.delegate = self;
    self.ensureBtn.backgroundColor = [UIColor colorWithRed:42/255.0 green:175/255.0 blue:236/255.0 alpha:1];
}


#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    
    
    
    if ([string isEqualToString:@""]) { // 删除字符
        
        if (_intervalNum>0) {
            if ((textField.text.length-1) % (_intervalNum+1) == 0&&textField.text.length>0) {
                textField.text = [textField.text substringToIndex:textField.text.length - 1];
            }
        }
        return YES;
    } else {
        
        if (_Maxlength>0&&textField.text.length==_Maxlength) {
            [ZQUtil msgHint:[NSString stringWithFormat:@"最多输入%ld位",_Maxlength]];
            return NO;
        }
        if (_intervalNum>0) {
            
            if ((textField.text.length+1) % (_intervalNum+1) == 0&&textField.text.length>0) {
                
                if (_intervalStr.length>0) {
                    textField.text = [NSString stringWithFormat:@"%@%@", textField.text,_intervalStr];
                }else
                {
                    textField.text = [NSString stringWithFormat:@"%@-", textField.text];
                }
                
                return YES;
            }
            
        }
    }
    
    
    return YES;
    
}



#pragma mark - 设置控件圆角
- (void)setCornerRadius:(UIView *)view
{
    
    view.layer.cornerRadius = 5.0;
    view.layer.masksToBounds = YES;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = [placeholder copy];
    self.textField.placeholder = self.placeholder;
}

- (void)setEnsureBgColor:(UIColor *)ensureBgColor
{
    _ensureBgColor = ensureBgColor;
    self.ensureBtn.backgroundColor = ensureBgColor;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabel.text = title;
}

- (void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;
    self.textField.textColor = textColor;
}


-(void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    self.titleLabel.textColor = titleColor;
}


- (void)setTextFieldBgColor:(UIColor *)textFieldBgColor
{
    _textFieldBgColor = textFieldBgColor;
    self.textFieldBG.backgroundColor = textFieldBgColor;
}

- (void)show
{
    // 蒙版
    UIView *becloudView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    becloudView.backgroundColor = [UIColor blackColor];
    becloudView.layer.opacity = 0.3;
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeAlertView:)];
    [becloudView addGestureRecognizer:tapGR];
    
    [ZQWindow addSubview:becloudView];
    self.becloudView = becloudView;
    
    
    
    // 输入框
    self.frame = CGRectMake(0, 0, becloudView.frame.size.width * 0.8, 140);
    self.center = CGPointMake(becloudView.center.x, becloudView.frame.size.height * 0.4);
    [ZQWindow addSubview:self];
    
}

- (void)exitKeyboard
{
    [self endEditing:YES];
}

#pragma mark - 移除ZYInputAlertView
- (void)dismiss
{
    [self removeFromSuperview];
    [self.becloudView removeFromSuperview];
}

#pragma mark - 点击关闭按钮
- (IBAction)closeAlertView:(UIButton *)sender {
    [self dismiss];
}

#pragma mark - 接收传过来的block

- (void)ensureClickBlock:(ensureCallback)block

{
    self.ensureBlock = block;
}

#pragma mark - 点击确认按钮
- (IBAction)ensureBtnClick:(UIButton *)sender {
    
    
    [self dismiss];
    if (self.ensureBlock) {
        self.ensureBlock(self.textField.text);
    }
    
    
}


@end

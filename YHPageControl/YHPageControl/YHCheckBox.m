//
//  WBCheckBox.m
//  WeiBo
//
//  Created by 厉煜寰 on 15/10/25.
//  Copyright © 2015年 SXT. All rights reserved.
//

#import "YHCheckBox.h"

@interface YHCheckBox ()
/**
 *  checkbox按钮
 */
@property (nonatomic, strong) UIButton *checBoxButton;
@end

@implementation YHCheckBox
@synthesize selecte = _selecte;

- (instancetype)init
{
    if (self = [super init]) {
        [self initCheckBoxButton];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initCheckBoxButton];
    }
    return self;
}
+ (instancetype)checkBox
{
    return [[self alloc] init];
}
/**
 *  初始化checkbox按钮
 */
- (void)initCheckBoxButton
{
    self.checBoxButton = [[UIButton alloc]init];
    self.checBoxButton.titleLabel.font = [UIFont systemFontOfSize:15];
    self.checBoxButton.selected = YES;
    _selecte = YES;
    [self.checBoxButton setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [self.checBoxButton setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    [self.checBoxButton setTitle:@"请输入checkbox的文本" forState:UIControlStateNormal];
    [self.checBoxButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.checBoxButton addTarget:self action:@selector(clickCheckbox:) forControlEvents:UIControlEventTouchUpInside];
    self.checBoxButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
}
- (void)layoutSubviews
{
    [self setupCheckBox];
}
#pragma mark overwite setter
- (void)setupCheckBox
{
    self.checBoxButton.frame = self.bounds;
    // 添加checkBox
    [self addSubview:self.checBoxButton];
}
- (void)clickCheckbox:(UIButton *)checkButton
{
    checkButton.selected = !checkButton.isSelected;
    _selecte = !_selecte;
}
- (void)setTitle:(NSString *)title
{
    _title = title;
    [self.checBoxButton setTitle:title forState:UIControlStateNormal];
}
- (void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    [self.checBoxButton setTitleColor:titleColor forState:UIControlStateNormal];
}
- (void)setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
    self.checBoxButton.titleLabel.font = titleFont;
}
@end

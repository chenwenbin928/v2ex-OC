//
//  WTNoLoginView.m
//  v2ex
//
//  Created by 无头骑士 GJ on 2017/4/22.
//  Copyright © 2017年 无头骑士 GJ. All rights reserved.
//

#import "WTNoLoginView.h"
#import "WTLoginViewController.h"
#import "WTRegisterViewController.h"
#import "UIViewController+Extension.h"
@interface WTNoLoginView()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end
@implementation WTNoLoginView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.titleLabel.textColor = [UIColor colorWithHexString: @"#BDBDBD"];
    [self setButtonStateWithBtn: self.registerBtn titleColor: WTSelectedColor];
    [self setButtonStateWithBtn: self.loginBtn titleColor: [UIColor colorWithHexString: @"#727272"]];
}

- (void)setButtonStateWithBtn:(UIButton *)button titleColor:(UIColor *)titleColor
{
    [button setTitleColor: titleColor forState: UIControlStateNormal];
    button.layer.cornerRadius = 3;
    button.layer.borderColor = [UIColor colorWithHexString: @"#CCCCCC"].CGColor;
    button.layer.borderWidth = 1;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabel.text = title;
}

- (IBAction)loginBtnClick
{
    WTLoginViewController *loginVC = [WTLoginViewController new];
    __weak typeof(self) weakSelf = self;
    loginVC.loginSuccessBlock = ^{
        weakSelf.loginSuccessBlock();
    };
    [[UIViewController topVC] presentViewController: loginVC animated: YES completion: nil];
}

- (IBAction)registerBtnClick
{
     [[UIViewController topVC] presentViewController: [WTRegisterViewController new] animated: YES completion: nil];
}

@end

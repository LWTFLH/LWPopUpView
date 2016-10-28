//
//  LWPopView.m
//  MMPopupView
//
//  Created by 李伟 on 16/10/27.
//  Copyright © 2016年 LJC. All rights reserved.
//

#import "LWPopView.h"
#import <Masonry/Masonry.h>
NSString *lwAniamtionKey = @"animationScaleKey";
@interface LWPopView ()

@property (nonatomic, strong) UIButton *confirm;
@property (nonatomic, strong) UIButton *cancel;
@property (nonatomic, strong) UIDynamicAnimator *animator;

@end
@implementation LWPopView

- (UIDynamicAnimator *)animator {

    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    }
    return _animator;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
       
        [self startAnimation];
    }
    return self;
}
//- (instancetype)init {
//
//    self = [super init];
//    if (self) {
//        [self setUpUI];
//        NSLog(@"init");
//    }
//    return self;
//}
- (void)startAnimation {

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = .4;
    animation.repeatCount = 1;
   
    [self.layer addAnimation:animation forKey:lwAniamtionKey];
}

- (void)dropPopView {
    UIGravityBehavior *behavior = [[UIGravityBehavior alloc] init];
    [behavior addItem:self];
    [self.animator addBehavior:behavior];
}

- (void)setUpUI {

    self.clipsToBounds  = YES;
    self.backgroundColor = [UIColor cyanColor];

    self.bgView = [[UIImageView alloc] init];
    self.bgView.contentMode = UIViewContentModeScaleToFill;
   // self.bgView.image = [UIImage imageNamed:@"启动页.png"];
    [self addSubview:self.bgView];

    self.title = [[UILabel alloc] init];
    self.title.textColor = [UIColor whiteColor];
    self.title.textAlignment = NSTextAlignmentCenter;
    self.title.font = [UIFont systemFontOfSize:14];
    // self.title.backgroundColor = [UIColor purpleColor];
    self.title.adjustsFontSizeToFitWidth = YES;
   // self.title.text = self.descrip;
    [self addSubview:self.title];

    self.confirm = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.confirm setBackgroundImage:[UIImage imageNamed:@"confirm.png"] forState:UIControlStateNormal];
    [self.confirm addTarget:self action:@selector(confirmClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.confirm];
    self.cancel = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.cancel setBackgroundImage:[UIImage imageNamed:@"cance.png"] forState:UIControlStateNormal];
    [self.cancel addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.cancel];
     [self layOut];
}
-(void)setBorderWidth:(NSInteger)borderWidth{

    self.layer.borderWidth = borderWidth;
}
-(void)setDescrip:(NSString *)descrip{

    self.title.text  =descrip;
}

-(void)setBackGroundImage:(UIImage *)backGroundImage{

    self.bgView.image = backGroundImage;
}
-(void)setCornerRadius:(NSInteger)cornerRadius{

    self.layer.cornerRadius = 10;
}
-(void)setBorderColor:(UIColor *)borderColor{
    
    self.layer.borderColor = borderColor.CGColor;
}
- (void)layOut {

    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
      //  make.top.bottom.left.right.mas_equalTo(self).offset(0);
        make.centerX.mas_equalTo(0);
       make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width,self.frame.size.height));
    }];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {

        make.leading.mas_equalTo(self).offset(20);
        make.top.mas_equalTo(self).offset(43);
        make.trailing.mas_equalTo(self).offset(-20);
    }];

    [self.confirm mas_makeConstraints:^(MASConstraintMaker *make) {

        make.leading.mas_equalTo(20);
        make.bottom.mas_equalTo(-42);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];

    [self.cancel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self).offset(-20);
        make.bottom.mas_equalTo(-42);
        make.size.mas_equalTo(self.confirm);
    }];
}

- (void)confirmClick:(UIButton *)confirm {
    if ([self.delegate respondsToSelector:@selector(lwPopUpViewDidSelectConfirm:withPopView:)]) {
        [self.delegate lwPopUpViewDidSelectConfirm:confirm withPopView:self];
        [self dropPopView];
    }
}

- (void)cancelClick:(UIButton *)cancel {

    if ([self.delegate respondsToSelector:@selector(lwPopUpViewDidSelectCancel:withPopView:)]) {
        [self.delegate lwPopUpViewDidSelectCancel:cancel withPopView:self];
        [self dropPopView];
    }
}
@end

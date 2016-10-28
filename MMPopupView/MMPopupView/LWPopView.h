//
//  LWPopView.h
//  MMPopupView
//
//  Created by 李伟 on 16/10/27.
//  Copyright © 2016年 LJC. All rights reserved.
//

#import "MMPopupView.h"
@class LWPopView;
@protocol LWPopViewDelagate <NSObject>
@required
-(void)lwPopUpViewDidSelectConfirm:(UIButton *)confirm withPopView:(LWPopView *)popView;
-(void)lwPopUpViewDidSelectCancel:(UIButton *)cancel withPopView:(LWPopView *)popView;
@end
@interface LWPopView : UIView

/**
 *  背景view
 */
@property (nonatomic, strong) UIImageView *bgView;
/**
 *  描述
 */
@property (nonatomic, strong) UILabel *title;
/**
 *  描述信息
 */
@property(nonatomic,strong)NSString *descrip;
/**
 *  背景图片
 */
@property(nonatomic,strong)UIImage *backGroundImage;
/**
 *  圆角
 */
@property(nonatomic,assign)NSInteger cornerRadius;
/**
 *  边框颜色
 */
@property(nonatomic,strong)UIColor *borderColor;
/**
 *  边框宽度
 */
@property(nonatomic,assign)NSInteger borderWidth;
@property(nonatomic,weak)id<LWPopViewDelagate >delegate;
@end

//
//  Pop.m
//  MMPopupView
//
//  Created by 李伟 on 16/10/27.
//  Copyright © 2016年 LJC. All rights reserved.
//
#import "LWPopView.h"
#import "Pop.h"

@interface Pop ()<LWPopViewDelagate>

@end

@implementation Pop
-(void)lwPopUpViewDidSelectConfirm:(UIButton *)confirm withPopView:(LWPopView *)popView{

    NSLog(@"点击确定");
}

-(void)lwPopUpViewDidSelectCancel:(UIButton *)cancel withPopView:(LWPopView *)popView{

    NSLog(@"点击取消");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self UI];
}
-(void)UI{
   
   
    LWPopView *lw = [[LWPopView alloc]initWithFrame:CGRectMake(30, 200, self.view.frame.size.width-60, (self.view.frame.size.width-60)*457/630.0)];
    lw.delegate =self;
    lw.backGroundImage = [UIImage imageNamed:@"启动页.png"];
    lw.descrip = @"是否申请提现XXXXX？";
    lw.cornerRadius = 10;
    lw.borderWidth = 1.0;
    lw.borderColor = [UIColor yellowColor];
    [self.view addSubview:lw];
   // [lw show];
    //[lw showAnimation];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

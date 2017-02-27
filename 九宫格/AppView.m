//
//  AppView.m
//  九宫格
//
//  Created by 王为 on 17/2/27.
//  Copyright © 2017年 王为. All rights reserved.
//

#import "AppView.h"
#import "AppModel.h"

@interface AppView ()

@property (weak, nonatomic) IBOutlet UIImageView *imgViewIcon;
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UIButton *btnDownload;

- (IBAction)btnClick:(UIButton *)sender;

@end

@implementation AppView

-(void)setModel:(AppModel *)model{
    _model = model;
    
    self.imgViewIcon.image = [UIImage imageNamed:model.appicon];
    self.lbName.text = model.appname;
    
    
}

+(instancetype) appView{
    NSBundle *mainBundle = [NSBundle mainBundle];
    
    
    AppView *appView = [[mainBundle loadNibNamed:@"AppView" owner:nil options:nil]lastObject];
    return appView;
}



- (IBAction)btnClick:(UIButton *)sender {
    sender.enabled = NO;
    
    UILabel *lbMsg = [[UILabel alloc]init];
    lbMsg.text = @"正在下载...";
    lbMsg.textColor = [UIColor whiteColor];
    lbMsg.textAlignment = NSTextAlignmentCenter;
    lbMsg.backgroundColor = [UIColor blackColor];
    
    CGFloat viewW = self.superview.frame.size.width;
    CGFloat viewH = self.superview.frame.size.height;
    
    CGFloat msgW = 200;
    CGFloat msgH = 30;
    
    CGFloat msgX = (viewW - msgW) / 2;
    CGFloat msgY = (viewH - msgH) / 2;
    
    
    lbMsg.frame = CGRectMake(msgX, msgY, msgW, msgH);
    lbMsg.alpha = 0.0;
    lbMsg.layer.cornerRadius = 10;
    lbMsg.layer.masksToBounds = YES;
    
    [UIView animateWithDuration:1.0 animations:^{
        lbMsg.alpha = 0.6;
    } completion:^(BOOL finished) {
        if(finished){
            [UIView animateKeyframesWithDuration:1.5 delay:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
                lbMsg.alpha = 0.0;
            } completion:^(BOOL finished) {
                if(finished){
                [lbMsg removeFromSuperview];
                }
            }];
        }
    }];
    
    
    [self.superview addSubview:lbMsg];
}
@end

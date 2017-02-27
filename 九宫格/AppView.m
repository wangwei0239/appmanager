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

@end

@implementation AppView

-(void)setModel:(AppModel *)model{
    _model = model;
    
    self.imgViewIcon.image = [UIImage imageNamed:model.appicon];
    self.lbName.text = model.appname;
    
    
}

@end

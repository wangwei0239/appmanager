//
//  AppView.h
//  九宫格
//
//  Created by 王为 on 17/2/27.
//  Copyright © 2017年 王为. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AppModel;

@interface AppView : UIView 
@property (nonatomic, strong) AppModel *model;

+(instancetype) appView;
@end

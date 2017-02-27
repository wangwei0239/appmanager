//
//  AppModel.h
//  九宫格
//
//  Created by 王为 on 17/2/27.
//  Copyright © 2017年 王为. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppModel : NSObject

@property (nonatomic, copy) NSString *appname;
@property (nonatomic, copy) NSString *appicon;

-(instancetype) initWithDict:(NSDictionary *)dict;
+(instancetype) appWithDict:(NSDictionary *)dict;

@end

//
//  AppModel.m
//  九宫格
//
//  Created by 王为 on 17/2/27.
//  Copyright © 2017年 王为. All rights reserved.
//

#import "AppModel.h"

@implementation AppModel

-(instancetype)initWithDict:(NSDictionary *)dict{
    if(self = [super init]){
        self.appname = dict[@"appname"];
        self.appicon = dict[@"appicon"];
    }
    return self;
}

+(instancetype)appWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end

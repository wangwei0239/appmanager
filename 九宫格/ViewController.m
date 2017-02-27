//
//  ViewController.m
//  九宫格
//
//  Created by 王为 on 17/2/27.
//  Copyright © 2017年 王为. All rights reserved.
//

#import "ViewController.h"
#import "AppModel.h"
#import "AppView.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *apps;

@end

@implementation ViewController

-(NSArray*)apps{
    if(_apps == nil){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"applist.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *modelArray = [NSMutableArray array];
        for(NSDictionary *dict in dictArray){
            AppModel *model = [AppModel appWithDict:dict];
            [modelArray addObject:model];
        }
        _apps = modelArray;
    }
    return _apps;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int columnNum = 3;
    
    CGFloat rootWidth = self.view.frame.size.width;
    
    CGFloat appW = 75;
    CGFloat appH = 90;
    CGFloat marginTop = 30;
    CGFloat marginX = (rootWidth - appW * columnNum) / (columnNum + 1);
    CGFloat marginY = marginX;
    
    for(int i = 0; i < self.apps.count; i++){
        
        AppModel *model = self.apps[i];
        
//        UIView *appView = [[UIView alloc]init];
        
        //通过动态加载xib文件创建view
    
        
        AppView *appView = [AppView appView];
        
        
        
        
        int colId = i % columnNum;
        int rowId = i / columnNum;
        
        CGFloat appX = colId * (marginX + appW) + marginX;
        CGFloat appY = rowId * (marginY + appH) + marginTop;
        appView.frame = CGRectMake(appX, appY, appW, appH);
        
        [self.view addSubview:appView];
        
//        [self addViewByCode:model withRootView:appView];

        appView.model = model;
        
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) btnClickEvent{
    NSLog(@"btn clicked");
}

-(void) addViewByCode:(AppModel *)model withRootView:(UIView *)appView{
            UIImageView *appIcon = [[UIImageView alloc]init];
    
            appIcon.image = [UIImage imageNamed:model.appicon];
    
            CGFloat iconW = 45;
            CGFloat iconH = 45;
            CGFloat iconX = (appView.frame.size.width - iconW) * 0.5;
            CGFloat iconY = 0;
            appIcon.frame = CGRectMake(iconX, iconY, iconW, iconH);
    
            [appView addSubview:appIcon];
    
            UILabel *appTitle = [[UILabel alloc]init];
            appTitle.text = model.appname;
            appTitle.textAlignment = NSTextAlignmentCenter;
            appTitle.font = [UIFont systemFontOfSize:12];
    
            CGFloat titleW = appView.frame.size.width;
            CGFloat titleH = 20;
            CGFloat titleX = 0;
            CGFloat titleY = iconH;
            appTitle.frame = CGRectMake(titleX, titleY, titleW, titleH);
            [appView addSubview:appTitle];
    
            UIButton *appBtn = [[UIButton alloc]init];
            appBtn.backgroundColor = [UIColor greenColor];
            [appBtn setTitle:@"下载" forState:UIControlStateNormal];
            [appBtn setTitle:@"已下载" forState:UIControlStateDisabled];
            appBtn.titleLabel.font = [UIFont systemFontOfSize:14];
            [appBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
            CGFloat btnW = iconW;
            CGFloat btnH = 20;
            CGFloat btnX = iconX;
            CGFloat btnY = CGRectGetMaxY(appTitle.frame);
            appBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    
            [appBtn addTarget:self action:@selector(btnClickEvent) forControlEvents:UIControlEventTouchUpInside];
            
            [appView addSubview:appBtn];
}

@end

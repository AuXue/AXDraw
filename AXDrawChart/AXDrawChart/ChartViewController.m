//
//  ChartViewController.m
//  绘图
//
//  Created by yangqijia on 2017/2/10.
//  Copyright © 2017年 yangqijia. All rights reserved.
//

#import "ChartViewController.h"
#import "AXDrawView.h"

#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH [UIScreen mainScreen].bounds.size.width

@interface ChartViewController ()
{
    NSMutableArray  *_array;
    AXDrawView      *_drawView;
    NSString        *_title;
    int             _type;
}

@end

@implementation ChartViewController

-(id)initWithType:(int)type title:(NSString *)title
{
    self = [super init];
    if (self) {
        _type = type;
        self.title = title;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    _array = [NSMutableArray array];
    [_array addObject:@"90"];
    [_array addObject:@"10"];
    [_array addObject:@"30"];
    [_array addObject:@"80"];
    [_array addObject:@"50"];
    [_array addObject:@"75"];
    [_array addObject:@"60"];

    if (_type == 0) {
        _drawView = [[AXDrawView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, 300) type:LineChart_Type];
        _drawView.arrayPoint = _array;
        [self.view addSubview:_drawView];
    }else if (_type == 1){
        _drawView = [[AXDrawView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, 300) type:BarChart_Type];
        _drawView.arrayPoint = _array;
        [self.view addSubview:_drawView];
    }else if (_type == 2){
        _drawView = [[AXDrawView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, 300) type:PieChart_Type];
        _drawView.arrayPoint = _array;
        //设置每个扇形的颜色，不设置颜色随机显示
        //_drawView.colorItems = @[[UIColor redColor], [UIColor greenColor], [UIColor blueColor]];
        [self.view addSubview:_drawView];
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if (_drawView) {
        [_drawView removeFromSuperview];
        _drawView = nil;
    }
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

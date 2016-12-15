//
//  ViewController.m
//  MY_iOS_AddChildViewController
//
//  Created by 毛岩 on 2016/12/15.
//  Copyright © 2016年 com.gzkiwi.yinpubaoblue. All rights reserved.
//

#import "ViewController.h"
#import "MYTitleButton.h"
#import "AllTableViewController.h"
#import "VideoTableViewController.h"
#import "SoundTableViewController.h"
#import "PictureTableViewController.h"
#import "JokeTableViewController.h"
#import "UIView+Extension.h"

@interface ViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIView * titleView;
@property(nonatomic,strong)MYTitleButton * selectButton;
@property(nonatomic,strong)UIView * underLineView;
@property(nonatomic,strong)UIScrollView * scrollView;

@end
#define count 5

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createScrollView];
    
    [self createTitleView];
    
    [self createChildView];
    
    [self addChildVC];
    
}

-(void)createScrollView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    _scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width * count, 0);
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
}

-(void)createTitleView
{
    NSArray * titleArray = [NSArray arrayWithObjects:@"全部",@"视频",@"声音",@"图片",@"段子",nil];
    _titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height * 0.05)];
    _titleView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.35];
    //设置button位置
    CGFloat buttonW = self.view.frame.size.width / 5.0;
    CGFloat buttonH = _titleView.height;
    
    for (NSInteger i = 0; i < count; i++) {
        MYTitleButton * titleBtn = [MYTitleButton buttonWithType:UIButtonTypeCustom];
        titleBtn.frame = CGRectMake(i * buttonW, 0, buttonW, buttonH);
        [titleBtn setTitle:titleArray[i] forState:UIControlStateNormal];
        [titleBtn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        titleBtn.tag = 100 + i;
        [_titleView addSubview:titleBtn];
        self.underLineView = [[UIView alloc]init];
        self.underLineView.backgroundColor = [UIColor redColor];
        //        self.underLineView.y = _titleView.height - 1;
        //        self.underLineView.height = 1;
        self.underLineView.backgroundColor = [titleBtn titleColorForState:UIControlStateSelected];
        [_titleView addSubview:self.underLineView];
        //        self.underLineView = bgLabel;
    }
    
    MYTitleButton * button = (MYTitleButton * )_titleView.subviews.firstObject;
    button.selected = YES;
#pragma mark - 自适应宽度
    [button.titleLabel sizeToFit];
    _underLineView.y = _titleView.height - 1;
    _underLineView.height = 1;
    _underLineView.width = button.titleLabel.width;
    _underLineView.centerX = button.centerX;
    
    
    [self.view addSubview:_titleView];
}

-(void)createChildView
{
    AllTableViewController * all = [[AllTableViewController alloc]init];
    [self addChildViewController:all];
    
    VideoTableViewController * vedio = [[VideoTableViewController alloc]init];
    [self addChildViewController:vedio];
    
    SoundTableViewController * sound = [[SoundTableViewController alloc]init];
    [self addChildViewController:sound];
    
    PictureTableViewController * picture = [[PictureTableViewController alloc]init];
    [self addChildViewController:picture];
    
    JokeTableViewController * joke = [[JokeTableViewController alloc]init];
    [self addChildViewController:joke];
    
}

-(void)addChildVC
{
    NSInteger n = _scrollView.contentOffset.x / _scrollView.frame.size.width;
    UITableViewController * ChildVC = (UITableViewController * )self.childViewControllers[n];
    ChildVC.view.frame = _scrollView.bounds;
    if (ChildVC.view.superview) {
        return;
    }
    [_scrollView addSubview:ChildVC.view];
}

#pragma mark - 标题点击
-(void)titleBtnClick:(MYTitleButton * )titleBtnClidk
{
    self.selectButton.selected = NO;
    titleBtnClidk.selected = YES;
    self.selectButton = titleBtnClidk;
    //设置 y 高度 宽度 中心点
    self.underLineView.y = _titleView.height - 1;
    self.underLineView.height = 1;
    
    [UIView animateWithDuration:0.25 animations:^{
        //#pragma mark - 自适应宽度
        //        [button.titleLabel sizeToFit];
        self.underLineView.width = titleBtnClidk.titleLabel.width;
        self.underLineView.centerX = titleBtnClidk.centerX;
    }];
    
    //获取index
    NSInteger n = titleBtnClidk.tag - 100;
    CGPoint offSet = _scrollView.contentOffset;
    offSet.x = n * self.view.frame.size.width;
    [_scrollView setContentOffset:offSet animated:YES];
}

#pragma mark - scrollViewDelegae
//执行动画结束跳转到这里
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self addChildVC];
}

//人为手动滚动结束到这里
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger n = _scrollView.contentOffset.x / _scrollView.width;
    
    //方法一
    MYTitleButton * button = (MYTitleButton * )[self.view viewWithTag:100 + n];
    //方法二
    //    MYTitleButton * button = _titleView.subviews[n];
    
    [self titleBtnClick:button];
    
    [self addChildVC];
}


#pragma mark - delegete


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end

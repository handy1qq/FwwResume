//
//  FwwJnspViewController.m
//  FwwResume
//
//  Created by fengwenwei on 16/10/23.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//
#define ImageCount 4

#import "FwwJnspViewController.h"

@interface FwwJnspViewController ()<UIScrollViewDelegate>

/**  scrollview */
@property (nonatomic, weak) UIScrollView *scrollView;
/**  pagecontroller */
@property (nonatomic, weak) UIPageControl *pagecontrol;



@end

@implementation FwwJnspViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scroll = [ [UIScrollView alloc] init];
    scroll.frame = (CGRect){0, 0, [UIScreen mainScreen].bounds.size};
    scroll.delegate = self;
    scroll.backgroundColor = [UIColor yellowColor];
    self.scrollView = scroll;
    [self.view addSubview:scroll];
    
    UIPageControl *page = [ [UIPageControl alloc] init];
    page.centerX = self.view.centerX;
    page.centerY = self.view.size.height *0.9;
    page.pageIndicatorTintColor = [UIColor lightGrayColor];
    page.currentPageIndicatorTintColor = [UIColor redColor];
    page.numberOfPages = ImageCount;
    [page setCurrentPage:0];
    //page.backgroundColor = [UIColor redColor];
    self.pagecontrol = page;
    [self.view addSubview:page];
    
    CGFloat imageW = self.view.size.width;
    CGFloat imageH = self.view.size.height;
    CGFloat imageY = 0;
    
    for (int i = 0; i < ImageCount; i++) {
        CGFloat imageX = i * imageW;
        NSString *imageN = [NSString stringWithFormat:@"jnsp%d", i +1];
        UIImage *image = [UIImage imageNamed:imageN];
        UIImageView *imageV = [ [UIImageView alloc] init];
        imageV.frame = CGRectMake(imageX, imageY, imageW, imageH);
        imageV.image = image;
        [self.scrollView addSubview:imageV];
    }
    CGFloat contentW = ImageCount * imageW;
    self.scrollView.contentSize = CGSizeMake(contentW, 0);
    // 隐藏水平滚动条
    self.scrollView.showsHorizontalScrollIndicator = NO;
    // 分页
    self.scrollView.pagingEnabled = YES;
    self.navigationItem.leftBarButtonItem = [ [UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"night_icon_back"] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat scrollW = scrollView.size.width;
    int page = (self.scrollView.contentOffset.x + scrollW * 0.5) / scrollW;
    self.pagecontrol.currentPage = page;
    if (page == ImageCount) {
        self.pagecontrol.currentPage = 0;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        });
    }




}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

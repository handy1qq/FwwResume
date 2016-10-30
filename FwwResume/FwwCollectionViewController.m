//
//  FwwCollectionViewController.m
//  FwwResume
//
//  Created by fengwenwei on 16/10/24.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//

#import "FwwCollectionViewController.h"
#import "UMSocialSinaHandler.h"
#import <UMSocialCore/UMSocialCore.h>
#import "FwwProject.h"
#import "FwwCollectionViewCell.h"
#import "FwwMusicViewController.h"

@interface FwwCollectionViewController ()
/**数组 */
@property (strong, nonatomic) NSArray *projects;


@end

@implementation FwwCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // storyboard写了identifier就不需要注册
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.backgroundColor = [UIColor clearColor];
    //控制垂直方向遇到边框是否反弹
    self.collectionView.alwaysBounceVertical =YES;
    //设置左边按钮风格
    self.navigationItem.rightBarButtonItem = [ [UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_share"] style:UIBarButtonItemStyleDone target:self action:@selector(share)];

}

- (void)share {
    UMSocialHandler *handler = [ [UMSocialHandler alloc] init];
    UMSocialMessageObject *text = [ [UMSocialMessageObject alloc] init];
    
    [ [UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_Sina messageObject:text currentViewController:handler.currentViewController completion:^(id result, NSError *error) {
    }];
}

- (NSArray *)projects {
    if (!_projects) {
         // JSON文件的路径
        NSString *path = [ [NSBundle mainBundle] pathForResource:@"projects.json" ofType:nil];
        // 加载JSON文件
        NSData *data = [NSData dataWithContentsOfFile:path];
         // 将JSON数据转为NSArray或者NSDictionary
        NSArray *dictArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        // 将字典转成模型
        NSMutableArray *projectArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            FwwProject *pro = [FwwProject projectWithDict:dict];
            [projectArray addObject:pro];
        }
        _projects = projectArray;
    }
    return _projects;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.projects.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"mycell";
    FwwCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    // Configure the cell
    cell.project = self.projects[indexPath.item];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    FwwProject *p = self.projects[indexPath.item];
    if ([p.title  isEqual: @"禅意音乐"]) {
        UIStoryboard *musicSB = [UIStoryboard storyboardWithName:@"Music" bundle:nil];
        UIViewController *musicVc = musicSB.instantiateInitialViewController;
        UIViewController *VC = [musicVc.childViewControllers firstObject];
        [self.navigationController pushViewController:VC animated:YES];
//        FwwMusicViewController *VC = [[FwwMusicViewController alloc] init];
//        [self.navigationController pushViewController:VC animated:YES];
    }
//        else if ([p.title  isEqual: @"天气预报"]) {
//        FYWeatherController *VC = [[FYWeatherController alloc] init];
//        [self.navigationController pushViewController:VC animated:YES];
    else {
        if ([p.title  isEqual: @"日记本"]) {
            UIStoryboard *musicSB = [UIStoryboard storyboardWithName:@"Note" bundle:nil];
            UIViewController *musicVc = musicSB.instantiateInitialViewController;
            UIViewController *VC = [musicVc.childViewControllers firstObject];
            [self.navigationController pushViewController:VC animated:YES];
        }
        
//        UIStoryboard *SB = [UIStoryboard storyboardWithName:p.SBName bundle:nil];
//        UIViewController *insVc = SB.instantiateInitialViewController;
//        UIViewController *VC = [insVc.childViewControllers firstObject];
//        [self.navigationController pushViewController:VC animated:YES];
    }
}

@end

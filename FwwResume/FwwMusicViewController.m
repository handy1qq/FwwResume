//
//  FwwMusicViewController.m
//  FwwResume
//
//  Created by fengwenwei on 16/10/25.
//  Copyright © 2016年 fengwenwei. All rights reserved.
//
#define MusicFilePath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"music.data"]

#import "FwwMusicViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "MJExtension.h"
#import "FwwMusic.h"

@interface FwwMusicViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *icon;
@property (strong, nonatomic) IBOutlet UILabel *titleL;
@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UITableViewCell *musicViewCell;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *musics;
@property (nonatomic, strong) NSMutableDictionary *players;
@property (nonatomic, assign) BOOL isPlay;
@property (nonatomic, strong) NSMutableArray *rowArray;

@end

@implementation FwwMusicViewController

- (NSMutableArray *)rowArray {
    if (!_rowArray) {
        _rowArray = [NSMutableArray array];
    }
    return _rowArray;
}

- (NSArray *)musics {
    if (!_musics) {
        _musics = [NSKeyedUnarchiver unarchiveObjectWithFile:MusicFilePath];
        if (!_musics) {
            NSString *path = [ [NSBundle mainBundle] pathForResource:@"musics.json" ofType:nil];
            NSData *data = [NSData dataWithContentsOfFile:path];
            /**
             *  通过JSON数据来创建一个模型数组
             *  @param data JSON数据
             *  @return 新建的对象
             */
          //MJExtension  字典数组（JSON Array） --> 模型数组（Model Array）
            //objectWithJSONData创建模式数组，FwwMusic转码
            _musics = [FwwMusic objectArrayWithJSONData:data];
            //NSLog(@"!!!!%@",data);
        }
    }
     return _musics;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.rowHeight = 80;
    self.navigationItem.title = @"禅意音乐";
    self.navigationItem.rightBarButtonItem = [ [UIBarButtonItem alloc] initWithTitle:@"全部停止" style:UIBarButtonItemStyleDone target:self action:@selector(stopAudio)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"night_icon_back"] style:UIBarButtonItemStyleDone target:self action:@selector(back)];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)stopAudio {
    NSArray *audioArr = [self.musics valueForKey:@"audio"];
    //    NSLog(@"%@",audioArr);
    for (int i = 0; i < audioArr.count; i++) {
        [self stopMusicWithFilename:audioArr[i]];
    }
}

- (void)back {
    [NSKeyedArchiver archiveRootObject:self.musics toFile:MusicFilePath];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)stopMusicWithFilename:(NSString  *)filename {
    AVAudioPlayer *player = self.players[filename];
    if (player) {
        [player stop];
        self.isPlay = NO;
        [self.rowArray removeAllObjects];
        [self.tableView reloadData];
        [self.players removeObjectForKey:filename];
    }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.musics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *ID = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [ [ [NSBundle mainBundle] loadNibNamed:@"FwwMusicViewCell" owner:self options:nil] lastObject];
    }
    //设置cell数据
    FwwMusic *musics = [self.musics objectAtIndex:indexPath.row];
    [self.slider setThumbImage:[UIImage imageNamed:@"slider1"] forState:UIControlStateNormal];
    [self.slider setThumbImage:[UIImage imageNamed:@"slider1"] forState:UIControlStateHighlighted];
    self.slider.enabled = NO;
    if (self.isPlay == YES) {
        for (NSString *str in self.rowArray) {
            if (indexPath.row == [str intValue]) {
                self.titleL.textColor = [UIColor blackColor];
                self.slider.minimumTrackTintColor = [UIColor colorWithRed:54.0/255.0 green:187.0/255.0 blue:242.0/255.0 alpha:1.0];
                self.slider.thumbTintColor = [UIColor blueColor];
                [self.slider setThumbImage:[UIImage imageNamed:@"slider2"] forState:UIControlStateNormal];
                [self.slider setThumbImage:[UIImage imageNamed:@"slider2"] forState:UIControlStateHighlighted];
                self.slider.enabled = YES;
                //                NSLog(@"%@",str);
            }
        }

    } else {
        self.titleL.textColor = [UIColor lightGrayColor];
        self.slider.minimumTrackTintColor = [UIColor lightGrayColor];
        self.slider.thumbTintColor = [UIColor grayColor];
        [self.slider setThumbImage:[UIImage imageNamed:@"slider1"] forState:UIControlStateNormal];
        [self.slider setThumbImage:[UIImage imageNamed:@"slider1"] forState:UIControlStateHighlighted];
        self.slider.enabled = NO;
    }
    NSString *str = [NSString stringWithFormat:@"%@",musics.icon];
    self.icon.image = [UIImage imageNamed:str];
    self.titleL.text = musics.title;
    self.slider.value = [musics.volume floatValue];
    self.slider.tag = indexPath.row;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *str = [self.musics valueForKey:@"audio"][indexPath.row];
    NSString  *volumeStr = [self.musics valueForKey:@"volume"][indexPath.row];
    float volume = [volumeStr floatValue];
    [self playOrPauseMusicWithFilename:str volume:volume row:indexPath.row];

}

- (NSMutableDictionary *)players
{
    if (!_players) {
        _players = [NSMutableDictionary dictionary];
    }
    return _players;
}

- (void)playOrPauseMusicWithFilename:(NSString  *)filename volume:(float)volume row:(NSInteger)row {
    AVAudioPlayer *player = self.players[filename];
    if (!player) {
        NSLog(@"创建新的播放器");
        
        NSURL *url = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        //音频文件就会一直循
        player.numberOfLoops = -1;
        player.volume = volume;
        //加载音频
        dispatch_queue_t queue =  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_async(queue, ^{
                [player prepareToPlay];
                [player play];

            });
        
        self.players[filename] = player;
                self.isPlay = YES;
        [self.rowArray addObject:[NSString stringWithFormat:@"%ld",(long)row]];
        [self.tableView reloadData];
        //        NSLog(@"%@",filename);
    }else{
        if (player.isPlaying) {
            [player pause];
            self.isPlay = YES;
            [self.rowArray removeObject:[NSString stringWithFormat:@"%ld",(long)row]];
            [self.tableView reloadData];
        }else{
            player.volume = volume;
            [player play];
            self.isPlay = YES;
            [self.rowArray addObject:[NSString stringWithFormat:@"%ld",(long)row]];
            [self.tableView reloadData];
            //            NSLog(@"%f",player.volume);
        }
    }
}
- (IBAction)volumeChange:(UISlider *)slider {
    NSString *filename = [self.musics[slider.tag] valueForKey:@"audio"];
    AVAudioPlayer *player = self.players[filename];
    player.volume = slider.value;
    
    NSString *value = [NSString stringWithFormat:@"%f",slider.value];
    [self.musics[slider.tag] setValue:value forKey:@"volume"];
}
@end

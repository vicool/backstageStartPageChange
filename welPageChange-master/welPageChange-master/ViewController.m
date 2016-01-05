//
//  ViewController.m
//  welPageChange-master
//
//  Created by 刘家男 on 16/1/4.
//  Copyright © 2016年 刘家男. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UITextField *urlField;
@property (weak, nonatomic) IBOutlet UISwitch *switchBtn;
@property (copy, nonatomic) NSString *url;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)change:(id)sender {
    NSArray * arr=@[@"http://www.caifupad.com/cfpUploadPic/appStartPagePic/9e206511-fb58-4a62-9d48-766b9e94be7d.jpg"];
    _url =arr[0];
    [self download];
}
- (IBAction)openOrClose:(id)sender {
    //实际应用可以直接调用服务器接口
    [self download];
}

- (IBAction)changeBtn:(id)sender {
    _url =_urlField.text;
    [self download];
}

- (void)download{
    //开关开启状态
    if([_switchBtn isOn]){
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *pic = [userDefaults objectForKey:@"pic"];
        
        if (![pic isEqualToString:_url])
        {
            NSURL *url = [NSURL URLWithString:_url];
            NSData *data = [[NSData alloc] initWithContentsOfURL:url];
            UIImage *image = [UIImage imageWithData:data];
            NSString *path_sandox = NSHomeDirectory();
            //设置一个图片的存储路径
            NSString *imagePath = [path_sandox stringByAppendingString:@"/Documents/welcome.jpg"];
            //把图片直接保存到指定的路径（同时应该把图片的路径imagePath存起来，下次就可以直接用来取）图片格式自定义
            [UIImagePNGRepresentation(image) writeToFile:imagePath atomically:YES];
            pic = _url;
            [userDefaults setObject:pic forKey:@"pic"];
            [userDefaults synchronize];
            //记录每次图片地址  避免重复下载
        }
        //关闭状态
    }else{
        NSString *path_sandox = NSHomeDirectory();
        //设置一个图片的存储路径
        NSString *imagePath = [path_sandox stringByAppendingString:@"/Documents/welcome.jpg"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager removeItemAtPath:imagePath error:nil];
        //移除该图片
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"pic"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

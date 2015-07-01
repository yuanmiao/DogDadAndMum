//
//  ScanfViewController.m
//  DogDadAndMum
//
//  Created by 小宸宸Dad on 15/6/30.
//  Copyright (c) 2015年 fj. All rights reserved.
//

#import "ScanfViewController.h"
#import "ZBarSDK.h"

@interface ScanfViewController ()<ZBarReaderDelegate>

@property (strong,nonatomic)UILabel *label;

@property (strong,nonatomic)ZBarReaderViewController *reader;

@end

@implementation ScanfViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"扫扫更健康";
    self.navigationItem.leftBarButtonItem = self.leftButton;
    _reader = ({
    
        //二维码
        ZBarReaderViewController * reader = [[ZBarReaderViewController alloc]init];
        reader.view.frame = CGRectMake(0*[FlexibleFrame ratio], 64*[FlexibleFrame ratio], 320*[FlexibleFrame ratio], (568-64)*[FlexibleFrame ratio]);
        reader.readerDelegate = self;
        
        //关闭闪光灯
        reader.readerView.torchMode = 0;
        ZBarImageScanner * scanner = reader.scanner;
        [scanner setSymbology:ZBAR_I25 config:ZBAR_CFG_ENABLE to:0];
        
        reader.showsZBarControls = YES;
        reader;
    
    });
    
    [self.view addSubview:_reader.view];
    [self addChildViewController:_reader];
    
    
    _label = [[UILabel alloc]initWithIPhone5Frame:CGRectMake(80, 400, 250, 100)];
    _label.text = @"对准二维码，使劲扫描";
    _label.textColor =[UIColor grayColor];
    [self.view addSubview:_label];
    UIView *searchAreaView = [[UIView alloc]initWithIPhone5Frame:CGRectMake(35, 180, 250, 250)];
    searchAreaView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
    searchAreaView.layer.borderWidth = 1;
    searchAreaView.layer.borderColor = [UIColor grayColor].CGColor;
    [self.view addSubview:searchAreaView];
    
    UIButton *openBtn =[UIButton buttonWithType:UIButtonTypeSystem];
    openBtn.frame = CGRectMake(0*[FlexibleFrame ratio], (568-70)*[FlexibleFrame ratio], 320*[FlexibleFrame ratio], 70*[FlexibleFrame ratio]);
    
    [openBtn setTitle:@"开启闪光灯" forState:UIControlStateNormal];
    openBtn.titleLabel.font = Font;
    [openBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    openBtn.backgroundColor = [UIColor grayColor];
    [openBtn addTarget:self action:@selector(openAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:openBtn];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    id<NSFastEnumeration> results = [info objectForKey:ZBarReaderControllerResults];
    ZBarSymbol * symbol;
    for(symbol in results)
        break;
    
//    _imageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
//    _label.text =symbol.data;
    [self.delegate scanfReturnData:symbol.data];
    
}




- (void)returnAction:(UIBarButtonItem *)sender{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)openAction:(UIButton *)sender{

    _reader.readerView.torchMode = _reader.readerView.torchMode == 1 ? 0:1;

}





@end

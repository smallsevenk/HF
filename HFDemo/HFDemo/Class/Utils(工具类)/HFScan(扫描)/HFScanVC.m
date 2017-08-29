//
//  HFScanVC.m
//  HFDemo
//
//  Created by smallsevenk on 2017/8/29.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import "HFScanVC.h"
#import <AVFoundation/AVFoundation.h>

//扫描区域

//X
#define SCAN_LEFT 70

//W
#define SCAN_WIDTH (SCREEN_WIDTH - SCAN_LEFT * 2)

//Y
#define SCAN_TOP (VIEW_HEIGHT - SCAN_WIDTH - 100) / 2

//H
#define SCAN_HEIGHT SCAN_WIDTH

#define kScanRect CGRectMake(SCAN_LEFT, SCAN_TOP, SCAN_WIDTH, SCAN_HEIGHT)

#define SCAN_LINE_MARGIN 10

@interface HFScanVC ()<AVCaptureMetadataOutputObjectsDelegate>{
    int num;
    BOOL upOrdown;
    NSTimer * timer;
    CAShapeLayer *cropLayer;
}
@property (strong,nonatomic)AVCaptureDevice * device;
@property (strong,nonatomic)AVCaptureDeviceInput * input;
@property (strong,nonatomic)AVCaptureMetadataOutput * output;
@property (strong,nonatomic)AVCaptureSession * session;
@property (strong,nonatomic)AVCaptureVideoPreviewLayer * preview;
@property (strong,nonatomic)UIImageView * scanImgView;

@property (nonatomic, strong) UIImageView * line;

@end

@implementation HFScanVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    [self configView];
}

-(void)configView{
    _scanImgView = [[UIImageView alloc]initWithFrame:kScanRect];
    _scanImgView.image = [UIImage imageNamed:@"pick_bg"];
    [self.view addSubview:_scanImgView];
    
    upOrdown = NO;
    num =0;
    _line = [[UIImageView alloc] initWithFrame:CGRectMake(SCAN_LEFT, SCAN_TOP + SCAN_LINE_MARGIN, SCAN_WIDTH, 2)];
    _line.image = [UIImage imageNamed:@"line.png"];
    [self.view addSubview:_line];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:.02 target:self selector:@selector(animation1) userInfo:nil repeats:YES];
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    [self setCropRect:kScanRect];
    
    [self performSelector:@selector(setupCamera) withObject:nil afterDelay:0.3];
    
}

-(void)animation1
{
    if (upOrdown == NO) {
        num ++;
        _line.frame = CGRectMake(SCAN_LEFT, SCAN_TOP + SCAN_LINE_MARGIN + 2 * num, SCAN_HEIGHT, 2);
        if (2 * num == SCAN_HEIGHT - SCAN_LINE_MARGIN * 2) {
            upOrdown = YES;
        }
    }
    else {
        num --;
        _line.frame = CGRectMake(SCAN_LEFT, SCAN_TOP + SCAN_LINE_MARGIN + 2 * num, SCAN_HEIGHT, 2);
        if (num == 0) {
            upOrdown = NO;
        }
    }
}

- (void)setCropRect:(CGRect)cropRect{
    cropLayer = [[CAShapeLayer alloc] init];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, nil, cropRect);
    CGPathAddRect(path, nil, self.view.bounds);
    
    [cropLayer setFillRule:kCAFillRuleEvenOdd];
    [cropLayer setPath:path];
    [cropLayer setFillColor:[UIColor blackColor].CGColor];
    [cropLayer setOpacity:0.6];
    
    
    [cropLayer setNeedsDisplay];
    
    [self.view.layer addSublayer:cropLayer];
}

- (void)setupCamera
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device==nil) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"设备没有摄像头" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    // Device
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // Input
    _input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    
    // Output
    _output = [[AVCaptureMetadataOutput alloc]init];
    [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    //设置扫描区域
    CGFloat top = SCAN_TOP / SCREEN_HEIGHT;
    CGFloat left = SCAN_LEFT / SCREEN_WIDTH;
    CGFloat width = SCAN_WIDTH / SCREEN_WIDTH;
    CGFloat height = SCAN_HEIGHT / SCREEN_HEIGHT;
    ///top 与 left 互换  width 与 height 互换
    [_output setRectOfInterest:CGRectMake(top,left, height, width)];
    
    
    // Session
    _session = [[AVCaptureSession alloc]init];
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    if ([_session canAddInput:self.input])
    {
        [_session addInput:self.input];
    }
    
    if ([_session canAddOutput:self.output])
    {
        [_session addOutput:self.output];
    }
    
    // 条码类型 AVMetadataObjectTypeQRCode
    [_output setMetadataObjectTypes:[NSArray arrayWithObjects:AVMetadataObjectTypeQRCode, nil]];
    
    // Preview
    //    _preview =[AVCaptureVideoPreviewLayer layerWithSession:_session];
    //    _preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
    //    _preview.frame =self.view.layer.bounds;
    //    [self.view.layer insertSublayer:_preview atIndex:0];
    
    UIButton *tipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tipBtn.frame = CGRectMake(0, _scanImgView.bottom + 20,
                              SCREEN_WIDTH,
                              50);
    tipBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [tipBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //    [tipBtn setBackgroundImage:[UIImage imageWithColor:[UIColor blackColor] alpha:.5] forState:UIControlStateNormal];
    tipBtn.backgroundColor = [UIColor clearColor];
    //    [tipBtn setEnabled:NO];
    [tipBtn setTitle:@"将二维码/条码放入框内，即可自动扫描" forState:UIControlStateNormal];
    [self.view addSubview:tipBtn];
    
    // Start
    [_session startRunning];
}

#pragma mark AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    NSString *stringValue;
    
    if ([metadataObjects count] >0)
    {
        //停止扫描
        [_session stopRunning];
        [timer setFireDate:[NSDate distantFuture]];
        
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        stringValue = metadataObject.stringValue;
        NSLog(@"扫描结果：%@",stringValue);
        
        NSArray *arry = metadataObject.corners;
        for (id temp in arry) {
            NSLog(@"%@",temp);
        }
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"扫描结果" message:stringValue preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (_session != nil && timer != nil) {
                [_session startRunning];
                [timer setFireDate:[NSDate date]];
            }
            
        }]];
        [self presentViewController:alert animated:YES completion:nil];
        
    } else {
        NSLog(@"无扫描信息");
        return;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

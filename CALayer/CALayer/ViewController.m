//
//  ViewController.m
//  CALayer
//
//  Created by Robert on 15/3/17.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@property (nonatomic, strong) UIView *layerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.3使用图层
    //[self useLayer];
    //2.1content属性
    //[self content];
    //[self contentsRect];
    [self contentsCenter];
}

- (void)useLayer {
    self.layerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.layerView.backgroundColor = [UIColor blackColor];
    self.layerView.center = self.view.center;
    [self.view addSubview:self.layerView];
    
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50, 50, 100, 100);
    blueLayer.backgroundColor = [[UIColor blueColor] CGColor];
    //[self.layerView.layer addSublayer:blueLayer];
}

- (void)content {
    UIImage *image = [UIImage imageNamed:@"avatar-heaven.jpg"];
    self.layerView.layer.contents = (__bridge id)image.CGImage;
    //这两句等价
    //self.layerView.contentMode = UIViewContentModeScaleAspectFit;
    //self.layerView.layer.contentsGravity = kCAGravityResizeAspect;
    self.layerView.layer.contentsGravity = kCAGravityCenter;
    self.layerView.layer.contentsScale = image.scale;
    self.layerView.layer.masksToBounds = YES;
}

- (void)contentsRect {
    UIImage *image = [UIImage imageNamed:@"2.7.png"];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [self.view addSubview:view1];
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, SCREENHEIGHT - 50, 50, 50)];
    [self.view addSubview:view2];
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(SCREENWIDTH - 50, 0, 50, 50)];
    [self.view addSubview:view3];
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(SCREENWIDTH - 50, SCREENHEIGHT - 50, 50, 50)];
    [self.view addSubview:view4];
    
    [self addSpriteImage:image withContentRect:CGRectMake(0, 0, 0.5, 0.5) toLayer:view1.layer];
    [self addSpriteImage:image withContentRect:CGRectMake(0, 0.5, 0.5, 0.5) toLayer:view2.layer];
    [self addSpriteImage:image withContentRect:CGRectMake(0.5, 0, 0.5, 0.5) toLayer:view3.layer];
    [self addSpriteImage:image withContentRect:CGRectMake(0.5, 0.5, 0.5, 0.5) toLayer:view4.layer];
}

- (void)contentsCenter{
    UIImage *image = [UIImage imageNamed:@"avatar-heaven.jpg"];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    [self.view addSubview:view1];
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, SCREENHEIGHT - 50, 50, 100)];
    [self.view addSubview:view2];
    
    [self addStretchableImage:image withContentCenter:CGRectMake(0.25, 0.25, 0.5, 0.5) toLayer:view1.layer];
    [self addStretchableImage:image withContentCenter:CGRectMake(0.25, 0.25, 0.5, 0.5) toLayer:view2.layer];
}
- (void)addSpriteImage:(UIImage *)image withContentRect:(CGRect)rect toLayer:(CALayer *)layer {
    layer.contents = (__bridge id)image.CGImage;
    layer.contentsGravity = kCAGravityResizeAspect;
    layer.contentsRect = rect;
}

- (void)addStretchableImage:(UIImage *)image withContentCenter:(CGRect)rect toLayer:(CALayer *)layer {
    layer.contents = (__bridge id)image.CGImage;
    layer.contentsCenter = rect;
}

@end

//
//  ImageHandlerViewController.m
//  MyAnimations
//
//  Created by 张润潮 on 2017/4/7.
//  Copyright © 2017年 zrc. All rights reserved.
//

#define Mask8(x) ( (x) & 0xFF )
#define R(x) ( Mask8(x) )
#define G(x) ( Mask8(x >> 8 ) )
#define B(x) ( Mask8(x >> 16) )


#import "ImageHandlerViewController.h"

@interface ImageHandlerViewController ()

@end

@implementation ImageHandlerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 293, 400)];
    [self.view addSubview:imageView];
    UIImage *image = [UIImage imageNamed:@"dingdang"];
    imageView.image =image;
    
    
    
    self.view.backgroundColor = [@"f4f4f4" hexColor];
   

    CGImageRef inputCG = [image CGImage];
    NSUInteger width = CGImageGetWidth(inputCG);
    NSUInteger height = CGImageGetHeight(inputCG);
    
    NSUInteger bytesPerPixel = 4;
    NSUInteger bytesPerRow = width * bytesPerPixel;
    NSUInteger bitsPerCompoment = 8;
    
    UInt32 *pixels;
    pixels = (UInt32 *)calloc(height * width, sizeof(UInt32));
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(pixels, width, height, bitsPerCompoment, bytesPerRow, colorSpace, kCGImageAlphaPremultipliedLast |     kCGBitmapByteOrder32Big);

    
    
    
    CGContextDrawImage(context, CGRectMake(30 , 120, width, height), inputCG);
    
    
    NSLog(@"Brightness of image:");
    UInt32 * currentPixel = pixels;
    for (NSUInteger j = 0; j < height; j++) {
        for (NSUInteger i = 0; i < width; i++) {
            UInt32 color = *currentPixel;
            printf("%3.0f ",     (R(color)+G(color)+B(color))/3.0);
            // 4.
            currentPixel++;
        }
        printf("\n");
    }

    
    
    CGColorSpaceRelease(colorSpace);



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

//
//  UIImage+YN.m
//
//  Created by apple on 14-4-14.
//  Copyright (c) 2014年 YN. All rights reserved.
//

#import "UIImage+YN.h"

@implementation UIImage (YN)
+ (instancetype)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    // 1.加载原图
    UIImage *oldImage = [UIImage imageNamed:name];
    
    // 2.开启上下文
    CGFloat imageW = oldImage.size.width + 2 * borderWidth;
    CGFloat imageH = oldImage.size.height + 2 * borderWidth;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    // 3.取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 4.画边框(大圆)
    [borderColor set];
    CGFloat bigRadius = imageW * 0.5; // 大圆半径
    CGFloat centerX = bigRadius; // 圆心
    CGFloat centerY = bigRadius;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx); // 画圆
    
    // 5.小圆
    CGFloat smallRadius = bigRadius - borderWidth;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    // 裁剪(后面画的东西才会受裁剪的影响)
    CGContextClip(ctx);
    
    // 6.画图
    [oldImage drawInRect:CGRectMake(borderWidth, borderWidth, oldImage.size.width, oldImage.size.height)];
    
    // 7.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 8.结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}


+ (instancetype)circleImageWithImage:(UIImage *)oldImage borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    
    // 2.开启上下文
    CGFloat imageW = oldImage.size.width + 2 * borderWidth;
    CGFloat imageH = oldImage.size.height + 2 * borderWidth;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    // 3.取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 4.画边框(大圆)
    [borderColor set];
    CGFloat bigRadius = imageW * 0.5; // 大圆半径
    CGFloat centerX = bigRadius; // 圆心
    CGFloat centerY = bigRadius;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx); // 画圆
    
    // 5.小圆
    CGFloat smallRadius = bigRadius - borderWidth;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    // 裁剪(后面画的东西才会受裁剪的影响)
    CGContextClip(ctx);
    
    // 6.画图
    [oldImage drawInRect:CGRectMake(borderWidth, borderWidth, oldImage.size.width, oldImage.size.height)];
    
    // 7.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 8.结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}


+ (instancetype)captureWithView:(UIView *)view
{
    // 1.开启上下文
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0);
    
    // 2.将控制器view的layer渲染到上下文
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    // 3.取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    
    [self addWater:newImage];
    
    // 4.结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (void)addWater:(UIImage *)bgImage
{
    //    UIImage *bgImage = [UIImage imageNamed:bg];
    
    // 1.创建一个基于位图的上下文(开启一个基于位图的上下文)
    UIGraphicsBeginImageContextWithOptions(bgImage.size, NO, 0.0);
    
    // 2.画背景
    [bgImage drawInRect:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    
    // 3.画右下角的水印
    UIImage *waterImage = [UIImage imageNamed:@"blood_data_mark_image.png"];
    //    CGFloat scale = 0.2;
    //    CGFloat margin = 5;
    CGFloat waterW = 230;
    CGFloat waterH = 230;
    CGFloat waterX = (bgImage.size.width - waterW) * 0.5;
    CGFloat waterY = (bgImage.size.height - waterH) * 0.5;
    [waterImage drawInRect:CGRectMake(waterX, waterY, waterW, waterW)];
    
    // 4.从上下文中取得制作完毕的UIImage对象
//    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    newImage = [newImage imageByScalingAndCroppingForSize:bgImage.size];
    
//    // 2.写文件
//    //    NSData *data = UIImagePNGRepresentation(newImage);
//    NSData *data = UIImageJPEGRepresentation(newImage, 0.7);
//
//    [data writeToFile:ShareDataImage atomically:YES];
    
    // 5.结束上下文
    UIGraphicsEndImageContext();
    
}


- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize
{
    UIImage *sourceImage = self;
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth= width * scaleFactor;
        scaledHeight = height * scaleFactor;
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else if (widthFactor < heightFactor)
        {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    UIGraphicsBeginImageContext(targetSize); // this will crop
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width= scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    [sourceImage drawInRect:thumbnailRect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
//    if(newImage == nil)
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)resizableImage:(NSString *)name
{
    UIImage *normal = [UIImage imageWithName:name];
    CGFloat w = normal.size.width * 0.5;
    CGFloat h = normal.size.height * 0.5;
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
}

+ (UIImage *)imageWithName:(NSString *)name
{
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"png"];
    return [UIImage imageWithContentsOfFile:path];
}


- (UIImage *)compressImageToSpecifiedKB:(CGFloat)specifiedKB {
	return [self compressImageToSpecifiedKB:specifiedKB withMode:UIImageDKCompressModeAspectFit];
}

- (UIImage *)compressImageToSpecifiedKB:(CGFloat)specifiedKB withMode:(UIImageDKCompressMode)compressMode {
	NSAssert(specifiedKB > 0, @"指定的大小必须大于0");
	CGImageRef imgRef = self.CGImage;
	size_t width = CGImageGetWidth(imgRef);
	size_t height = CGImageGetHeight(imgRef);
	size_t bitsPerPixel = CGImageGetBitsPerPixel(imgRef);
	size_t bits = bitsPerPixel * width * height;
	size_t kbs = bits / 8 / 1024;// 原图片解压后所占用的内存(KB)
	if (specifiedKB >= kbs) {
		return self;
	}
	CGFloat scale = sqrtf((CGFloat)kbs / specifiedKB);
	CGSize size = self.size;
	return [self compressImageToSpecifiedCGSize:CGSizeMake(size.width / scale, size.height / scale) withMode:compressMode];
}

- (UIImage *)compressImageToSpecifiedCGSize:(CGSize)destImgSize {
	return [self compressImageToSpecifiedCGSize:destImgSize withMode:UIImageDKCompressModeAspectFit];
}
- (UIImage *)compressImageToSpecifiedCGSize:(CGSize)destImgSize withMode:(UIImageDKCompressMode)compressMode {
	// 图片原始尺寸
	CGSize sourceImgSize = self.size;
	CGFloat sourceImgWidth = sourceImgSize.width;
	CGFloat sourceImgHeight = sourceImgSize.height;
	// 最终图片尺寸
	CGFloat destImgWidth = destImgSize.width;
	CGFloat destImgHeight = destImgSize.height;
	
	if (sourceImgWidth <= destImgWidth && sourceImgHeight <= destImgHeight) {
		return self;
	}
	
	CGFloat sourceRatio = sourceImgWidth / sourceImgHeight;
	CGFloat destRatio = destImgWidth / destImgHeight;
	
	CGFloat scaledRatio = 0;
	CGFloat scaledImgWidth = destImgWidth;
	CGFloat scaledImgHeight = destImgHeight;
	
	CGRect rect = CGRectZero;
	switch (compressMode) {
		case UIImageDKCompressModeAspectFill:
		{
			if (sourceRatio > destRatio) {
				scaledRatio = sourceImgHeight / destImgHeight;
				scaledImgWidth = sourceImgWidth / scaledRatio;
				rect.origin.x = (destImgWidth - scaledImgWidth) / 2.0f;// 非正值
			} else {
				scaledRatio = sourceImgWidth / destImgWidth;
				scaledImgHeight = sourceImgHeight / scaledRatio;
				rect.origin.y = (destImgHeight - scaledImgHeight) / 2.0f;// 非正值
			}
			break;
		}
		case UIImageDKCompressModeAspectFit:
		{
			if (sourceRatio > destRatio) {
				scaledRatio = sourceImgWidth / destImgWidth;
				scaledImgHeight = sourceImgHeight / scaledRatio;
				rect.origin.y = (destImgHeight - scaledImgHeight) / 2.0f;// 非负值
			} else {
				scaledRatio = sourceImgHeight / destImgHeight;
				scaledImgWidth = sourceImgWidth / scaledRatio;
				rect.origin.x = (destImgWidth - scaledImgWidth) / 2.0f;// 非负值
			}
			break;
		}
		default:
		{
			break;
		}
	}
//#ifdef __IPHONE_4_0
//	if (kWSSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"4.0")) {
//		UIGraphicsBeginImageContextWithOptions(destImgSize, NO, 0);
//	} else {
//#endif
		UIGraphicsBeginImageContext(destImgSize);
//#ifdef __IPHONE_4_0
//	}
//#endif
	rect.size = CGSizeMake(scaledImgWidth, scaledImgHeight);
	[self drawInRect:rect];
	
	// 最终图片
	UIImage *destImg = UIGraphicsGetImageFromCurrentImageContext();
	NSAssert(destImg != nil, @"图片缩放失败, 最终图片为空!");
	UIGraphicsEndImageContext();
	return destImg;
}


+ (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}

@end

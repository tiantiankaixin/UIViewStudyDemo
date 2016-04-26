//
//  UIImage+YN.h
//
//  Created by apple on 14-4-14.
//  Copyright (c) 2014年 YN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YN)

typedef NS_ENUM(NSInteger, UIImageDKCompressMode) {
	UIImageDKCompressModeFill = UIViewContentModeScaleToFill,
	UIImageDKCompressModeAspectFit = UIViewContentModeScaleAspectFit,
	UIImageDKCompressModeAspectFill = UIViewContentModeScaleAspectFill,
};

+ (instancetype)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

+ (instancetype)circleImageWithImage:(UIImage *)oldImage borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

+ (instancetype)captureWithView:(UIView *)view;

- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;

/**
 *  适配拉伸图片
 */
+ (UIImage *)resizableImage:(NSString *)name;

+ (UIImage *)imageWithName:(NSString *)name;


- (UIImage *)compressImageToSpecifiedKB:(CGFloat)specifiedKB;

+ (UIImage *)imageWithColor:(UIColor *)color;

@end

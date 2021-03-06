//
//  UIImageView+QMUI.m
//  qmui
//
//  Created by MoLice on 16/8/9.
//  Copyright © 2016年 QMUI Team. All rights reserved.
//

#import "UIImageView+QMUI.h"
#import "QMUICommonDefines.h"
#import "QMUIConfiguration.h"

@implementation UIImageView (QMUI)

- (void)sizeToFitKeepingImageAspectRatioInSize:(CGSize)limitSize {
    if (!self.image) {
        return;
    }
    CGSize currentSize = self.frame.size;
    if (currentSize.width <= 0) {
        currentSize.width = self.image.size.width;
    }
    if (currentSize.height <= 0) {
        currentSize.height = self.image.size.height;
    }
    CGFloat horizontalRatio = limitSize.width / currentSize.width;
    CGFloat verticalRatio = limitSize.height / currentSize.height;
    CGFloat ratio = fminf(horizontalRatio, verticalRatio);
    CGRect frame = self.frame;
    frame.size.width = flatf(currentSize.width * ratio);
    frame.size.height = flatf(currentSize.height * ratio);
    self.frame = frame;
}

@end

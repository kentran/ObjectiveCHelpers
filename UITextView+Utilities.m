//
//  UITextView+Utilities.m
//  LittleOnce
//
//  Created by Ken Tran on 31/10/14.
//  Copyright (c) 2014 LittleLives. All rights reserved.
//

#import "UITextView+Utilities.h"

@implementation UITextView (Utilities)

- (CGFloat)textViewHeight
{
    CGSize size = [self sizeThatFits:CGSizeMake(self.frame.size.width, FLT_MAX)];
    return size.height;
}

@end

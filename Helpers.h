//
//  Helpers.h
//  LittleOnce
//
//  Created by Ken Tran on 18/11/14.
//  Copyright (c) 2014 LittleLives. All rights reserved.
//

#ifndef LittleOnce_Helpers_h
#define LittleOnce_Helpers_h

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "NSDate+Relative.h"
#import "UIView+Animation.h"
#import "UIImage+ImageEffects.h"
#import "NSMutableArray+Utilities.h"
#import "UITextView+Utilities.h"

#endif

//
//  NIMKitColorButtonCell.m
//  NIM
//
//  Created by chris on 15/3/11.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "NIMKitColorButtonCell.h"
#import "UIView+NIM.h"

@interface NIMKitColorButtonCell()

@end

@implementation NIMKitColorButtonCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _button = [[NIMKitColorButton alloc] initWithFrame:CGRectZero];
        _button.nim_size = [_button sizeThatFits:CGSizeMake(self.nim_width, CGFLOAT_MAX)];
        _button.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self addSubview:_button];
    }
    return self;
}

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    _button.nim_centerX = self.nim_width * .5f;
    _button.nim_centerY = self.nim_height * .5f;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [_button setSelected:selected];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [_button setHighlighted:highlighted];
}

@end


@implementation NIMKitColorButton : UIButton

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self reset];
    }
    return self;
}

- (void)setStyle:(NIMKitColorButtonCellStyle)style{
    _style = style;
    [self reset];
}

- (void)reset{
    NSString *imageNormalName = @"";
    NSString *imageHighLightName  = @"";
    switch (self.style) {
        case NIMKitColorButtonCellStyleRed:
            imageNormalName = @"icon_cell_red_normal";
            imageHighLightName  = @"icon_cell_red_pressed";
            break;
        case NIMKitColorButtonCellStyleBlue:
            imageNormalName = @"icon_cell_blue_normal";
            imageHighLightName  = @"icon_cell_blue_pressed";
            break;
        default:
            break;
    }
    UIImage *imageNormal = [[UIImage imageNamed:imageNormalName] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
    UIImage *imageHighLight = [[UIImage imageNamed:imageHighLightName] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
    [self setBackgroundImage:imageNormal forState:UIControlStateNormal];
    [self setBackgroundImage:imageHighLight forState:UIControlStateHighlighted];
}

- (CGSize)sizeThatFits:(CGSize)size{
    return CGSizeMake(size.width - 20, 45);
}

@end

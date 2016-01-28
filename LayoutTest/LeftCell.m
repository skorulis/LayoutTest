//  Created by Alexander Skorulis on 28/01/2016.
//  Copyright © 2016 Alex Skorulis. All rights reserved.

#import "LeftCell.h"
#import <Masonry/Masonry.h>

@implementation LeftCell {
    UILabel *_label;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self setup];
    return self;
}

- (void)setup {
    self.backgroundColor = [UIColor lightGrayColor];
    _label = [[UILabel alloc] init];
    _label.text = @"Fine";
    
    [self.contentView addSubview:_label];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView);
        make.centerY.equalTo(self.contentView);
    }];
}


@end

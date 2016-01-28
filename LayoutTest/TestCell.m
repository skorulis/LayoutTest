//  Created by Alexander Skorulis on 28/01/2016.
//  Copyright © 2016 Alex Skorulis. All rights reserved.

#import "TestCell.h"
#import <Masonry/Masonry.h>

@implementation TestCell {
    UILabel *_label;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self setup];
    return self;
}

- (void)setup {
    self.backgroundColor = [UIColor redColor];
    _label = [[UILabel alloc] init];
    _label.text = @"Broken";
    
    [self.contentView addSubview:_label];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView);
        make.centerY.equalTo(self.contentView);
    }];
}

@end

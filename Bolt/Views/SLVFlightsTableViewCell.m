//
//  DIFFligthsTableViewCell.m
//  Bolt
//
//  Created by 1 on 01.05.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import "SLVFlightsTableViewCell.h"
#import "UIFont+SLVFont.h"
#import "UIColor+SLVColor.h"
@import Masonry;

@interface SLVFlightsTableViewCell()

@property (nonatomic, strong) UIView *darkView;

@end

@implementation SLVFlightsTableViewCell

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configureCell];
    }
    return self;
}

- (void)configureCell {
    _darkView = [UIView new];
    _darkView.backgroundColor = [UIColor darkSkyColor];
    [self.contentView addSubview:_darkView];
    
    _title = [UILabel new];
    _title.font = [UIFont titleHelvetica];
    _title.adjustsFontSizeToFitWidth = YES;
    _title.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_title];
    
    _flight = [UILabel new];
    _flight.font = [UIFont lightHelveticaLabels];
    _flight.textColor = [UIColor grayLabelColor];
    [self.contentView addSubview:_flight];
    
    _hotel = [UILabel new];
    _hotel.font = [UIFont lightHelveticaLabels];
    _hotel.textColor = [UIColor grayLabelColor];
    [self.contentView addSubview:_hotel];
    
    _dates = [UILabel new];
    _dates.font = [UIFont boldHelvetica];
    _dates.backgroundColor = [UIColor darkRedColor];
    _dates.layer.cornerRadius = 50;
    _dates.layer.borderColor = [UIColor grayColor].CGColor;
    _dates.layer.borderWidth = 1;
    _dates.layer.masksToBounds = YES;
    _dates.numberOfLines = 3;
    _dates.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_dates];
    
    self.contentView.backgroundColor = [UIColor whiteColor];
}

- (void)updateConstraints {
    UIView *contentView = self.contentView;
    [self.darkView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contentView.mas_left);
        make.right.equalTo(contentView.mas_right);
        make.top.equalTo(contentView.mas_top).with.offset(0);
        make.bottom.equalTo(contentView.mas_bottom).with.offset(0);
    }];
    [self.dates mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contentView.mas_left).with.offset(8);
        make.top.equalTo(contentView.mas_top).with.offset(14);
        make.bottom.equalTo(contentView.mas_bottom).with.offset(-16);
        make.size.equalTo(@100);
    }];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.dates.mas_right).with.offset(17);
        make.top.equalTo(self.contentView.mas_top).with.offset(15);
        make.right.equalTo(self.contentView.mas_right).with.offset(-6);
        make.height.equalTo(@39);
    }];
    [self.flight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.dates.mas_right).with.offset(20);
        make.top.equalTo(self.title.mas_bottom).with.offset(6);
        make.height.equalTo(@24);
    }];
    [self.hotel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.flight.mas_bottom).with.offset(5);
        make.left.equalTo(self.flight.mas_left);
        make.height.equalTo(@24);
    }];
    [super updateConstraints];
}

- (void)prepareForReuse {
    self.title.text = nil;
    self.hotel.text = nil;
    self.flight.text = nil;
    self.dates.text = nil;
}

@end

//
//  SLVFlightsTableViewController.m
//  Bolt
//
//  Created by 1 on 01.05.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import "SLVFlightsTableController.h"
#import "SLVFlightsTableViewCell.h"
#import "SLVFlight.h"
#import "SLVFlightsListModel.h"
#import "SLVFlightsTableDataSource.h"

static NSString *const SLVFligthsTableViewCellReuseIdentifier = @"SLVFligthsTableViewCell";

@interface SLVFlightsTableController () <UITableViewDelegate>

@property (nonatomic, strong) id<SLVProviderProtocol> model;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SLVFlightsTableDataSource *dataSource;

@end

@implementation SLVFlightsTableController

- (instancetype)initWithModel:(id<SLVProviderProtocol>)model {
    self = [super init];
    if (self) {
        _model = model;
        _dataSource = [[SLVFlightsTableDataSource alloc] initWithModel:model];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
    [self.tableView registerClass:[SLVFlightsTableViewCell class] forCellReuseIdentifier:SLVFligthsTableViewCellReuseIdentifier];
    self.tableView.rowHeight = 130;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self getFlights];
}

- (void)getFlights {
    __weak typeof(self) weakself = self;
    [self.model getItemsWIthCompletionBlock:^{
        __weak typeof(weakself) strongself = weakself;
        dispatch_async(dispatch_get_main_queue(), ^{
            [strongself.tableView reloadData];
        });
    }];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end

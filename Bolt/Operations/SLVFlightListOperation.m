//
//  SLVFlightListOperation.m
//  Bolt
//
//  Created by 1 on 13.06.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import "SLVFlightListOperation.h"
#import "SLVFlightsListModel.h"

static NSString *const url = @"http://partners.api.skyscanner.net/apiservices/browsequotes/v1.0/RU/eur/en-US/us/anywhere/anytime/anytime?apiKey=prtl6749387986743898559646983194";

@interface SLVFlightListOperation()

@property (nonatomic, weak) SLVFlightsListModel *model;
@property (nonatomic, weak) id<SLVNetworkDelegate> networkDelegate;

@end

@implementation SLVFlightListOperation

- (instancetype)initWithModel:(SLVFlightsListModel *)model andNetworkDelegate:(id<SLVNetworkDelegate>)networkDelegate {
    self = [super init];
    if (self) {
        _model = model;
        _networkDelegate = networkDelegate;
    }
    return self;
}

- (void)main {
    NSOperationQueue *queue = [NSOperationQueue new];
    queue.qualityOfService = NSQualityOfServiceDefault;
    
    dispatch_semaphore_t flightSemaphore = dispatch_semaphore_create(0);
    dispatch_semaphore_t hotelsSemaphore = dispatch_semaphore_create(0);
    
    NSOperation *downloadFlights = [NSBlockOperation blockOperationWithBlock:^{
        [self.networkDelegate getDictionaryFromURL:[NSURL URLWithString:url] withCompletionBlock:^(NSDictionary *data) {
            [self.model parseFlights:data];
            dispatch_semaphore_signal(flightSemaphore);
        }];
    }];
    
    NSOperation *downloadHotels = [NSBlockOperation blockOperationWithBlock:^{
        dispatch_semaphore_signal(hotelsSemaphore);
    }];
    [downloadHotels addDependency:downloadFlights];
    
    [queue addOperation:downloadFlights];
    dispatch_semaphore_wait(flightSemaphore, DISPATCH_TIME_FOREVER);
    
    [queue addOperation:downloadHotels];
    dispatch_semaphore_wait(hotelsSemaphore, DISPATCH_TIME_FOREVER);
}


@end

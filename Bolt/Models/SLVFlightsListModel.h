//
//  DIFFlightsListModel.h
//  Bolt
//
//  Created by 1 on 01.05.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLVProviderProtocol.h"
#import "SLVNetworkDelegate.h"

@interface SLVFlightsListModel : NSObject <SLVProviderProtocol>

- (instancetype)initWithNetworkDelegate:(id<SLVNetworkDelegate>)networkDelegate;
- (void)parseFlights:(NSDictionary *)data;

@end

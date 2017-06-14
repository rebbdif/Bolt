//
//  SLVFlightsTableDataProvider.h
//  Bolt
//
//  Created by 1 on 13.06.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLVProviderProtocol.h"
@import UIKit;

@interface SLVFlightsTableDataSource : NSObject <UITableViewDataSource>

- (instancetype)initWithModel:(id<SLVProviderProtocol>)model;

@end

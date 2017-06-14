//
//  SLVFlightsTableViewController.h
//  Bolt
//
//  Created by 1 on 01.05.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLVProviderProtocol.h"

@interface SLVFlightsTableController : UIViewController

- (instancetype)initWithModel:(id<SLVProviderProtocol>) model;

@end

//
//  AppDelegate.m
//  Bolt
//
//  Created by 1 on 01.05.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import "AppDelegate.h"
#import "SLVFlightsTableController.h"
#import "SLVFlightsListModel.h"
#import "SLVNetworkManager.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    SLVFlightsListModel *model = [[SLVFlightsListModel alloc] initWithNetworkDelegate:[SLVNetworkManager new]];
    SLVFlightsTableController *flightsTableController = [[SLVFlightsTableController alloc] initWithModel:model];
    UINavigationController *navigationController=[[UINavigationController alloc] initWithRootViewController:flightsTableController];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setRootViewController:navigationController];
    [self.window makeKeyAndVisible];
    return YES;
}

@end

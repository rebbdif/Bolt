//
//  SLVNetworkDelegate.h
//  Bolt
//
//  Created by 1 on 13.06.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SLVNetworkDelegate <NSObject>

- (void)getDictionaryFromURL:(NSURL *)url withCompletionBlock:(void (^)(NSDictionary * data))completionBlock;

@end

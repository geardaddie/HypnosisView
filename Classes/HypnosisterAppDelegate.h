//
//  HypnosisterAppDelegate.h
//  Hypnosister
//
//  Created by John Shields on 1/25/11.
//  Copyright 2011 Agilitec Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HypnosisView;

@interface HypnosisterAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	HypnosisView *view;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end


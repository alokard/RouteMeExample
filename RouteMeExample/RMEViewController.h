//
//  RMEViewController.h
//  RouteMeExample
//
//  Created by Zhenia on 03/21/13.
//  Copyright (c) 2013 Tulusha.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMMapViewDelegate.h"

@class RMMapView;

@interface RMEViewController : UIViewController <RMMapViewDelegate>

@property (nonatomic, weak) IBOutlet RMMapView *mapView;

@end
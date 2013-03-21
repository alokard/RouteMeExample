//
//  RMEViewController.m
//  RouteMeExample
//
//  Created by Zhenia on 03/21/13.
//  Copyright (c) 2013 Tulusha.com. All rights reserved.
//

#import "RMEViewController.h"
#import "RMMapView.h"
#import "RMMarker.h"
#import "RMMarkerManager.h"
#import "RMLayerCollection.h"
#import "RMPath.h"

@interface RMEViewController ()

@end

@implementation RMEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [RMMapView class];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

// Set map view center coordinate
    CLLocationCoordinate2D center;
    center.latitude = 47.582;
    center.longitude = -122.333;
    [_mapView.contents moveToLatLong:center];
    [_mapView.contents setZoom:15.0f];

// Add 2 markers(start/end)  and RMPath with 2 points
    RMMarker *newMarker;
    UIImage *startImage = [UIImage imageNamed:@"marker-blue.png"];
    UIImage *finishImage = [UIImage imageNamed:@"marker-blue.png"];
    UIColor* routeColor = [[UIColor alloc] initWithRed:(27.0 /255) green:(88.0 /255) blue:(156.0 /255) alpha:0.75];
    RMPath* routePath = [[RMPath alloc] initWithContents:_mapView.contents];
    [routePath setLineColor:routeColor];
    [routePath setFillColor:routeColor];
    [routePath setLineWidth:10.0f];
    CLLocationCoordinate2D newLocation;
    newLocation.latitude = 47.580;
    newLocation.longitude = -122.333;
    [routePath addLineToLatLong:newLocation];
    newLocation.latitude = 47.599;
    newLocation.longitude = -122.333;
    [routePath addLineToLatLong:newLocation];
    [[_mapView.contents overlay] addSublayer:routePath];

    newLocation.latitude = 47.580;
    newLocation.longitude = -122.333;
    newMarker = [[RMMarker alloc] initWithUIImage:startImage anchorPoint:CGPointMake(0.5, 1.0)];
    [_mapView.contents.markerManager addMarker:newMarker AtLatLong:newLocation];
    newMarker = nil;

    newLocation.latitude = 47.599;
    newLocation.longitude = -122.333;
    newMarker = [[RMMarker alloc] initWithUIImage:finishImage anchorPoint:CGPointMake(0.5, 1.0)];
    [_mapView.contents.markerManager addMarker:newMarker AtLatLong:newLocation];
    newMarker = nil;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Map View delegate



@end
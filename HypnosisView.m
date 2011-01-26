//
//  HypnosisView.m
//  Hypnosister
//
//  Created by John Shields on 1/25/11.
//  Copyright 2011 Agilitec Inc. All rights reserved.
//

#import "HypnosisView.h"


@implementation HypnosisView


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
	// What rectangle am I filling?
	CGRect bounds = [self bounds];
	
	
	// Where is it's center?
	CGPoint center;
	center.x = bounds.origin.x + bounds.size.width / 2.0;
	center.y = bounds.origin.y + bounds.size.height / 2.0;
	
	// From the center, how far out to a corner?
	float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
	
	// Get the context being drawn upon
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	// All lines will be drawn 10 points wide
	CGContextSetLineWidth(context, 10);
	
	// Set the stroke color to light gray
	[[UIColor lightGrayColor] setStroke];
	
	// Draw Concentric Circles from the outside in
	for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
		CGContextAddArc(context, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
		CGContextStrokePath(context);
	}
}

- (void)dealloc {
    [super dealloc];
}


@end

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
    
    NSMutableArray *colors = [[NSMutableArray alloc] init];
    
    [colors addObject:[UIColor blueColor]];
    [colors addObject:[UIColor redColor]];
    [colors addObject:[UIColor greenColor]];
    [colors addObject:[UIColor grayColor]];
    [colors addObject:[UIColor yellowColor]];
    [colors addObject:[UIColor orangeColor]];
    [colors addObject:[UIColor brownColor]];
	
	int colorIndex = 0;
    // Draw Concentric Circles from the outside in
	for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [[colors objectAtIndex:colorIndex++] setStroke];
        if (colorIndex >= [colors count]) colorIndex = 0;
		CGContextAddArc(context, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
		CGContextStrokePath(context);
	}
    
    [colors release];
	
	// Create a string
	NSString *text = @"You are getting sleepy.";
	
	// Get a font to draw it in
	UIFont *font = [UIFont boldSystemFontOfSize:28];
	
	// Where am I going to draw it?
	CGRect textRect;
	textRect.size = [text sizeWithFont:font];
	textRect.origin.x = center.x - textRect.size.width / 2.0;
	textRect.origin.y = center.y - textRect.size.height / 2.0;
	
	// Set the fill color
	[[UIColor blackColor] setFill];
	
	// Set the shadow
	CGSize offset = CGSizeMake(4, -3);
	CGColorRef color = [[UIColor darkGrayColor] CGColor];
	CGContextSetShadowWithColor(context, offset, 2.0, color);
	
	// Draw the string
	[text drawInRect:textRect withFont:font];
}

- (void)dealloc {
    [super dealloc];
}


@end

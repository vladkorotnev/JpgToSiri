//
//  JpgToExtension.m
//  JpgTo
//
//  Created by Vladislav Korotnev on 27.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JpgToExtension.h"
#import "JpgToCommands.h"
#import "JpgToSnippet.h"

@implementation JpgToExtension

-(id)initWithSystem:(id<SESystem>)system
{
	if ((self = [super init]))
	{
		[system registerCommand:[JpgToCommands class]];
		[system registerSnippet:[JpgToSnippet class]];
	}
	return self;
}

-(NSString*)author
{
	return @"Vladislav Korotnev";
}

-(NSString*)name
{
	return @"JpgToSiri";
}

-(NSString*)description
{
	return @"Usage: \"Show me a picture of something\"";
}

-(NSString*)website
{
	return @"http://vladkorotnev.github.com";
}

-(NSString*)versionRequirement
{
	return @"1.0.1";
}

@end
//
//  JpgToCommands.m
//  JpgTo
//
//  Created by Vladislav Korotnev on 27.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JpgToCommands.h"

@implementation JpgToCommands

-(id)init
{
	if ((self = [super init]))
	{
	}
	return self;
}

-(void)dealloc
{
	[super dealloc];
}

-(BOOL)handleSpeech:(NSString*)text tokens:(NSArray*)tokens tokenSet:(NSSet*)tokenset context:(id<SEContext>)ctx
{
	//NSLog(@"JpgToCommands handleSpeech: %@", text);
	
	// react to recognized tokens (what happen or what happened)
	if ([tokenset count] > 1 && [tokenset containsObject:@"show"]&& [tokenset containsObject:@"me"]&& [tokenset containsObject:@"picture"])
	{

        NSString *stringWeGot = @"";
        for (NSString *curToken in tokens) {
            if (![curToken isEqualToString:@"a"] && ![curToken isEqualToString:@"show"] && ![curToken isEqualToString:@"me"] && ![curToken isEqualToString:@"an"] && ![curToken isEqualToString:@"picture"]&&![curToken isEqualToString:@"of"]) {
                stringWeGot = [NSString stringWithFormat:@"%@ %@",stringWeGot,curToken];
            }
        }
        NSString *htmlString = [NSString stringWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@.jpg.to",[stringWeGot stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]] encoding:NSUTF8StringEncoding error:nil];
        NSScanner *theScanner = [NSScanner scannerWithString:htmlString];
        NSString *url = @"";
        // find start of IMG tag
        [theScanner scanUpToString:@"<img" intoString:nil];
        if (![theScanner isAtEnd]) {
            [theScanner scanUpToString:@"src" intoString:nil];
            NSCharacterSet *charset = [NSCharacterSet characterSetWithCharactersInString:@"\"'"];
            [theScanner scanUpToCharactersFromSet:charset intoString:nil];
            [theScanner scanCharactersFromSet:charset intoString:nil];
            [theScanner scanUpToCharactersFromSet:charset intoString:&url];
            // "url" now contains the URL of the img
        }

        
		NSDictionary* snipProps = [NSDictionary dictionaryWithObjectsAndKeys:@"There you have it", @"text", url, @"link", nil];
        
        
        
		NSMutableArray* views = [NSMutableArray arrayWithCapacity:2];
		[views addObject:[ctx createAssistantUtteranceView:[NSString stringWithFormat:@"Here is a picture of %@",stringWeGot]]];
		[views addObject:[ctx createSnippet:@"JpgToSnippet" properties:snipProps]];
		[ctx sendAddViews:views];

		// for more complex extensions, do something asynchronly here...

		// end of the request
		[ctx sendRequestCompleted];
		
		return YES; // handled by extension
	}
	
	return NO;
}

@end

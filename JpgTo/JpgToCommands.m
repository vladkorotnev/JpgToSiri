//
//  JpgToCommands.m
//  JpgTo
//
//  Created by Vladislav Korotnev on 27.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JpgToCommands.h"
#import "NSURL+IFUnicodeURL.h"
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
	NSLog(@"JpgToCommands handleSpeech: %@", tokens);
	
	//////////////
	// ENGLISH  //
	//////////////
	if ([tokenset count] > 1 && [tokenset containsObject:@"show"]&& [tokenset containsObject:@"me"]&& [tokenset containsObject:@"picture"])
	{

        NSString *stringWeGot = @"";
        for (NSString *curToken in tokens) {
            if (![curToken isEqualToString:@"a"] && ![curToken isEqualToString:@"show"] && ![curToken isEqualToString:@"me"] && ![curToken isEqualToString:@"an"] && ![curToken isEqualToString:@"picture"]&&![curToken isEqualToString:@"of"]) {
                if([stringWeGot isEqualToString:@""]) {
                    stringWeGot = [NSString stringWithFormat:@"%@%@",stringWeGot,curToken];
                } else {
                    stringWeGot = [NSString stringWithFormat:@"%@ %@",stringWeGot,curToken];
                }
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
		[views addObject:[ctx createAssistantUtteranceView:@"I found this for you:"]];
		[views addObject:[ctx createSnippet:@"JpgToSnippet" properties:snipProps]];
		[ctx sendAddViews:views];

		// for more complex extensions, do something asynchronly here...

		// end of the request
		[ctx sendRequestCompleted];
		
		return YES; // handled by extension
	}
	//////////////
	// FRENCH   //
	//////////////
	if ([tokenset count] > 1 && [tokenset containsObject:@"montrez"]&& [tokenset containsObject:@"moi"] )
	{

        NSString *stringWeGot = @"";
        for (NSString *curToken in tokens) {
            if (![curToken isEqualToString:@"montrez"] && ![curToken isEqualToString:@"moi"]) {
                if([stringWeGot isEqualToString:@""]) {
                    stringWeGot = [NSString stringWithFormat:@"%@%@",stringWeGot,curToken];
                } else {
                    stringWeGot = [NSString stringWithFormat:@"%@ %@",stringWeGot,curToken];
                }
            }
        }
         NSLog(@"We are gonna check out %@",[NSString stringWithFormat:@"http://%@.jpg.to",[stringWeGot stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]);
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
		[views addObject:[ctx createAssistantUtteranceView:@"Voici ce que j'ai trouvé:"]];
		[views addObject:[ctx createSnippet:@"JpgToSnippet" properties:snipProps]];
		[ctx sendAddViews:views];

		// for more complex extensions, do something asynchronly here...

		// end of the request
		[ctx sendRequestCompleted];
		
		return YES; // handled by extension
	}
    
    //////////////
	// GERMAN   //
	//////////////
	if ([tokenset count] > 1 && [tokenset containsObject:@"zeig"]&& [tokenset containsObject:@"mir"] )
	{
        
        NSString *stringWeGot = @"";
        for (NSString *curToken in tokens) {
            if (![curToken isEqualToString:@"zeig"] && ![curToken isEqualToString:@"mir"] && ![curToken isEqualToString:@"den"] && ![curToken isEqualToString:@"ein"] && ![curToken isEqualToString:@"eine"]) {
                if([stringWeGot isEqualToString:@""]) {
                    stringWeGot = [NSString stringWithFormat:@"%@%@",stringWeGot,curToken];
                } else {
                    stringWeGot = [NSString stringWithFormat:@"%@ %@",stringWeGot,curToken];
                }
            }
        }
        NSLog(@"We are gonna check out %@",[NSString stringWithFormat:@"http://%@.jpg.to",[stringWeGot stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]);
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
		[views addObject:[ctx createAssistantUtteranceView:@"Hier ist was ich gefunden habe:"]];
		[views addObject:[ctx createSnippet:@"JpgToSnippet" properties:snipProps]];
		[ctx sendAddViews:views];
        
		// for more complex extensions, do something asynchronly here...
        
		// end of the request
		[ctx sendRequestCompleted];
		
		return YES; // handled by extension
	}
    
	///////////////
	//  RUSSIAN  //
	///////////////
	
		if ([tokenset count] > 1 && [tokenset containsObject:@"покажи"]&& [tokenset containsObject:@"мне"])
	{

        NSString *stringWeGot = @"";
        for (NSString *curToken in tokens) {
            if (![curToken isEqualToString:@"покажи"] && ![curToken isEqualToString:@"мне"]) {
                if([stringWeGot isEqualToString:@""]) {
                    stringWeGot = [NSString stringWithFormat:@"%@%@",stringWeGot,curToken];
                } else {
                     stringWeGot = [NSString stringWithFormat:@"%@ %@",stringWeGot,curToken];
                }
            }
        }
        
      
        NSLog(@"We are gonna check out %@",[NSString stringWithFormat:@"http://%@.jpg.to",stringWeGot]);
        NSURL *urlToGet = [NSURL URLWithUnicodeString:[NSString stringWithFormat:@"http://%@.jpg.to",stringWeGot]];
        NSString *htmlString = [NSString stringWithContentsOfURL:urlToGet encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"Before escaping it was %@",[urlToGet absoluteString]);
    
                                
                                
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
		[views addObject:[ctx createAssistantUtteranceView:@"Вот что я нашла:"]];
		[views addObject:[ctx createSnippet:@"JpgToSnippet" properties:snipProps]];
		[ctx sendAddViews:views];

		// for more complex extensions, do something asynchronly here...

		// end of the request
		[ctx sendRequestCompleted];
		
		return YES; // handled by extension
	}

	
    ////////////////
	//  JAPANESE  //
	////////////////
	
    /*
    if ([tokenset count] > 1 && [tokenset containsObject:@"私は"]&& [tokenset containsObject:@"表示"])
	{
        
        NSString *stringWeGot = @"";
        for (NSString *curToken in tokens) {
            if (![curToken isEqualToString:@"私は"] && ![curToken isEqualToString:@"表示"]) {
                if([stringWeGot isEqualToString:@""]) {
                    stringWeGot = [NSString stringWithFormat:@"%@%@",stringWeGot,curToken];
                } else {
                    stringWeGot = [NSString stringWithFormat:@"%@ %@",stringWeGot,curToken];
                }
            }
        }
        
        
        NSLog(@"We are gonna check out %@",[NSString stringWithFormat:@"http://%@.jpg.to",stringWeGot]);
        NSURL *urlToGet = [NSURL URLWithUnicodeString:[NSString stringWithFormat:@"http://%@.jpg.to",stringWeGot]];
        NSString *htmlString = [NSString stringWithContentsOfURL:urlToGet encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"Before escaping it was %@",[urlToGet absoluteString]);
        
        
        
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
		[views addObject:[ctx createAssistantUtteranceView:[NSString stringWithFormat:@"Вот как выглядит %@",stringWeGot]]];
		[views addObject:[ctx createSnippet:@"JpgToSnippet" properties:snipProps]];
		[ctx sendAddViews:views];
        
		// for more complex extensions, do something asynchronly here...
        
		// end of the request
		[ctx sendRequestCompleted];
		
		return YES; // handled by extension
	} */
    
	return NO;
}

@end

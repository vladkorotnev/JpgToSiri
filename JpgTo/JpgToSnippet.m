//
//  JpgToSnippet.m
//  JpgTo
//
//  Created by Vladislav Korotnev on 27.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JpgToSnippet.h"
#import <Twitter/Twitter.h>
@implementation JpgToSnippet
@synthesize linkUrl;
- (id)view
{
	return _view;
}

- (IBAction)openInSafari:(id)sender {
    [[[UIActionSheet alloc]initWithTitle:@"Select:" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Copy image",@"Copy link",@"Open in Safari",@"Save to Camera roll", nil]showInView:sheetView];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if ([[actionSheet buttonTitleAtIndex:buttonIndex]isEqualToString:@"Copy image"]) {
        [[UIPasteboard generalPasteboard]setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:linkUrl]]]];
    }
    if ([[actionSheet buttonTitleAtIndex:buttonIndex]isEqualToString:@"Copy link"]) {
        [[UIPasteboard generalPasteboard]setString:linkUrl];
    }
    if ([[actionSheet buttonTitleAtIndex:buttonIndex]isEqualToString:@"Open in Safari"]) {
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:linkUrl]];
    }
    if ([[actionSheet buttonTitleAtIndex:buttonIndex]isEqualToString:@"Save to Camera roll"]) {
        UIImageWriteToSavedPhotosAlbum([UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:linkUrl]]], nil, nil, nil);
    }
}

- (void)dealloc
{
	[_view release];
	[super dealloc];
}

- (id)initWithProperties:(NSDictionary*)props;
{
	// NSLog(@"[JpgToSnippet initWithProperties:'%@']", props);
    NSLog(@"JpgToSiri by vladkorotnev. This build is dedicated to: Shana. Copyright Vladislav Korotnev 2012. If you're reading this, then why are you wasting your life watching the console? :P");
	if ((self = [super init]))
	{
		if (![[NSBundle bundleForClass:[self class]] loadNibNamed:@"JpgToNib" owner:self options:nil])
		{
			NSLog(@"Failed to load nib file.");
			return NO;
		}
		_view = [_nib retain]; 
		[_webView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[props objectForKey:@"link"]]]]];
        [self setLinkUrl:[props objectForKey:@"link"]];
        [linkUrl retain];
        sheetView = [[UIView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
        [sheetView setBackgroundColor:[UIColor clearColor]];
        [sheetView setHidden:YES];
        [_view addSubview:sheetView];
        [sheetView retain];
	}
	return self;
}

@end
//
//  JpgToSnippet.h
//  JpgTo
//
//  Created by Vladislav Korotnev on 27.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

// AssistantExtensions by Mario Hros
// See http://ae.k3a.me/

#import <AssistantExtensions/SiriObjects.h>

// this class represents one visible "snippet" (e.g. Weather, Notes, etc)
// there can be 0, 1 or more different SESnippet classes per AE Extension
// each different SESnippet class must be "registered" in *Extenion's -[initWithSystem:system]

// #error iOSOpenDev Post-Template Project Creation Requirement (remove these lines after completed) -- \
 Add a Copy Bundle Resources Build Phase to compile JpgToNib.xib: \
 (1) go to TARGETS > Build Phases > Add Build Phase > Add Copy Bundle Resources, drag and drop JpgToNib.xib into the Copy Bundle Resources item list \
 (2) drag and drop the Copy Bundle Resources Build Phase so that it is ABOVE the Run Script Build Phase

@interface JpgToSnippet : NSObject<SESnippet,UIActionSheetDelegate> {
    UIView* _view;
    NSString* linkUrl;
    UIView *sheetView;
	IBOutlet UIView* _nib;
	IBOutlet UIImageView* _webView;
}

- (id)initWithProperties:(NSDictionary*)props;
- (id)view;
- (IBAction)openInSafari:(id)sender;
@property (nonatomic,retain) NSString *linkUrl;
@end
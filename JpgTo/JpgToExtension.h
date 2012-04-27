//
//  JpgToExtension.h
//  JpgTo
//
//  Created by Vladislav Korotnev on 27.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <AssistantExtensions/SiriObjects.h>

// main class of the AE extension
// name of this class must be the value of the key NSPrincipalClass in Info.plist
// only one SEExtension class can exist for an AE Extension
// each SECommand and SESnippet class must be registered in this class's -[initWithSystem:system]

@interface JpgToExtension : NSObject<SEExtension>

-(id)initWithSystem:(id<SESystem>)system;

-(NSString*)author;
-(NSString*)name;
-(NSString*)description;
-(NSString*)website;
-(NSString*)versionRequirement;

@end

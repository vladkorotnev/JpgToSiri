//
//  JpgToCommands.h
//  JpgTo
//
//  Created by Vladislav Korotnev on 27.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <AssistantExtensions/SiriObjects.h>

// class to handle commands for the AE Extension
// one or more SECommand class can exist per AE Extension but normally just one
// each different SECommand class must be "registered" in *Extenion's -[initWithSystem:system]

@interface JpgToCommands : NSObject<SECommand>

-(BOOL)handleSpeech:(NSString*)text tokens:(NSArray*)tokens tokenSet:(NSSet*)tokenset context:(id<SEContext>)ctx;

@end

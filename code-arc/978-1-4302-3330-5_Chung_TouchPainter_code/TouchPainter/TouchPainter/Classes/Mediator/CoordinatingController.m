//
//  CoordinatingController.m
//  TouchPainter
//
//  Created by Carlo Chung on 10/18/10.
//  Copyright 2010 Carlo Chung. All rights reserved.
//

#import "CoordinatingController.h"


@implementation CoordinatingController

@synthesize activeViewController=activeViewController_;
@synthesize canvasViewController=canvasViewController_;

#pragma mark -
#pragma mark CoordinatingController Singleton Implementation

+ (CoordinatingController *) sharedInstance
{
    
    static CoordinatingController *sharedCoordinator = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedCoordinator = [[CoordinatingController alloc] init];
    });
    return sharedCoordinator;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        canvasViewController_ = [[CanvasViewController alloc] initWithNibName:@"CanvasViewController" bundle:nil];
        activeViewController_ = canvasViewController_;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    return [[self class] sharedInstance];
}

- (void)encodeWithCoder:(NSCoder *)coder {
    
}
#pragma mark -
#pragma mark A method for view transitions

- (IBAction) requestViewChangeByObject:(id)object
{
    
    if ([object isKindOfClass:[UIBarButtonItem class]])
    {
        switch ([(UIBarButtonItem *)object tag])
        {
            case kButtonTagOpenPaletteView:
            {
                // load a PaletteViewController
                PaletteViewController *controller = [[PaletteViewController alloc] init];
                // transition to the PaletteViewController
                [canvasViewController_ presentViewController:controller animated:YES completion:nil];
                // set the activeViewController to
                // paletteViewController
                activeViewController_ = controller;
            }
                break;
            case kButtonTagOpenThumbnailView:
            {
                // load a ThumbnailViewController
                ThumbnailViewController *controller = [[ThumbnailViewController alloc] init];
                // transition to the ThumbnailViewController
                [canvasViewController_ presentViewController:controller animated:YES completion:nil];
                // set the activeViewController to
                // ThumbnailViewController
                activeViewController_ = controller;
            }
                break;
            default:
                // just go back to the main canvasViewController
                // for the other types
            {
                // The Done command is shared on every
                // view controller except the CanvasViewController
                // When the Done button is hit, it should
                // take the user back to the first page in
                // conjunction with the design
                // other objects will follow the same path
                [canvasViewController_ dismissViewControllerAnimated:YES completion:nil];
                // set the activeViewController back to
                // canvasViewController
                activeViewController_ = canvasViewController_;
            }
                break;
        }
    }
    // every thing else goes to the main canvasViewController
    else
    {
        [canvasViewController_ dismissViewControllerAnimated:YES completion:nil];
        // set the activeViewController back to
        // canvasViewController
        activeViewController_ = canvasViewController_;
    }
    
}

@end

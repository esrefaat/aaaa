//
//  StartViewController.m
//  aaaa
//
//  Created by Eslam Refaat on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StartViewController.h"

@interface StartViewController ()

@end

@implementation StartViewController
@synthesize mainWebView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"loadedj .... ");
    NSURL*url=[NSURL URLWithString:@"http://www.alarabiya.net"];
    NSURLRequest*request=[NSURLRequest requestWithURL:url];
    //[self.mainWebView mainFrame] loadRequest:request];    
    [self.mainWebView loadRequest:request];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setMainWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

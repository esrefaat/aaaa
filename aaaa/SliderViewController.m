//
//  SliderViewController.m
//  aaaa
//
//  Created by Eslam Refaat on 6/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SliderViewController.h"

@interface SliderViewController ()

@end

@implementation SliderViewController

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
    // Do any additional setup after loading the view from its nib.
    NSLog(@"inside ipad did load .... ");

    UIScrollView *scr=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scr.tag = 1;
    scr.autoresizingMask=UIViewAutoresizingNone;
    [self.view addSubview:scr];
    [self setupScrollView:scr];
    UIPageControl *pgCtr = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 264, 480, 36)];
    [pgCtr setTag:12];
    pgCtr.numberOfPages=10;
    pgCtr.autoresizingMask=UIViewAutoresizingNone;
    [self.view addSubview:pgCtr];
}

- (void)setupScrollView:(UIScrollView*)scrMain {
    // we have 10 images here.
    // we will add all images into a scrollView &amp; set the appropriate size.
    NSArray *names;
    names = [NSArray arrayWithObjects:
             @"http://images.alarabiya.net/2d/db/278x209_3862_218784.jpg",
             @"http://images.alarabiya.net/1b/b9/278x209_16905_218825.jpg",
             @"http://images.alarabiya.net/df/fc/278x209_51304_218874.jpg",
             @"http://images.alarabiya.net/8b/b2/278x209_81169_218856.jpg",
             @"http://images.alarabiya.net/32/26/278x209_96337_218775.jpg",
             @"http://images.alarabiya.net/a2/2d/278x209_34610_218767.jpg",
             @"http://images.alarabiya.net/55/5b/278x209_96902_218630.jpg",
             @"http://images.alarabiya.net/19/96/278x209_6800_218878.jpg",
             @"http://images.alarabiya.net/98/84/278x209_32108_218628.jpg",
             @"http://images.alarabiya.net/4e/e6/278x209_2867_218587.jpg",
             nil];     
    for (int i=0; i<10; i++) {
        // create image
      //  NSLog(@"i%");
        //NSString *imagename = @"large1.jpg";
        //NSString *imagename = [NSString stringWithFormat:@"large%@.jpg",i];
        //NSLog(@"Image name is: %@", imagename.description);
        //UIImage *image = [UIImage imageNamed: imagename];
        //NSLog(@"hi");
        //UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://images.alarabiya.net/7a/aa/436x328_32462_218842.jpg"]]];
        
        NSString *imagename = [names objectAtIndex:i];
        NSLog(@"Image URL is: %@", imagename.description);
        
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imagename]]];
        // create imageView
        //UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake((i)*scrMain.frame.size.width, 0, scrMain.frame.size.width, scrMain.frame.size.height)];
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake((i)*scrMain.frame.size.width, 0, scrMain.frame.size.width, image.size.height)];
        // set scale to fill
        imgV.contentMode=UIViewContentModeScaleToFill;
        // set image
        [imgV setImage:image];
        // apply tag to access in future
        imgV.tag=i+2;
        // add to scrollView
        [scrMain addSubview:imgV];
    }
    // set the content size to 10 image width
    [scrMain setContentSize:CGSizeMake(scrMain.frame.size.width*10, scrMain.frame.size.height)];
    // enable timer after each 2 seconds for scrolling.
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(scrollingTimer) userInfo:nil repeats:YES];
}

- (void)scrollingTimer {
    // access the scroll view with the tag
    UIScrollView *scrMain = (UIScrollView*) [self.view viewWithTag:1];
    // same way, access pagecontroll access
    UIPageControl *pgCtr = (UIPageControl*) [self.view viewWithTag:12];
    // get the current offset ( which page is being displayed )
    CGFloat contentOffset = scrMain.contentOffset.x;
    // calculate next page to display
    int nextPage = (int)(contentOffset/scrMain.frame.size.width) + 1 ;
    // if page is not 10, display it
    if( nextPage!=10 )  {
        [scrMain scrollRectToVisible:CGRectMake(nextPage*scrMain.frame.size.width, 0, scrMain.frame.size.width, scrMain.frame.size.height) animated:YES];
        pgCtr.currentPage=nextPage;
        // else start sliding form 1 :)
    } else {
        [scrMain scrollRectToVisible:CGRectMake(0, 0, scrMain.frame.size.width, scrMain.frame.size.height) animated:YES];
        pgCtr.currentPage=0;
    }
}

///////////////////////////////////////*/


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end

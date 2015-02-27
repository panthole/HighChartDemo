//
//  AppDelegate.m
//  HighChartDemo1
//
//  Created by 潘凌越 on 2/27/15.
//  Copyright (c) 2015 panthole. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [self.webView setDelegate:self];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"graph" ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.view addSubview: self.webView];
    [self.webView loadRequest:request];

    
   }

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (void) webViewDidStartLoad:(UIWebView *)webView
{
    //创建UIActivityIndicatorView背底半透明View     
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];  
    [view setTag:108];  
    [view setBackgroundColor:[UIColor blackColor]];  
    [view setAlpha:0.5];  
    [self.view addSubview:view];  
    
    activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];  
    [activityIndicator setCenter:view.center];  
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];  
    [view addSubview:activityIndicator];  

    [activityIndicator startAnimating];
    NSLog(@"webViewDidStartLoad");
}
- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    //此处将数据生成json对象，以参数的形式传入到graph.html中
    NSString *js=@"draw([[Date.UTC(1970,  9, 27), 0],[Date.UTC(1970, 10, 10), 0.6 ],[Date.UTC(1970, 10, 18), 0.7 ],[Date.UTC(1970, 11,  2), 0.8 ],[Date.UTC(1970, 11,  9), 0.6 ]]);";
    
    [self.webView stringByEvaluatingJavaScriptFromString:js];
    
    [activityIndicator stopAnimating];

    UIView *view = (UIView*)[self.view viewWithTag:108];
    [view removeFromSuperview];
    

    NSLog(@"webViewDidFinishLoad");

}
- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [activityIndicator stopAnimating];
    UIView *view = (UIView*)[self.view viewWithTag:108];
    [view removeFromSuperview];
    NSLog(@"didFailLoadWithError:%@", error);
}
@end

//
//  AppDelegate.m
//  HighChartDemo1
//
//  Created by 潘凌越 on 2/27/15.
//  Copyright (c) 2015 panthole. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate>
{
    UIActivityIndicatorView *activityIndicator;
    
}
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@end

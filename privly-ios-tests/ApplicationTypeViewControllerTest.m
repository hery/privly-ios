//
//  ApplicationTypeViewControllerTest.m
//  privly-ios
//  Copyright 2013 The Privly Foundation.
//

#import "ApplicationTypeViewControllerTest.h"
#import "ApplicationTypeViewController.h"
#import "LoginViewController.h"
#import "PostTypeViewController.h"
#import "ContentServerViewController.h"

@implementation ApplicationTypeViewControllerTest

- (void)setUp
{
    [super setUp];
    NSLog(@"%@ setUp", self.name);
    appDelegate = [[UIApplication sharedApplication] delegate];
    applicationTypeViewController = [[ApplicationTypeViewController alloc] init];
    [appDelegate.nav pushViewController:applicationTypeViewController animated:YES];
}

- (void)tearDown
{
    NSLog(@"%@ tearDown", self.name);
    applicationTypeViewController = nil;
    appDelegate = nil;
    [super tearDown];
}

- (void)testTitle
{
    STAssertEqualObjects(applicationTypeViewController.title,
                         @"Privly",
                         @"Title is different from Privly.");
}

- (void)testReadButton
{
    STAssertEqualObjects(applicationTypeViewController.navigationItem.rightBarButtonItem.title,
                         @"Settings", @"Reading mode button is not set.");
}

- (void)testLogoutButton
{
    STAssertEqualObjects(applicationTypeViewController.navigationItem.leftBarButtonItem.title,
                         @"Logout", @"Reading mode button is not set.");
}

- (void)testLogoutMethod {
    [applicationTypeViewController logout:nil];
    STAssertEquals([applicationTypeViewController.navigationController.topViewController class],
                   [LoginViewController class],
                   @"Logout method failed to push a new LoginViewController");
}

- (void)testCreatePostMethod {
    [applicationTypeViewController createPost:nil];
    STAssertEquals([applicationTypeViewController.navigationController.topViewController class],
                   [PostTypeViewController class],
                   @"CreatePost method failed to push a new PostTypeViewController");
}

- (void)testContentServerMethod {
    [applicationTypeViewController contentServer:nil];
    STAssertEquals([applicationTypeViewController.presentedViewController class],
                   [ContentServerViewController class],
                   @"ContentServer method failed to push a new ContentServerViewController");
}

@end

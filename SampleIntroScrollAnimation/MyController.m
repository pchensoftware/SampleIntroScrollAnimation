//
//  MyController.m
//  SampleIntroScrollAnimation
//
//  Created by Peter Chen on 1/16/14.
//  Copyright (c) 2014 Peter Chen. All rights reserved.
//

#import "MyController.h"
#import "IFTTTJazzHands.h"

#define kNumPages 2

@interface MyController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *page1View1;
@property (nonatomic, strong) UIView *page1View2;
@property (nonatomic, strong) UIView *page1View3;
@property (nonatomic, strong) UIView *page2View1;
@property (nonatomic, strong) UIView *page2View2;
@property (nonatomic, strong) UIView *page2View3;
@property (nonatomic, strong) IFTTTAnimator *animator;

@end

@implementation MyController

- (id)init
{
    self = [super init];
    if (self) {
        self.animator = [[IFTTTAnimator alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = YES;
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(kNumPages * self.view.frame.size.width, self.view.frame.size.height - 64);
    [self.view addSubview:self.scrollView];
    
    self.page1View1 = [self _addViewAtFrame:CGRectMake(50, 50, 50, 50) color:[UIColor redColor]];
    self.page1View2 = [self _addViewAtFrame:CGRectMake(250, 250, 50, 50) color:[UIColor greenColor]];
    self.page1View3 = [self _addViewAtFrame:CGRectMake(100, 400, 50, 50) color:[UIColor blueColor]];
    self.page2View1 = [self _addViewAtFrame:CGRectMake(self.view.frame.size.width + 100, 200, 30, 30) color:[UIColor redColor]];
    self.page2View2 = [self _addViewAtFrame:CGRectMake(self.view.frame.size.width + 150, 200, 30, 30) color:[UIColor greenColor]];
    self.page2View3 = [self _addViewAtFrame:CGRectMake(self.view.frame.size.width + 200, 200, 30, 30) color:[UIColor blueColor]];
    
    [self _createPage1Animations];
    [self _createPage2Animations];
}

- (UIView *)_addViewAtFrame:(CGRect)frame color:(UIColor *)color {
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = color;
    [self.scrollView addSubview:view];
    return view;
}

- (void)_createPage1Animations {
    IFTTTFrameAnimation *page1View1Animation = [IFTTTFrameAnimation animationWithView:self.page1View1];
    IFTTTFrameAnimation *page1View2Animation = [IFTTTFrameAnimation animationWithView:self.page1View2];
    IFTTTFrameAnimation *page1View3Animation = [IFTTTFrameAnimation animationWithView:self.page1View3];
    [self.animator addAnimation:page1View1Animation];
    [self.animator addAnimation:page1View2Animation];
    [self.animator addAnimation:page1View3Animation];
    [page1View1Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:20 andFrame:self.page1View1.frame]];
    [page1View1Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:150 andFrame:CGRectMake(150, 100, 75, 75)]];
    [page1View2Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:50 andFrame:self.page1View2.frame]];
    [page1View2Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:150 andFrame:CGRectMake(250, 100, 75, 75)]];
    [page1View3Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:80 andFrame:self.page1View3.frame]];
    [page1View3Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:150 andFrame:CGRectMake(350, 100, 75, 75)]];
}

- (void)_createPage2Animations {
    IFTTTFrameAnimation *page2View1Animation = [IFTTTFrameAnimation animationWithView:self.page2View1];
    IFTTTFrameAnimation *page2View2Animation = [IFTTTFrameAnimation animationWithView:self.page2View2];
    IFTTTFrameAnimation *page2View3Animation = [IFTTTFrameAnimation animationWithView:self.page2View3];
    [self.animator addAnimation:page2View1Animation];
    [self.animator addAnimation:page2View2Animation];
    [self.animator addAnimation:page2View3Animation];
    [page2View1Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:200 andFrame:self.page2View1.frame]];
    [page2View1Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:320 andFrame:CGRectMake(self.scrollView.frame.size.width + 50, 300, 100, 100)]];
    [page2View2Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:210 andFrame:self.page2View2.frame]];
    [page2View2Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:320 andFrame:CGRectMake(self.scrollView.frame.size.width + 100, 350, 100, 100)]];
    [page2View3Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:220 andFrame:self.page2View3.frame]];
    [page2View3Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:320 andFrame:CGRectMake(self.scrollView.frame.size.width + 150, 400, 100, 100)]];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.animator animate:scrollView.contentOffset.x];
}

@end

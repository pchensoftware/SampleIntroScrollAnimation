//
//  MyController.m
//  SampleIntroScrollAnimation
//
//  Created by Peter Chen on 1/16/14.
//  Copyright (c) 2014 Peter Chen. All rights reserved.
//

#import "MyController.h"
#import "IFTTTJazzHands.h"

#define kNumPages 3

@interface MyController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *page1View1;
@property (nonatomic, strong) UIView *page1View2;
@property (nonatomic, strong) UIView *page1View3;
@property (nonatomic, strong) UIView *page2View1;
@property (nonatomic, strong) UIView *page2View2;
@property (nonatomic, strong) UIView *page2View3;
@property (nonatomic, strong) IFTTTAnimator *animator;
@property (nonatomic, readonly) int pageWidth; // equals self.scrollView.frame.size.width, to save space

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
    
    self.title = @"Jazz Hands Animation";
    
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
    
    [self _createPage1To2AnimationsPart1];
    [self _createPage1To2AnimationsPart2];
    [self _createPage2To3Animations];
}

- (int)pageWidth {
    return self.scrollView.frame.size.width;
}

- (UIView *)_addViewAtFrame:(CGRect)frame color:(UIColor *)color {
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = color;
    [self.scrollView addSubview:view];
    return view;
}

- (void)_createPage1To2AnimationsPart1 {
    IFTTTFrameAnimation *view1Animation = [IFTTTFrameAnimation animationWithView:self.page1View1];
    IFTTTFrameAnimation *view2Animation = [IFTTTFrameAnimation animationWithView:self.page1View2];
    IFTTTFrameAnimation *view3Animation = [IFTTTFrameAnimation animationWithView:self.page1View3];
    [view1Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:20 andFrame:self.page1View1.frame]];
    [view1Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:150 andFrame:CGRectMake(150, 100, 75, 75)]];
    [view2Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:50 andFrame:self.page1View2.frame]];
    [view2Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:150 andFrame:CGRectMake(250, 100, 75, 75)]];
    [view3Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:80 andFrame:self.page1View3.frame]];
    [view3Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:150 andFrame:CGRectMake(350, 100, 75, 75)]];
    [self.animator addAnimation:view1Animation];
    [self.animator addAnimation:view2Animation];
    [self.animator addAnimation:view3Animation];
}

- (void)_createPage1To2AnimationsPart2 {
    IFTTTFrameAnimation *view1Animation = [IFTTTFrameAnimation animationWithView:self.page2View1];
    IFTTTFrameAnimation *view2Animation = [IFTTTFrameAnimation animationWithView:self.page2View2];
    IFTTTFrameAnimation *view3Animation = [IFTTTFrameAnimation animationWithView:self.page2View3];
    [view1Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:200 andFrame:self.page2View1.frame]];
    [view1Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:320 andFrame:CGRectMake(self.pageWidth + 50, 300, 100, 100)]];
    [view2Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:210 andFrame:self.page2View2.frame]];
    [view2Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:320 andFrame:CGRectMake(self.pageWidth + 100, 350, 100, 100)]];
    [view3Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:220 andFrame:self.page2View3.frame]];
    [view3Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:320 andFrame:CGRectMake(self.pageWidth + 150, 400, 100, 100)]];
    [self.animator addAnimation:view1Animation];
    [self.animator addAnimation:view2Animation];
    [self.animator addAnimation:view3Animation];
}

- (void)_createPage2To3Animations {
    IFTTTFrameAnimation *stayView1Animation = [IFTTTFrameAnimation animationWithView:self.page2View2];
    [stayView1Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:200 andFrame:self.page2View2.frame]];
    [stayView1Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:1*self.pageWidth andFrame:CGRectMake(1*self.pageWidth + 100, 350, 100, 100)]];
    [stayView1Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:2*self.pageWidth andFrame:CGRectMake(2*self.pageWidth + 100, 350, 100, 100)]];
    [self.animator addAnimation:stayView1Animation];
    
    IFTTTAngleAnimation *rotateView1Animation = [IFTTTAngleAnimation animationWithView:self.page2View2];
    [rotateView1Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:1*self.pageWidth andAngle:0]];
    [rotateView1Animation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:2*self.pageWidth andAngle:2*M_PI]];
    [self.animator addAnimation:rotateView1Animation];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.animator animate:scrollView.contentOffset.x];
}

@end

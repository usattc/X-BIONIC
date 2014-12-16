//
//  ViewController.m
//  x-bionic
//
//  Created by TTC on 12/10/14.
//  Copyright (c) 2014 TTC. All rights reserved.
//

#import "ViewController.h"
#import "ActivityViewController.h"
#import "BuyViewController.h"
#import "Defines.h"

@interface ViewController () <UIScrollViewDelegate> {
    UIScrollView *_scrollView;
}

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _carousel.type = iCarouselTypeCylinder;
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationBar"]
//                                                  forBarMetrics:UIBarMetricsDefault];
    
//    UIImage *image = [UIImage imageNamed: @"navigationBar"];
//    [image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *backGroundImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [backGroundImageView setImage:[UIImage imageNamed:@"homeBackground"]];
    [self.view addSubview:backGroundImageView];
    
    UIImage *backgroundImage = [UIImage imageNamed:@"navigationBar"];
    // 获取系统版本
    float systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    NSLog(@"systemVersion:%g", systemVersion);
    CGSize titleSize = self.navigationController.navigationBar.bounds.size;  //获取Navigation Bar的位置和大小
    backgroundImage = [self scaleToSize:backgroundImage size:titleSize];//设置图片的大小与Navigation Bar相同
    [self.navigationController.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    // 先把按钮的图片放到UIButton里, 然后再用UIBarButtonItem的initWithCustomView方法, 把leftBtn当作View放进去
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 44, 44);
    [leftBtn setImage:[UIImage imageNamed:@"userIcon"] forState:UIControlStateNormal];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
    [rightBtn setImage:[UIImage imageNamed:@"searchIcon"] forState:UIControlStateNormal];
//    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:nil];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightButton;
    
//    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
//    scrollView.delegate = self;
//    [self.view addSubview:scrollView];
    
    // 中间的按钮
//    UIButton *middleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    middleBtn.frame = CGRectMake(0, 0, 44, 44);
//    [middleBtn setImage:[UIImage imageNamed:@"searchIcon"] forState:UIControlStateNormal];
////    middleBtn.backgroundColor = [UIColor redColor];
//    self.navigationItem.titleView = middleBtn;
    [self.navigationItem.titleView sizeToFit];
//    self.navigationItem.titleView.backgroundColor = [UIColor orangeColor];
    
//    UIButton *activitButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    activitButton.frame = CGRectMake(10, 150, 150, 126);
//    [activitButton setBackgroundImage:[UIImage imageNamed:@"activitButton"] forState:UIControlStateNormal];
//    [activitButton addTarget:self action:@selector(pushActivityVC) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:activitButton];
    
//    UIButton *buyButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    buyButton.frame = CGRectMake(150, 150, 150, 126);
//    [buyButton setBackgroundImage:[UIImage imageNamed:@"buyButton"] forState:UIControlStateNormal];
//    [buyButton addTarget:self action:@selector(pushBuyVC) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:buyButton];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 20)];
    NSLog(@"ScreenWidth:%g, ScreenHeight:%g", ScreenWidth, ScreenHeight);
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
    NSArray *homePics = @[@"XProductPage", @"XStoryPage", @"XIntroducePage", @"XActivtyPage"];
    
    for (NSInteger i = 0; i < 4; i++) {
        UIImageView *imgView = [[UIImageView alloc] init];
        NSString *imageName = homePics[i];
        imgView.image = [UIImage imageNamed:imageName];
        imgView.frame = CGRectMake(i * ScreenWidth, 0, ScreenWidth, ScreenHeight - 100);
        [_scrollView addSubview:imgView];
        //        NSLog(@"image:%@", imageName);
    }
    
    _scrollView.contentSize = CGSizeMake(homePics.count * ScreenWidth, 0);
    _scrollView.pagingEnabled = YES;
//    NSLog(@"%@", [_scrollView subviews]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

- (void)pushActivityVC {
    ActivityViewController *avc = [[ActivityViewController alloc] init];
    [self.navigationController pushViewController:avc animated:YES];
}

- (void)pushBuyVC {
    BuyViewController *bvc = [[BuyViewController alloc] init];
    [self.navigationController pushViewController:bvc animated:YES];
}

// _scrollView无限循环
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    float offsetX = _scrollView.contentOffset.x;
//    NSInteger scrollViewCount = [[_scrollView subviews] count];
    
    // 向右滑到底时
//    if (offsetX < (0 - ScreenWidth / 6)) {
//        [_scrollView setContentOffset:CGPointMake(ScreenWidth * (scrollViewCount - 3), 0)];
//    }
//    NSLog(@"%g", (10 + ScreenWidth * (float)(scrollViewCount - 1)));
    
    // 向左滑到底时
    // _scrollView滚动条出多出2个view
//    else if (offsetX > (ScreenWidth / 2 + ScreenWidth * (scrollViewCount - 3))) {
//        [_scrollView setContentOffset:CGPointMake(0, 0)];
//    }
//    NSLog(@"%g", offsetX);
//    NSLog(@"%g", (ScreenWidth / 4 + ScreenWidth * (scrollViewCount - 1)));
}

#pragma mark - test

- (void)setUp
{
    //set up data
    self.items = [NSMutableArray array];
    for (int i = 0; i < 1000; i++)
    {
        [_items addObject:@(i)];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
    {
        [self setUp];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        [self setUp];
    }
    return self;
}

- (void)dealloc
{
    //it's a good idea to set these to nil here to avoid
    //sending messages to a deallocated viewcontroller
    _carousel.delegate = nil;
    _carousel.dataSource = nil;
    
}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.carousel = nil;
}

- (IBAction)updateViewpointOffset:(UISlider *)slider
{
    CGSize offset = CGSizeMake(0.0f, slider.value);
    _carousel.viewpointOffset = offset;
    _viewpointOffsetLabel.text = NSStringFromCGSize(offset);
}

- (IBAction)updateContentOffset:(UISlider *)slider
{
    CGSize offset = CGSizeMake(0.0f, slider.value);
    _carousel.contentOffset = offset;
    _contentOffsetLabel.text = NSStringFromCGSize(offset);
}

#pragma mark -
#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return [_items count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    UILabel *label = nil;
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, 200.0f)];
        ((UIImageView *)view).image = [UIImage imageNamed:@"page.png"];
        view.contentMode = UIViewContentModeCenter;
        label = [[UILabel alloc] initWithFrame:view.bounds];
        label.backgroundColor = [UIColor clearColor];
        label.font = [label.font fontWithSize:50];
        label.tag = 1;
        [view addSubview:label];
    }
    else
    {
        //get a reference to the label in the recycled view
        label = (UILabel *)[view viewWithTag:1];
    }
    
    //set item label
    //remember to always set any properties of your carousel item
    //views outside of the `if (view == nil) {...}` check otherwise
    //you'll get weird issues with carousel item content appearing
    //in the wrong place in the carousel
    label.text = [_items[index] stringValue];
    
    return view;
}

- (CGFloat)carousel:(iCarousel *)_carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    //customize carousel display
    switch (option)
    {
        case iCarouselOptionSpacing:
        {
            //add a bit of spacing between the item views
            return value * 1.05f;
        }
        default:
        {
            return value;
        }
    }
}

@end

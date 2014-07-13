#import "RSDFDatePickerViewController.h"

@interface RSDFDatePickerViewController() <RSDFDatePickerViewDelegate, RSDFDatePickerViewDataSource>

@end

@implementation RSDFDatePickerViewController

@synthesize datePickerView = _datePickerView;

#pragma mark - Lifecycle

- (void) viewDidLoad
{
	[super viewDidLoad];
	
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.navigationItem.title = @"RSDayFlow";

    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.opaque = YES;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:248/255.0f green:248/255.0f blue:248/255.0f alpha:1.0f];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Medium" size:17.0f]};
    
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.3];
    [self.view addSubview:self.datePickerView];
}

#pragma mark - Custom Accessors

- (RSDFDatePickerView *)datePickerView
{
	if (!_datePickerView) {
		_datePickerView = [RSDFDatePickerView new];
        _datePickerView.delegate = self;
        _datePickerView.dataSource = self;
		_datePickerView.frame = self.view.bounds;
		_datePickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	}
	return _datePickerView;
}

#pragma mark - RSDFDatePickerViewDelegate

- (void)datePickerView:(RSDFDatePickerView *)view didSelectDate:(NSDate *)date
{
    [[[UIAlertView alloc] initWithTitle:@"Picked Date" message:[date description] delegate:nil cancelButtonTitle:@":D" otherButtonTitles:nil] show];
}

#pragma mark - RSDFDatePickerViewDataSource

- (NSDictionary *)datePickerViewMarkedDates:(RSDFDatePickerView *)view
{
	NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *todayComponents = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:[NSDate date]];
    NSDate *today = [calendar dateFromComponents:todayComponents];
    
    NSArray *numberOfDaysFromToday = @[@(-8), @(-2), @(-1), @(0), @(2), @(4), @(8), @(13), @(22)];
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    NSMutableDictionary *markedDates = [[NSMutableDictionary alloc] initWithCapacity:[numberOfDaysFromToday count]];
    [numberOfDaysFromToday enumerateObjectsUsingBlock:^(NSNumber *numberOfDays, NSUInteger idx, BOOL *stop) {
        dateComponents.day = [numberOfDays integerValue];
        NSDate *date = [calendar dateByAddingComponents:dateComponents toDate:today options:0];
        if ([date compare:today] == NSOrderedAscending) {
            markedDates[date] = @YES;
        } else {
            markedDates[date] = @NO;
        }
    }];
    
    return [markedDates copy];
}

@end

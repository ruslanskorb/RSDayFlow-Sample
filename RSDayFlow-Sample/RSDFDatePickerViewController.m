#import "RSDFDatePickerViewController.h"

@interface RSDFDatePickerViewController() <RSDFDatePickerViewDelegate, RSDFDatePickerViewDataSource>

@end

@implementation RSDFDatePickerViewController

@synthesize datePickerView = _datePickerView;

- (void) viewDidLoad
{
	[super viewDidLoad];
	[self.view addSubview:self.datePickerView];
}

- (RSDFDatePickerView *)datePickerView
{
	if (!_datePickerView) {
		_datePickerView = [RSDFDatePickerView new];
        _datePickerView.delegate = self;
        _datePickerView.dataSource = self;
		_datePickerView.frame = self.view.bounds;
		_datePickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
	}
	return _datePickerView;
}

- (void)datePickerView:(RSDFDatePickerView *)view didSelectDate:(NSDate *)date
{
    [[[UIAlertView alloc] initWithTitle:@"Picked Date" message:[date description] delegate:nil cancelButtonTitle:@":D" otherButtonTitles:nil] show];
}

- (NSDictionary *)datePickerViewMarkedDates:(RSDFDatePickerView *)view
{
    NSDate *day = [NSDate date];
	NSCalendar *calendar = [NSCalendar currentCalendar];
	
    NSDateComponents *todayComponents = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:day];
    NSDate *today = [calendar dateFromComponents:todayComponents];
    
    NSDateComponents *oneDayComponents = [[NSDateComponents alloc] init];
	oneDayComponents.day = 1;
    NSDate *tommorow = [calendar dateByAddingComponents:oneDayComponents toDate:today options:0];
    
    return @{today:@YES, tommorow:@NO};
}

@end

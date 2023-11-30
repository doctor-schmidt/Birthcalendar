
#import "BirthcalendarViewController.h"

int lastbutton = 1;  // resetTODAY button

@implementation BirthcalendarViewController

@synthesize todayButton, eddButton, lmpButton;
@synthesize DateEntry, todayReference, eddReference, lmpReference;



- (IBAction)resetTODAY:(id)sender
{
  if(lastbutton == 1)  todayReference = [NSDate date];
  DateEntry.date = todayReference;
  
  NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
  [dateFormat setDateFormat:@"EEE  MMMM  d,  YYYY"];
  NSString *dateString = [dateFormat stringFromDate:todayReference];
  TODAY.text = [[NSString alloc] initWithFormat:@"%@",dateString];
  dateString = [dateFormat stringFromDate:eddReference];
  
  [dateFormat setDateFormat:@"        MMMM  d,  YYYY"];
  dateString = [dateFormat stringFromDate:eddReference];
  EDD.text = [[NSString alloc] initWithFormat:@"%@",dateString];
  dateString = [dateFormat stringFromDate:lmpReference];
  LMP.text = [[NSString alloc] initWithFormat:@"%@",dateString];
  [self calculate];
  lastbutton = 1;
}
-(IBAction) today
{
  todayReference = [DateEntry date];
  
  NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
  [dateFormat setDateFormat:@"EEE  MMMM  d,  YYYY"];
  NSString *dateString = [dateFormat stringFromDate:todayReference];
  TODAY.text = [[NSString alloc] initWithFormat:@"%@",dateString];
  [self calculate];
  lastbutton = 4;
}



- (IBAction)resetEDD:(id)sender
{
  DateEntry.date = eddReference;
  
  NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
  [dateFormat setDateFormat:@"EEE  MMMM  d,  YYYY"];
  NSString *dateString = [dateFormat stringFromDate:eddReference];
  EDD.text = [[NSString alloc] initWithFormat:@"%@",dateString];
  
  [dateFormat setDateFormat:@"        MMMM  d,  YYYY"];
  dateString = [dateFormat stringFromDate:lmpReference];
  LMP.text = [[NSString alloc] initWithFormat:@"%@",dateString];
  dateString = [dateFormat stringFromDate:todayReference];
  TODAY.text = [[NSString alloc] initWithFormat:@"%@",dateString];
  lastbutton = 2;
}
-(IBAction) edd
{
  eddReference = [DateEntry date];
  
  NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
  [dateFormat setDateFormat:@"EEE  MMMM  d,  YYYY"];
  NSString *dateString = [dateFormat stringFromDate:eddReference];
  EDD.text = [[NSString alloc] initWithFormat:@"%@",dateString];
  
  NSDateComponents *components = [[NSDateComponents alloc] init];
  [components setDay:-280];
  NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  lmpReference = [gregorian dateByAddingComponents:components toDate:eddReference options:0];
  
  [dateFormat setDateFormat:@"        MMMM  d,  YYYY"];
  dateString = [dateFormat stringFromDate:lmpReference];
  LMP.text = [[NSString alloc] initWithFormat:@"%@",dateString];
  dateString = [dateFormat stringFromDate:todayReference];
  TODAY.text = [[NSString alloc] initWithFormat:@"%@",dateString];
  [self calculate];
}



- (IBAction)resetLMP:(id)sender
{
  DateEntry.date = lmpReference;
  
  NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
  [dateFormat setDateFormat:@"EEE  MMMM  d,  YYYY"];
  NSString *dateString = [dateFormat stringFromDate:lmpReference];
  LMP.text = [[NSString alloc] initWithFormat:@"%@",dateString];
  
  [dateFormat setDateFormat:@"        MMMM  d,  YYYY"];
  dateString = [dateFormat stringFromDate:eddReference];
  EDD.text = [[NSString alloc] initWithFormat:@"%@",dateString];
  dateString = [dateFormat stringFromDate:todayReference];
  TODAY.text = [[NSString alloc] initWithFormat:@"%@",dateString];
  lastbutton = 3;
}
-(IBAction) lmp
{
 	lmpReference = [DateEntry date];
  
  NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
  [dateFormat setDateFormat:@"EEE  MMMM  d,  YYYY"];
  NSString *dateString = [dateFormat stringFromDate:lmpReference];
  LMP.text = [[NSString alloc] initWithFormat:@"%@",dateString];
  
  NSDateComponents *components = [[NSDateComponents alloc] init];
  [components setDay:280];
  NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  eddReference = [gregorian dateByAddingComponents:components toDate:lmpReference options:0];
  
  [dateFormat setDateFormat:@"        MMMM  d,  YYYY"];
  dateString = [dateFormat stringFromDate:eddReference];
  EDD.text = [[NSString alloc] initWithFormat:@"%@",dateString];
  dateString = [dateFormat stringFromDate:todayReference];
  TODAY.text = [[NSString alloc] initWithFormat:@"%@",dateString];
  [self calculate];
}



-(void) calculate
{
  NSTimeInterval startTime = [lmpReference timeIntervalSinceNow];
  NSTimeInterval endTime = [todayReference timeIntervalSinceNow];
  
  NSTimeInterval difference = endTime - startTime;
  NSString *str = [NSString stringWithFormat:@"%.0f", difference/86400];
  int days = [str intValue];
  int weeks = days / 7;
  if(days < 28)
  {
    NSString *display = [NSString stringWithFormat:@"day %d",days>=0?days+1:days];
    DISPLAY.text = display;
  }
  if(days >= 28 && days <= (280+28))
  {
    days = days - 7*weeks;
    NSString *display = [NSString stringWithFormat:@"%d.%d weeks",weeks,days];
    DISPLAY.text = display;
  }
  if(days > 280+28)
  {
    str = [NSString stringWithFormat:@"%.1f", ((double)(difference/86400-298)/365.25)];
    double Years = ([str floatValue]);
    NSString *display = [NSString stringWithFormat:@"%0.1f years",Years];
    DISPLAY.text = display;
  }
}


-(void) viewDidLoad
{
  [super viewDidLoad];
  [self.view becomeFirstResponder];
  
  todayReference = [NSDate date];
  NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
  [dateFormat setDateFormat:@"EEE  MMMM  d,  YYYY"];
  NSString *dateString = [dateFormat stringFromDate:todayReference];
  TODAY.text = [[NSString alloc] initWithFormat:@"%@",dateString];
  
  DateEntry.date = todayReference;
  
  [super viewDidLoad];
}


-(void) didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

@end

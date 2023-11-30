
#import <UIKit/UIKit.h>

@interface BirthcalendarViewController : UIViewController {
  
  UIDatePicker *DateEntry;
  NSDate *todayReference, *eddReference, *lmpReference;
  IBOutlet UIButton *todayButton, *eddButton, *lmpButton;
  IBOutlet UILabel *TODAY, *EDD, *LMP, *DISPLAY;
}

@property (nonatomic, retain) IBOutlet UIDatePicker *DateEntry;
@property (nonatomic, retain) NSDate *todayReference, *eddReference, *lmpReference;
@property (nonatomic, retain) IBOutlet UIButton *todayButton, *eddButton, *lmpButton;


-(IBAction)resetTODAY:(id)sender;
-(IBAction) today;

-(IBAction)resetEDD:(id)sender;
-(IBAction) edd;

-(IBAction)resetLMP:(id)sender;
-(IBAction) lmp;

-(void) calculate;

@end


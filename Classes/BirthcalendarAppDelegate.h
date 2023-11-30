
#import <UIKit/UIKit.h>

@class BirthcalendarViewController;

@interface BirthcalendarAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    BirthcalendarViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet BirthcalendarViewController *viewController;

@end


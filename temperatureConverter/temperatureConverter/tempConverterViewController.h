//
//  tempConverterViewController.h
//  temperatureConverter
//
//  Created by Edo williams on 10/3/13.
//  Copyright (c) 2013 Edo williams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tempConverterViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *tempChooserSegmentedControl;
@property (weak, nonatomic) IBOutlet UITextField *tempEntryTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempCelFehLabel;

- (IBAction)onDoneButton;


@end

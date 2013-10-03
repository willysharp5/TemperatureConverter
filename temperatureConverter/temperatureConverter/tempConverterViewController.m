//
//  tempConverterViewController.m
//  temperatureConverter
//
//  Created by Edo williams on 10/3/13.
//  Copyright (c) 2013 Edo williams. All rights reserved.
//

#import "tempConverterViewController.h"

@interface tempConverterViewController ()

- (void)updateValues;

@end

@implementation tempConverterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Temperature Converter";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Automatically calculate data when UISegment is pressed
    [self.tempChooserSegmentedControl addTarget:self action:@selector(updateValues) forControlEvents:UIControlEventValueChanged];
    
    //Load the data
    self.tempChooserSegmentedControl.selectedSegmentIndex = 1;
    //self.tempEntryTextField.text = 0;
    [self updateValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - UI Texfield Delegates
- (BOOL)textFieldShouldBeginEditing:(UITextField *) textField {
    //Create a Button Item
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDoneButton)];
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = nil;
    [self updateValues];
    
    return YES;
}

#pragma - Private Methods
- (void) onDoneButton {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues {
    
    float conversionValue = [self.tempEntryTextField.text floatValue];
    float celsius = 0.0f;
    float fahrenheit = 0.0f;
    
    switch (self.tempChooserSegmentedControl.selectedSegmentIndex) {
        //°C = (°F  -  32)  x  5/9
        case 0:
            celsius = (conversionValue - 32.0f) * 5.0f / 9.0f;
            self.resultNumberLabel.text = [NSString stringWithFormat:@"%3.2f", celsius];
            self.tempCelFehLabel.text= @"°C";
            break;
        //°F = °C  x  9/5 + 32
        case 1:
            fahrenheit = (conversionValue * 9.0f / 5.0f) + 32.0f;
            self.resultNumberLabel.text = [NSString stringWithFormat:@"%3.2f", fahrenheit];
            self.tempCelFehLabel.text= @"°F";
            break;
            
        default:
            break;
    }

    
}

@end

//
//  ViewController.h
//  owned-Dizainier
//
//  Created by Huy on 5/13/14.
//  Copyright (c) 2014 huy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic) int number;
@property (nonatomic) BOOL modeGeek;

@property (weak, nonatomic) IBOutlet UILabel *numberDisplay;

@property (weak, nonatomic) IBOutlet UISwitch *geekSwitch;
- (IBAction)geekSwitchWasChanged:(id)sender;

@property (weak, nonatomic) IBOutlet UIStepper *stepper;
- (IBAction)stepperWasTapped:(id)sender;

@property (weak, nonatomic) IBOutlet UISegmentedControl *dizainesSeg;
- (IBAction)dizainesSegWasTapped:(id)sender;

@property (weak, nonatomic) IBOutlet UISegmentedControl *unitesSeg;
- (IBAction)unitesSegWasTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UISlider *slider;
- (IBAction)sliderWasChanged:(id)sender;


- (IBAction)resetWasTapped:(id)sender;


@end

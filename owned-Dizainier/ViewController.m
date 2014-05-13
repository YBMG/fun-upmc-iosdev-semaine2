//
//  ViewController.m
//  owned-Dizainier
//
//  Created by Huy on 5/13/14.
//  Copyright (c) 2014 huy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController
@synthesize number, modeGeek;


- (void)setNumber:(int)num
{
    number = MAX(0, MIN(99, num));
    [self updateNumberDisplay];
    [self updateSegs];
    
    self.stepper.value = number;
    self.slider.value = number;
}

- (void)updateNumberDisplay
{
    NSString* format = self.modeGeek ? @"%x" : @"%d";
    self.numberDisplay.text = [NSString stringWithFormat:format, self.number];
    
    // Special "chinoiserie"
    self.numberDisplay.textColor = (self.number == 42 ? [UIColor redColor] : [UIColor blackColor]);
}

- (void)updateSegs
{
    int dizaines = MIN(self.number / 10, 10);
    int unites = self.number % 10;
    [self.dizainesSeg setSelectedSegmentIndex:dizaines];
    [self.unitesSeg setSelectedSegmentIndex:unites];
}

- (void)updateNumberFromSegs
{
    self.number = [self.dizainesSeg selectedSegmentIndex] * 10 + [self.unitesSeg selectedSegmentIndex];
}

- (void)reset
{
    [self setNumber:0];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.modeGeek = NO;
    self.geekSwitch.on = self.modeGeek;
    
    // Init stepper
    self.stepper.minimumValue = 0.0;
    self.stepper.maximumValue = 99.0;
    self.stepper.stepValue = 1.0;
    
    // Init slider
    self.slider.minimumValue = 0.0;
    self.slider.maximumValue = 99.0;
    
    // Init segmented control titles
    for (int i = 0; i < self.dizainesSeg.numberOfSegments; i++) {
        [self.dizainesSeg setTitle:[NSString stringWithFormat:@"%d", i] forSegmentAtIndex:i];
        // Assume that the segmented controls are the same size
        [self.unitesSeg setTitle:[NSString stringWithFormat:@"%d", i] forSegmentAtIndex:i];
    }
    
    [self reset];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stepperWasTapped:(id)sender {
    self.number = self.stepper.value;
}
- (IBAction)dizainesSegWasTapped:(id)sender {
    [self updateNumberFromSegs];
}
- (IBAction)unitesSegWasTapped:(id)sender {
    [self updateNumberFromSegs];
}
- (IBAction)sliderWasChanged:(id)sender {
    self.number = self.slider.value;
}

- (IBAction)resetWasTapped:(id)sender {
    [self reset];
}
- (IBAction)geekSwitchWasChanged:(id)sender {
    self.modeGeek = self.geekSwitch.on;
    [self updateNumberDisplay];
}
@end

//
//  ViewController.m
//  Think Decide
//
//  Created by Apoorva Reed on 6/26/18.
//  Copyright © 2018 Apoorva Reed. All rights reserved.
//

#import "FirstPageViewController.h"
//#include <stdlinb.h>

@interface FirstPageViewController (){
    NSInteger *choiceCount;
    
}

@end

@implementation FirstPageViewController

@synthesize choicesData;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.labelAskChoiceNumber.textAlignment = UITextAlignmentCenter;
    self.labelAskChoiceNumber.textColor = [UIColor whiteColor];
    self.labelAskChoiceNumber.backgroundColor = [UIColor blueColor];
    self.labelAskChoiceNumber.numberOfLines = 0;
    [self.labelAskChoiceNumber setFont:[UIFont fontWithName:@"Arial Rounded MT Bold" size:(16.0)]];
    self.labelAskChoiceNumber.text = @"Confused between your decisions?\n\nEnter number of choices you have";
    
    for (int j=1; j<6; j++) {
        UITextField *mytextfield = (UITextField *)[self.view viewWithTag:j];
        [mytextfield setHidden:YES];
    }
    
    [self.choicesDescription setHidden:YES];
    [self.decision setHighlighted:YES];
    [self.restart setHidden:YES];
    [self.showResult setHidden:YES];
    self.choicesData = @[@"1", @"2", @"3", @"4", @"5"];
    
    self.pickerChooseChoicesCount.dataSource = self;
    self.pickerChooseChoicesCount.delegate = self;
}
- (IBAction)showResult:(UIButton *)sender {
    int numOfChoices = (int)choiceCount;
    int decision = arc4random_uniform(numOfChoices+1);
    UITextField *mytextfield = (UITextField *)[self.view viewWithTag:decision+1];
    NSString *decisionValue = mytextfield.text;
    
    self.decision.textAlignment = UITextAlignmentCenter;
    self.decision.textColor = [UIColor whiteColor];
    self.decision.backgroundColor = [UIColor blueColor];
    self.decision.numberOfLines = 0;
    [self.decision setFont:[UIFont fontWithName:@"Arial Rounded MT Bold" size:(16.0)]];
    self.decision.text = decisionValue;
    
    [self.view endEditing:YES];
    
}
- (IBAction)restart:(UIButton *)sender {
    for (int j=1; j<6; j++) {
        UITextField *mytextfield = (UITextField *)[self.view viewWithTag:j];
        [mytextfield setHidden:YES];
    }
    [self.choicesDescription setHidden:YES];
    [self.decision setHidden:YES];
    [self.restart setHidden:YES];
    [self.showResult setHidden:YES];
    [self.doneButton setHidden:NO];
    [self.labelAskChoiceNumber setHidden:NO];
    [self.pickerChooseChoicesCount setHidden:NO];
}


- (IBAction)goChoicesCount:(UIButton *)sender {
    [self.labelAskChoiceNumber setHidden:YES];
    [self.pickerChooseChoicesCount setHidden:YES];
    
    for (int i=1; i<=(int)choiceCount+1; i++) {
        UITextField *mytextfield = (UITextField *)[self.view viewWithTag:i];
        mytextfield.text =@"";
        [mytextfield setHidden:NO];
    }
    
    self.choicesDescription.textAlignment = UITextAlignmentCenter;
    self.choicesDescription.textColor = [UIColor whiteColor];
    self.choicesDescription.backgroundColor = [UIColor blueColor];
    self.choicesDescription.numberOfLines = 0;
    [self.choicesDescription setFont:[UIFont fontWithName:@"Arial Rounded MT Bold" size:(16.0)]];
    self.choicesDescription.text = @"Enter your choices";
    [self.choicesDescription setHidden:NO];
    [self.doneButton setHidden:YES];
    [self.restart setHidden:NO];
    [self.showResult setHidden:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.choicesData.count;
}

-(NSString *)pickerView: (UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *pickerTitle = @"Picket title";
    @try {
        pickerTitle = self.choicesData[row];
    }
    @catch (NSException *e){
        NSLog(@"%@", e.description);

    }
    return pickerTitle;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    switch (row) {
        case 0:
            NSLog(@"1");
            choiceCount = row;
            break;
        case 1:
            NSLog(@"2");
            choiceCount = row;
            break;
        case 2:
            NSLog(@"3");
            choiceCount = row;
            break;
        case 3:
            NSLog(@"4");
            choiceCount = row;
            break;
        case 4:
            NSLog(@"5");
            choiceCount = row;
            break;
    }
}
- (void)dealloc {
    [_pickerChooseChoicesCount release];
    //[_choice_1 release];
    //[_choice_2 release];
    //[_choice_3 release];
    //[_choice_4 release];
    //[_choice_5 release];
    [_choicesDescription release];
    [_restart release];
    [_showResult release];
    [_doneButton release];
    [_doneButton release];
    [_doneButton release];
    [_decision release];
    [super dealloc];
}
@end

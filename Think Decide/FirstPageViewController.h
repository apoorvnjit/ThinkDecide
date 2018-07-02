//
//  ViewController.h
//  Think Decide
//
//  Created by Apoorva Reed on 6/26/18.
//  Copyright © 2018 Apoorva Reed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstPageViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

@property (retain, nonatomic) IBOutlet UIPickerView *pickerChooseChoicesCount;
@property (strong, nonatomic) IBOutlet UILabel *labelAskChoiceNumber;
@property (strong, nonatomic) NSArray *choicesData;
//@property (retain, nonatomic) IBOutlet UITextField *choice_1;
@property (retain, nonatomic) IBOutlet UILabel *choicesDescription;
@property (retain, nonatomic) IBOutlet UIButton *restart;
@property (retain, nonatomic) IBOutlet UIButton *showResult;

@property (retain, nonatomic) IBOutlet UIButton *doneButton;

@property (retain, nonatomic) IBOutlet UILabel *decision;

@end


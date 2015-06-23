//
//  ViewController.h
//  HitNumbers
//
//  Created by Takatoshi Watanabe on 2015/06/23.
//  Copyright (c) 2015年 渡辺 貴俊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UIPickerViewDelegate, UIPickerViewDataSource>
{
    IBOutlet UIPickerView *pickerView;
    IBOutlet UILabel *label;
    NSArray *numbers;
    NSMutableArray *answers;
    int hit;
    IBOutlet UITextView *textView;
    int count;
}

- (IBAction)enter:(UIButton *)button;

@end

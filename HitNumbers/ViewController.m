//
//  ViewController.m
//  HitNumbers
//
//  Created by Takatoshi Watanabe on 2015/06/23.
//  Copyright (c) 2015年 渡辺 貴俊. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    pickerView.delegate = self;
    pickerView.dataSource = self;
    
    textView.editable = NO;
    textView.text = @"";
    
    answers = [[NSMutableArray alloc] init];
    
    numbers = @[@"0",
                @"1",
                @"2",
                @"3",
                @"4",
                @"5",
                @"6",
                @"7",
                @"8",
                @"9"];
    
    for (int i = 0; i < pickerView.numberOfComponents; i++) {
        int random = arc4random() % 10;
        answers[i] = [NSString stringWithFormat:@"%d", random];
    }
    
    for (NSString *string in answers) NSLog(@"%@", string);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 4;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return 10;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return numbers[row];
}

- (IBAction)enter:(UIButton *)button
{
    count++;
    if (count == 5) {
        int sum = 0;
        
        for (int i = 0; i < pickerView.numberOfComponents; i++) {
            sum += [answers[i] intValue];
        }
        
        NSString *lastString = textView.text;
        NSString *string = [NSString stringWithFormat:
                            @"答えの数の合計は%dだよ！\n", sum];
        textView.text = [string stringByAppendingString:
                         lastString];
        
//        NSString *lastString = textView.text;
//        NSString *string = [NSString stringWithFormat:
//                            @"１つ目の答えは%@だよ！\n", answers[0]];
//        textView.text = [string stringByAppendingString:
//                         lastString];
    } else if (count == 10) {
        int num = [answers[0] intValue];
        
        for (int i = 0; i < pickerView.numberOfComponents; i++) {
            if (num > [answers[i] intValue]) {
                num = [answers[i] intValue];
            }
        }
        
        NSString *lastString = textView.text;
        NSString *string = [NSString stringWithFormat:
                            @"一番小さい数字は%dだよ！\n", num];
        textView.text = [string stringByAppendingString:
                         lastString];
        
//        NSString *lastString = textView.text;
//        NSString *string = [NSString stringWithFormat:
//                            @"３つ目の答えは%@だよ！\n", answers[2]];
//        textView.text = [string stringByAppendingString:
//                         lastString];
    }
    
    hit = 0;
    
    for (int i = 0; i < pickerView.numberOfComponents; i++) {
        NSString *answer = numbers[[pickerView
                                    selectedRowInComponent:i]];
        if ([answer isEqual:answers[i]]) {
            hit = hit + 1;
        }
    }
    
    if (hit == 4) {
        label.text = @"クリア！";
//        textView.text = [NSString stringWithFormat:@"クリアまでの回数：%d", count];
        button.enabled = NO;
    } else {
        label.text = [NSString stringWithFormat:
                      @"%d個正解！", hit];
        NSString *lastString = textView.text;
        NSString *string = [NSString stringWithFormat:
                            @"%d個正解！\n", hit];
        textView.text = [string stringByAppendingString:
                         lastString];
    }
}

@end

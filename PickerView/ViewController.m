//
//  ViewController.m
//  PickerView
//
//  Created by Tim on 2016/8/16.
//  Copyright © 2016年 Tim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSMutableArray * dates;
    UIPickerView * picker;
    BOOL pickerViewIsHide;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    picker = [UIPickerView new];
    
    
    picker.delegate = self;
    picker.dataSource = self;
    picker.showsSelectionIndicator = YES;
    [self.view addSubview:picker];
    picker.hidden = true;
    
    //這裡沒辦法調整Picker 的高度
    CGFloat xWidth = self.view.frame.size.width/1.5;
    CGFloat yHeight = self.view.frame.size.height/5;
    CGFloat xPosition = self.view.frame.size.width/2 - (xWidth/2);
    CGFloat yPosition = self.view.frame.size.height/10;
    CGRect rect = CGRectMake(xPosition, yPosition, xWidth, yHeight);
    [picker setFrame:rect];
    
    dates = [NSMutableArray array];
    
    for (int i = 1; i <= 31; i++) {
        NSString * number = [NSString stringWithFormat:@"%i",i];
        [dates addObject:number];
    }
    
    //NSLog(@"Dates: %@",dates);
}

//調整picker view cell的長度
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    CGFloat height = self.view.frame.size.height/10;
    return height;
}

//show 出picker view
- (IBAction)pickerView:(UIButton *)sender {
    
    //動畫設置
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type=kCATransitionPush;
    
    if(pickerViewIsHide == true){
        
        pickerViewIsHide = false;
        transition.subtype=kCATransitionFromTop;
        picker.hidden=true;
        
    }else{
        
        pickerViewIsHide = true;
        transition.subtype=kCATransitionFromBottom;
        picker.hidden=false;
        
    }
    
    transition.delegate = self;
    [picker.layer addAnimation:transition forKey:nil];
    
}

#pragma mark - Picker view methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return dates.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString * title = nil;
    
    title = dates[row];
    
    NSLog(@"Title: %@",title);

    return title;
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    //Here, like the table view you can get the each section of each row if you've multiple sections
   
    
    //Now, if you want to navigate then;
    // Say, OtherViewController is the controller, where you want to navigate:
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

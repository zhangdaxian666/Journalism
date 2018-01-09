//
//  ONEViewController.m
//  networking
//   https://www.cnblogs.com/qq95230/p/4649623.html 键盘上升
//  Created by slcf888 on 2017/12/13.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "ONEViewController.h"
#import "sidedView.h"

#import "SecondController.h"

@interface ONEViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textlab;
@property (nonatomic, strong) sidedView *sidedview;
@end

@implementation ONEViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textlab.frame =CGRectMake(20, 420, 250, 30);
    _textlab.layer.borderColor =[UIColor blueColor].CGColor;
    _textlab.layer.borderWidth =0.5f;
    _textlab.delegate =self;

    _textlab.backgroundColor =[UIColor colorWithRed:0.830 green:0.801 blue:0.881 alpha:1.000];
    [self.view addSubview:self.textlab];
    
    
    self.view.backgroundColor =[UIColor grayColor];
    self.sidedview =[[sidedView alloc]initWithFrame:CGRectMake(90, 90, 90, 90)];
    [self.view addSubview:self.sidedview];
    UIImageView *topImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"b.png"]];
    topImageView.frame =self.sidedview.bounds;
    
    UIImageView *bottomImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Puppetcat.JPG"]];
    bottomImageView.frame = self.sidedview.bounds;
    
    self.sidedview.topView = topImageView;
    self.sidedview.bottomView = bottomImageView;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.sidedview turnWithDuration:2 completion:nil];
}



- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame =textField.frame;
    int offset = frame.origin.y + frame.size.height - (self.view.frame.size.height - 286.0);
    NSTimeInterval animaTime = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animaTime];
    if(offset > 0){
        self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);
    }
    [UIView commitAnimations];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.view.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}



////////





- (void)tapAction:(UITapGestureRecognizer *)sender
{
    [self.view endEditing:YES];
}
- (void)keyboardwill:(NSNotification *)sender
{
    NSDictionary *dict=[sender userInfo];
    NSValue *value=[dict objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardrect = [value CGRectValue];
    int height=keyboardrect.size.height;
    
    if ((_textlab.frame.size.height +_textlab.frame.origin.y)>(self.view.frame.size.height-height)) {
        self.view.frame =CGRectMake(0, -height, self.view.frame.size.width, self.view.frame.size.height);
    }
}
- (void)keyboardhide:(NSNotification *)sender
{
    self.view.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}
- (UITextField *)textlab
{
    if (_textlab ==nil) {
        _textlab =[UITextField new];
    }
    return _textlab;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

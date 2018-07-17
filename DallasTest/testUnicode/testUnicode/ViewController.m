//
//  ViewController.m
//  testUnicode
//
//  Created by zhaoxu on 2018/2/7.
//  Copyright © 2018年 zhaoxu. All rights reserved.
//

#import "ViewController.h"
#import "EncodeTypeViewController.h"
#import "NSString+YYAdd.h"
@interface ViewController ()<EncodeTypeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *characterTextField;
@property (weak, nonatomic) IBOutlet UILabel *unicodeLabel;
@property (weak, nonatomic) IBOutlet UIButton *turnButton;
@property (weak, nonatomic) IBOutlet UIButton *encodeTypeButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.destinationViewController isKindOfClass:[EncodeTypeViewController class]]) {
        ((EncodeTypeViewController *)segue.destinationViewController).delegate = self;
    };
}

- (IBAction)turnUnicode:(id)sender {
    NSString *encodeType = self.encodeTypeButton.titleLabel.text;
    NSString *needEncodeString = self.characterTextField.text;
    if ([encodeType isEqualToString:@"unicode"]) {
        self.unicodeLabel.text = [self turnToUnicodeWith:needEncodeString];
//        self.unicodeLabel.text = [NSString stringWithFormat:@"%@", [needEncodeString dataUsingEncoding:NSUTF8StringEncoding] ];
    }
    if ([encodeType isEqualToString:@"utf-8"]) {
        self.unicodeLabel.text = [needEncodeString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    if ([encodeType isEqualToString:@"MD5"]) {
        self.unicodeLabel.text = [needEncodeString md5String];
    }
    if ([encodeType isEqualToString:@"Base64"]) {
         self.unicodeLabel.text = [needEncodeString base64EncodedString];
    }
}


- (void)deSelectRow:(NSString *)text{
    [self.encodeTypeButton setTitle:text forState:UIControlStateNormal];
}


-(NSString *)turnToUnicodeWith:(NSString *)curStr{
    
    NSMutableString * result = [[NSMutableString alloc] initWithString:@""];
    
    for (int i=0; i<[curStr length]; i++) {
        
        NSRange range = NSMakeRange(i, 1);
        
        NSString * subStr = [curStr substringWithRange:range];
        
        NSData * data = [subStr dataUsingEncoding:NSUnicodeStringEncoding];
        
        NSString * tempStr = [NSString stringWithFormat:@"%@",data];
        
        char c1 = [tempStr characterAtIndex:[tempStr length]-5];
        
        char c2 = [tempStr characterAtIndex:[tempStr length]-4];
        
        char c3 = [tempStr characterAtIndex:[tempStr length]-3];
        
        char c4 = [tempStr characterAtIndex:[tempStr length]-2];
        
        if (i == [curStr length] - 1) {
              [result appendFormat:@"%c%c%c%c",c3,c4,c1,c2];
        }
        else{
               [result appendFormat:@"%c%c%c%c%@",c3,c4,c1,c2,@"-"];
        }
    }
    return [result uppercaseString];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

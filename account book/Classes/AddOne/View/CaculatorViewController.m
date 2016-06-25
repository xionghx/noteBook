//
//  CaculatorViewController.m
//  account book
//
//  Created by xionghuanxin on 6/18/16.
//  Copyright © 2016 xionghuanxin. All rights reserved.
//

#import "CaculatorViewController.h"

@interface CaculatorViewController ()

@end

@implementation CaculatorViewController

//@synthesize button,label,string,num1,num2,str;//string保存字符，显示数值。num1是存输入的数值，num2是计算结果，str是判断进行何种运算
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置背景图片
    NSBundle *bundle=[NSBundle mainBundle];
    NSData *data=[[NSData alloc]initWithContentsOfFile:
                  [bundle pathForResource:@"icon" ofType:@"png"]];//找到NSBundle的某一资源
    UIImage *img=[UIImage imageWithData:data];//创建了可用的图像对象
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:img]];//UIColor colorWithPatternImage:方法是把图片转化为color类型  将背景换做提供的图片
    
    //创建标签
    self.label=[[UILabel alloc]initWithFrame:CGRectMake(90, 40, 200, 50)];
    [self.view addSubview:_label];
    self.label.backgroundColor=[UIColor clearColor];//清空背景颜色
    self.label.textColor=[UIColor blueColor];//字体颜色
    self.label.textAlignment=NSTextAlignmentRight;//字体居右
    self.label.font=[UIFont systemFontOfSize:32.4];
    
    //添加1-9数字
    NSArray *array=[NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
    int n=0;
    for (int i=0; i<3; i++)
    {
        for (int j=0; j<3; j++)
        {
            self.button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
            self.button.frame=CGRectMake(30+65*j, 150+65*i, 60, 60);
            [self.button setTitle:[array objectAtIndex:n++] forState:UIControlStateNormal];
            [self.view addSubview:_button];
            [self.button addTarget:self action:@selector(shuzi:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    //单独添加0
    UIButton *button0=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button0 setFrame:CGRectMake(30, 345, 60, 60)];
    [button0 setTitle:@"0" forState:UIControlStateNormal];
    [button0 addTarget:self action:@selector(shuzi:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button0];
    
    
    //添加运算符
    NSArray *array1=[NSArray arrayWithObjects:@"+",@"-",@"*",@"/",nil];
    for (int i=0; i<4; i++)
    {
        UIButton *button1=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button1 setFrame:CGRectMake(225, 150+65*i, 60, 60)];
        [button1 setTitle:[array1 objectAtIndex:i] forState:UIControlStateNormal];
        [self.view addSubview:button1];
        [button1 addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    //添加=
    UIButton *button2=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button2 setFrame:CGRectMake(160, 410, 125, 35)];
    [button2 setTitle:@"=" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    
    //添加清除键
    UIButton *button3=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button3 setFrame:CGRectMake(30, 410, 125, 35)];
    [button3 setTitle:@"AC" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(clean:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    
    //添加.
    UIButton *button4=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button4 setFrame:CGRectMake(95, 345, 60, 60)];
    [button4 setTitle:@"." forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(shuzi:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    
    //后退
    UIButton *button5=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button5 setFrame:CGRectMake(160, 345, 60, 60)];
    [button5 setTitle:@"back" forState:UIControlStateNormal];
    [button5 addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button5];
    
    self.string=[[NSMutableString alloc]init];//初始化可变字符串，分配内存
//    self.str=[[NSString alloc]init];
    
    // Do any additional setup after loading the view, typically from a nib.
}

//0-9方法
-(void)shuzi:(id)sender
{
    
    [self.string appendString:[sender currentTitle]];//数字连续输入
    self.label.text=[NSString stringWithString:_string];//显示数值
    self.num1=[self.label.text doubleValue];//保存输入的数值
    NSLog(@"self.num1  is  %f",self.num1);
    
}

//计算方法
-(void)go:(id)sender
{
    if ([self.str isEqualToString:@""])//当str里为空
    {
        self.num2=self.num1;
        NSLog(@"self.num2  is  %f",self.num2);
        self.label.text=[NSString stringWithString:_string];//只要是符号就显示数值
        [self.string setString:@""];//字符串清零
        self.str=[sender currentTitle];//保存运算符为了作判断作何种运算
        NSLog(@"%@",_str);
        [self.string appendString:self.str];
        self.label.text=[NSString stringWithString:_string];//显示数值
        [self.string setString:@""];//字符串清零
    }
    else
    {
        //输出上次计算结果
        if ([self.str isEqualToString:@"+"])//之前的符号是+
        {
            [self.string setString:@""];//字符串清零
            self.num2+=self.num1;//num2是运算符号左边的数值，还是计算结果
            
            //输出上次结果后判断这次输入的是何符号
            if ([[sender currentTitle]isEqualToString:@"="])
            {
                NSLog(@"self.num2 is %f",self.num2);
                self.label.text=[NSString stringWithFormat:@"%f",self.num2];
                self.str=@"";
            }
            else if ([[sender currentTitle]isEqualToString:@"+"]||[[sender currentTitle]isEqualToString:@"-"]||[[sender currentTitle]isEqualToString:@"*"]||[[sender currentTitle]isEqualToString:@"/"])
            {
                NSLog(@"self.num2 is %f",self.num2);
                self.label.text=[NSString stringWithFormat:@"%f",self.num2];
                [self.string setString:@""];//字符串清零
                self.str=[sender currentTitle];//保存运算符为了作判断作何种运算
                NSLog(@"%@",_str);
                [self.string appendString:self.str];
                [self.string setString:@""];//字符串清零
            }
        }
        
        else if ([self.str isEqualToString:@"-"])//之前的符号是-
        {
            [self.string setString:@""];//字符串清零
            self.num2-=self.num1;
            //输出上次结果后判断这次输入的是何符号
            if ([[sender currentTitle]isEqualToString:@"="])
            {
                NSLog(@"self.num2  is  %f",self.num2);
                self.label.text=[NSString stringWithFormat:@"%f",self.num2];
                self.str=@"";
            }
            else if ([[sender currentTitle]isEqualToString:@"+"]||[[sender currentTitle]isEqualToString:@"-"]||[[sender currentTitle]isEqualToString:@"*"]||[[sender currentTitle]isEqualToString:@"/"])
            {
                NSLog(@"self.num2  is  %f",self.num2);
                self.label.text=[NSString stringWithFormat:@"%f",self.num2];
                [self.string setString:@""];//字符串清零
                self.str=[sender currentTitle];//保存运算符为了作判断作何种运算
                NSLog(@"%@",_str);
                [self.string appendString:self.str];
                [self.string setString:@""];//字符串清零
            }
        }
        
        else if([self.str hasPrefix:@"*"])//之前的符号是*
        {
            [self.string setString:@""];//字符串清零
            self.num2*=self.num1;
            //输出上次结果后判断这次输入的是何符号
            if ([[sender currentTitle]isEqualToString:@"="])
            {
                NSLog(@"self.num2 is %f",self.num2);
                self.label.text=[NSString stringWithFormat:@"%f",self.num2];
                self.str=@"";
            }
            else if ([[sender currentTitle]isEqualToString:@"+"]||[[sender currentTitle]isEqualToString:@"-"]||[[sender currentTitle]isEqualToString:@"*"]||[[sender currentTitle]isEqualToString:@"/"])
            {
                NSLog(@"self.num2 is %f",self.num2);
                self.label.text=[NSString stringWithFormat:@"%f",self.num2];
                [self.string setString:@""];//字符串清零
                self.str=[sender currentTitle];//保存运算符为了作判断作何种运算
                NSLog(@"%@",_str);
                [self.string appendString:self.str];
                [self.string setString:@""];//字符串清零
            }
        }
        
        else if ([self.str isEqualToString:@"/"])//之前的符号是/
        {
            [self.string setString:@""];//字符串清零
            self.num2/=self.num1;
            //判断输出上次结果后判断这次输入的是何符号
            if ([[sender currentTitle]isEqualToString:@"="])
            {
                NSLog(@"self.num2  is  %f",self.num2);
                self.label.text=[NSString stringWithFormat:@"%f",self.num2];
                self.str=@"";
            }
            else if ([[sender currentTitle]isEqualToString:@"+"]||[[sender currentTitle]isEqualToString:@"-"]||[[sender currentTitle]isEqualToString:@"*"]||[[sender currentTitle]isEqualToString:@"/"])
            {
                NSLog(@"self.num2  is  %f",self.num2);
                self.label.text=[NSString stringWithFormat:@"%f",self.num2];
                [self.string setString:@""];//字符串清零
                self.str=[sender currentTitle];//保存运算符为了作判断作何种运算
                NSLog(@"%@",_str);
                [self.string appendString:self.str];
                [self.string setString:@""];//字符串清零
            }
            
        }
    }
}


//当按下清除建时，所有数据清零
-(void)clean:(id)sender{
    [self.string setString:@""];//清空字符
    self.num1=0;
    self.num2=0;
    self.label.text=@"0";//保证下次输入时清零
    
}

//返回键
-(void)back:(id)sender
{
    if (![self.label.text isEqualToString:@""])//判断不是空
    {
        [self.string deleteCharactersInRange:NSMakeRange
         ([self.string length]-1,1)];//删除最后一个字符
        self.label.text=[NSString stringWithString:_string];//显示结果
    }
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


@end

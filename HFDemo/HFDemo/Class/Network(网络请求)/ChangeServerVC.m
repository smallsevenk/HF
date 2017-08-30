//
//  ChangeServerViewController.m
//  HFDemo
//
//  Created by smallsevenk on 16/12/24.
//  Copyright © 2016年 HappinessFamily. All rights reserved.
//

#import "ChangeServerVC.h"
#import "HFUserDefault.h"

@interface ChangeServerVC ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>{
    UITableView             *mainTbView;
    NSMutableArray          *dataArr;
}

@end

@implementation ChangeServerVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setTitle:@"环境切换"];
    
    [self setUpViews];
}

- (void)setUpViews{
    
    dataArr = [ChangeServerVC servers];
    
    mainTbView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    mainTbView.delegate = self;
    mainTbView.dataSource = self;
    mainTbView.showsVerticalScrollIndicator = NO;
    mainTbView.backgroundColor = [UIColor tbBgGrayColor];
    [mainTbView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    [self.view addSubview:mainTbView];
    
//    UIView *headerView = [UIView new];
////    [mainTbView setTableHeaderView:headerView];
//    headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, kTruePx(kTrueTwoPx(70+16*2)));
//    headerView.backgroundColor = [UIColor tbBgGrayColor];
//    
//    UITextField *nameInputView = [UITextField new];
//    [headerView addSubview:nameInputView];
//    nameInputView.frame = CGRectMake(kTrueTwoPx(30), kTrueTwoPx(16), kTrueTwoPx(120), kTrueTwoPx(70));
//    nameInputView.borderStyle = UITextBorderStyleNone;
//    [nameInputView kCornerAndBorderWithRadius:kTrueTwoPx(10) borderWidth:kTrueTwoPx(2) borderColor:kLineLightGary];
//    nameInputView.placeholder = @"张三";
//    [nameInputView setDelegate:self];
//    
//    UITextField *ipInputView = kInit(UITextField);
//    [headerView addSubview:ipInputView];
//    ipInputView.frame = CGRectMake(nameInputView.right+kTrueTwoPx(16),
//                               nameInputView.top,
//                               kScreenWidth-nameInputView.right-kTrueTwoPx(30+16),
//                               nameInputView.height);
//    ipInputView.borderStyle = UITextBorderStyleNone;
//    [ipInputView kCornerAndBorderWithRadius:kTrueTwoPx(10)
//                                borderWidth:kTrueTwoPx(2)
//                                borderColor:kLineLightGary];
//    ipInputView.placeholder = @"192.168.1.30:9080";
//    [ipInputView setDelegate:self];
//    
//    UIButton *newServerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [newServerBtn setTitle:@"NewServer" forState:UIControlStateNormal];
//    [newServerBtn.titleLabel setFont:kFont(16)];
//    [newServerBtn.titleLabel setTextAlignment:NSTextAlignmentCenter];
//    [newServerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [newServerBtn setBackgroundColor:[UIColor whiteColor]];
//    [newServerBtn addTarget:self action:@selector(touchAction) forControlEvents:UIControlEventTouchUpInside];
//    [newServerBtn setFrame:CGRectMake(ipInputView.right+kTrueTwoPx(16), ipInputView.top, kTrueTwoPx(90),nameInputView.height)];
//    [headerView addSubview:newServerBtn];
}

#pragma mark ——— ZZMark-TextFiledDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)touchAction{
    
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

#pragma mark ——— UITableViewDataSource and UITableViewDelegate Methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self buildNormalCell:indexPath];
}

#pragma mark ——— ZZMark-BuildCell

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell*)buildNormalCell:(NSIndexPath*)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@""];
    ServerModel *model = [dataArr objectOrNilAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryNone;
    if ([model.serverUrl isEqualToString:[ChangeServerVC basicSever].serverUrl]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    cell.textLabel.text = model.serverOwner;
    NSString *showString = [model.serverUrl replaceCharcter:@"http://" withCharcter:@""];
    showString = [showString replaceCharcter:@"/g/" withCharcter:@""];
    cell.detailTextLabel.text = showString;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [ChangeServerVC changeBasicSever:[dataArr objectOrNilAtIndex:indexPath.row]];
    
    [self.navigationController popViewControllerAnimated:YES];
}

+ (ServerModel*)basicSever{
    ServerModel *server = [HFUserDefault xSelfObjectForKey:HFDefaultServer];
    if (!server)
    {

        NSInteger serverIndex = 0;
        
#ifdef DEBUG
//        serverIndex = 6;
#endif
        
        [HFUserDefault xSaveSelfDefineObject:[ChangeServerVC servers][serverIndex]
                                       forKey:HFDefaultServer];
    }
    return server;
}

+ (NSMutableArray*)servers{
    
    return  [NSMutableArray arrayWithObjects:
             
             [[ServerModel alloc] initWithOwner:@"AppStore"
                                            url:@"http://g.HappinessFamily.com:9080/g/"],
             
             [[ServerModel alloc] initWithOwner:@"开发环境"
                                            url:@"http://192.168.1.32:9080/g/"],
             
             [[ServerModel alloc] initWithOwner:@"开发环境外网"
                                            url:@"http://222.244.144.134:9104/g/"],
    
             [[ServerModel alloc] initWithOwner:@"测试环境"
                                            url:@"http://192.168.1.33:9080/g/"],
             
             [[ServerModel alloc] initWithOwner:@"测试环境外网"
                                            url:@"http://222.244.144.134:9080/g/"],
             
             nil];
}

+ (void)changeBasicSever:(ServerModel*)model{
    [HFUserDefault xSaveSelfDefineObject:model forKey:HFDefaultServer];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

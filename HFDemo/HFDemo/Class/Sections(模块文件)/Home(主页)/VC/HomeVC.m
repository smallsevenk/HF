//
//  HomeVC.m
//  HFDemo
//
//  Created by smallsevenk on 2017/8/10.
//  Copyright © 2017年 HappinessFamily. All rights reserved.
//

#import "HomeVC.h"


#import "HomeCellModel.h"

//Cell
#import "HomePayCell.h"
#import "HomeAdCell.h"
#import "HomeBalanceCell.h"
#import "HomeOtherCell.h"

#import "HomeVM.h"

@interface HomeVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)   HomeVM *vm;

//列表
@property (nonatomic, strong)   UITableView *mainTbView;

//表数据源
@property (nonatomic, strong)   NSMutableArray<NSMutableArray<HomeCellModel *> *> *dataArr;

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initialize];
}

#pragma mark    -------------------begin-----------------------------
#pragma mark - UITableViewDataSource and UITableViewDelegate Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dataArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr[section].count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (self.dataArr[indexPath.section][indexPath.row].cellType)
    {
        case HomeCell_Pay:
        {
            HomePayCell *cell = [HomePayCell cellClassWithTableView:tableView];
            @weakify(self)
            cell.didSelect = ^(HomePayCell *wcell,NSInteger idx) {
                @strongify(self)
                
                NSArray *items = [HomeOtherCell items];
                
                switch (idx) {
                    case 0:
                    {
                        
                         NSLog(@"我要去:%@",@"扫码");
                    }
                        break;
                    case 1:
                    {
                        
                         NSLog(@"我要去:%@",@"收钱");
                    }
                        break;
                        
                    default:
                    {
                       
                        NSLog(@"我要去:%@",@"收银台");
                    }
                        break;
                }
            };
            
            return cell;
        }
            break;
        case HomeCell_AD:{
            HomeAdCell *cell = [HomeAdCell cellClassWithTableView:tableView];
            return cell;
        }
            break;
        case HomeCell_Balance:{
            HomeBalanceCell *cell = [HomeBalanceCell cellClassWithTableView:tableView];
            
            return cell;
        }
            break;
        default:
        {
            HomeOtherCell *cell = [HomeOtherCell cellClassWithTableView:tableView];
            @weakify(self)
            cell.didSelect = ^(HomeOtherCell *wcell, HomeOtherCellType type) {
                @strongify(self)
                
                NSArray *items = [HomeOtherCell items];
                
                [self.view makeToast:items[type][@"text"]];
                NSLog(@"我要去:%@",items[type][@"text"]);
                
                switch (type) {
                        
                        //绑卡
                    case OtherType_bindCard:
                    {
                        [self.vm listWithResponseBlock:^(BOOL isOK, id data, NSError *error) {
                            
                        }];
                    }
                        break;
                        //卡包
                    case OtherType_cardBag:
                    {
                       
                    }
                        break;
                        //卡明细
                    case OtherType_cardDetail:
                    {
                        
                    }
                        break;
                        //账单
                    case OtherType_bill:
                    {
                        
                    }
                        break;
                        //实名认证
                    case OtherType_autonym:
                    {
                        
                    }
                        break;
                        
                        //安全中心
                    case OtherType_securityCenter:
                    {
                        
                    }
                        break;
                    default:
                        break;
                }
            };

            return cell;
        }
            break;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.dataArr[indexPath.section][indexPath.row].rowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 2) {
        return 40.0f;
    }
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    if (section == 2) {
//        UIView *view = [UIView new];
//        view.backgroundColor = [UIColor tbBgGrayColor];
//        view.frame = CGRectMake(0,0,SCREEN_WIDTH,30);
        
        UILabel *titleLab = [UILabel new];
        titleLab.text = @"  云猴卡";
        titleLab.font = [UIFont boldSystemFontOfSize:14];
        titleLab.textColor = [UIColor blackColor];
        titleLab.backgroundColor = [UIColor whiteColor];
        titleLab.frame = CGRectMake(0,0,SCREEN_WIDTH,40);
//        [view addSubview:titleLab];
        
        return titleLab;
    }
    
    return nil;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if (section == 2) {
        return CGFLOAT_MIN;
    }
    return 8;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
   
    if (section == 2) {
        return nil;
    }
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor tbBgGrayColor];
    view.frame = CGRectMake(0,0,SCREEN_WIDTH,8);
    return view;
}

#pragma mark    initialize

- (void)initialize{
    
    [self setTitle:@"云猴钱包"];
    
    [self setUpViews];
    [self setLayout]; 
}

- (void)setUpViews
{
    [self.view addSubview:self.mainTbView];
    
}

- (void)setLayout
{
    [_mainTbView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

#pragma mark - Lazy


- (UITableView *)mainTbView {
    
    if (!_mainTbView) {
        
        _mainTbView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _mainTbView.delegate = self;
        _mainTbView.dataSource = self;
        _mainTbView.showsVerticalScrollIndicator = NO;
        _mainTbView.backgroundColor = [UIColor tbBgGrayColor];
        _mainTbView.separatorColor = [UIColor clearColor];  
        [_mainTbView registerTableViewCellClass:[HomePayCell class]];
        [_mainTbView registerTableViewCellClass:[HomeAdCell class]];
        [_mainTbView registerTableViewCellClass:[HomeBalanceCell class]];
        [_mainTbView registerTableViewCellClass:[HomeOtherCell class]];
    }
    
    return _mainTbView;
}


- (NSMutableArray *)dataArr {
    
    if (!_dataArr) {
        
        _dataArr = [[NSMutableArray alloc] init];
        NSMutableArray *section1Arr = [[NSMutableArray alloc] initWithObjects:[HomeCellModel initWithCellType:HomeCell_Pay rowHeight:[HomePayCell height]], nil];
        [_dataArr addObject:section1Arr];
        
        NSMutableArray *section2Arr = [[NSMutableArray alloc] initWithObjects:[HomeCellModel initWithCellType:HomeCell_AD rowHeight:[HomeAdCell height]], nil];
        [_dataArr addObject:section2Arr];
        
        NSMutableArray *section3Arr = [[NSMutableArray alloc] initWithObjects:[HomeCellModel initWithCellType:HomeCell_Balance rowHeight:[HomeBalanceCell height]], nil];
        [_dataArr addObject:section3Arr];
        
        NSMutableArray *section4Arr = [[NSMutableArray alloc] initWithObjects:[HomeCellModel initWithCellType:HomeCell_Other rowHeight:[HomeOtherCell height]], nil];
        [_dataArr addObject:section4Arr];
        
    }
    
    return _dataArr;
}

- (HomeVM *)vm {
    
    if (!_vm) {
        
        _vm = [[HomeVM alloc] init];
        
    }
    
    return _vm;
}

#pragma mark    -------------------ended-----------------------------


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

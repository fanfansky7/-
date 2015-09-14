//
//  YKSCityViewController.m
//  YueKangSong
//
//  Created by 范 on 15/9/14.
//  Copyright (c) 2015年 YKS. All rights reserved.
//

#import "YKSCityViewController.h"
#import"GZBaseRequest.h"
#import "YKSCityModel.h"
@interface YKSCityViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView ;

@property(nonatomic,strong)NSMutableArray *dataArray;

@property(nonatomic,strong)NSMutableArray *indexAarray;
@end

@implementation YKSCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray=[NSMutableArray array];
    
    _indexAarray = [[NSMutableArray alloc]init];
    
    for(char c = 'A';c<='Z';c++)
    {
        
        [_indexAarray addObject:[NSString stringWithFormat:@"%c",c]];
    }
    
     [self createTableView];
    
    [self loadData];
    

   
}

-(void)loadData{
    
    

    [GZBaseRequest cityNameLictBack:^(id responseObject, NSError *error) {
        
        if (ServerSuccess(responseObject)) {
            
            NSArray *dataArray=responseObject[@"data"];
            
            for (NSDictionary *dict in dataArray) {
                
                YKSCityModel *model=[[YKSCityModel alloc]init];
                [model setValuesForKeysWithDictionary:dict];
                
                [_dataArray addObject:model];
                
            }
         
            [_tableView reloadData];
        }
        else {
        
        [self showToastMessage:responseObject[@"msg"]];
        }
        
    }];
    
    
    

}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [_indexAarray objectAtIndex:section];
}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString*)title atIndex:(NSInteger)index
{
    return [_indexAarray indexOfObject:title];
}

-(void)createTableView{

    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
    _tableView.sectionIndexColor = [UIColor blueColor];
    _tableView.sectionIndexTrackingBackgroundColor = [UIColor grayColor];
    [self.view addSubview:_tableView];


}

#pragma  mark dataSouse

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return self.dataArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cityCell"];
    
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cityCell"];
    }
    YKSCityModel *model=_dataArray[indexPath.section];
    
    
    cell.textLabel.text=model.city_name;
    
    return cell;

}
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView

{
    
    
    return _indexAarray;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

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

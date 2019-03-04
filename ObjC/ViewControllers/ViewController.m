//
//  ViewController.m
//  ObjC
//
//  Created by Patel, Keval Tulsibhai on 3/3/19.
//  Copyright © 2019 Patel, Keval Tulsibhai. All rights reserved.
//

#import "ViewController.h"
#import "EmployeeModel.h"
#import "EmployeeCell.h"
#include "DetailVC.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tblEmployee;
@property (nonatomic,strong) NSMutableArray<EmployeeModel *> *employees;
@end

@implementation ViewController
NSInteger count;
- (void)viewDidLoad {
    [super viewDidLoad];
    count = 0;
    _employees = NSMutableArray.new;
//   _tblEmployee.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    //APi call in to the backgrounfd queue
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
    dispatch_async(queue, ^{
        [self getEmployeeData];
    });

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _employees.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EmployeeCell * cell = [_tblEmployee dequeueReusableCellWithIdentifier:@"EmployeeCell" forIndexPath:indexPath];
    cell.lblName.text = [NSString stringWithFormat:@"%@",_employees[indexPath.row].employee_name];
    cell.lblSalary.text = [NSString stringWithFormat:@"%@",_employees[indexPath.row].employee_salary];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailVC *dstVC = [[self storyboard]instantiateViewControllerWithIdentifier:@"DetailVC"];
    dstVC.employee = _employees[indexPath.row];
    [self.navigationController pushViewController:dstVC animated:true];
}


//MARK: - getEmployeeData
// An Api call to retrive employee details from server
-(void) getEmployeeData{
    NSURL * url = [NSURL URLWithString:@"http://dummy.restapiexample.com/api/v1/employees"];
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //Checks For Error in the api call
        if (error != nil){
            NSLog(@"%@",error.localizedDescription);
        }
        // Checks for the data is nil or not
        if (data != nil){
            //Convert the encoded string into the string, to jus check and printing response
            NSString *tempStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSError *error;
            
            //Jump here if the response comes.NSJSONSerialization
            NSArray * employeeJson = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            if (error){
                NSLog(@"%@",error);
            }
            else{
                for (NSDictionary *employee in employeeJson) {
                    EmployeeModel * emp = [[EmployeeModel alloc]init];
                    [emp setValuesForKeysWithDictionary:employee];
                    [self->_employees addObject:emp];
                }
         
                
                // Moved to main queue to update UI
                dispatch_async(dispatch_get_main_queue(), ^{
                    count = self->_employees.count;
                    [self->_tblEmployee reloadData];
                });
            }
        }
    }] resume];
}

@end

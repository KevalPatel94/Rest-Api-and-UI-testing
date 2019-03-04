//
//  DetailVC.m
//  ObjC
//
//  Created by Patel, Keval Tulsibhai on 3/3/19.
//  Copyright © 2019 Patel, Keval Tulsibhai. All rights reserved.
//

#import "DetailVC.h"

@interface DetailVC ()
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblSalary;
@property (weak, nonatomic) IBOutlet UILabel *lblAge;
@property (weak, nonatomic) IBOutlet UILabel *lblId;

@end

@implementation DetailVC
@synthesize employee;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self mapDatainToUI];
}

-(void) mapDatainToUI{
    _lblName.text = [NSString stringWithFormat:@"%@",employee.employee_name];
    _lblAge.text = [NSString stringWithFormat:@"%@",employee.employee_age];
    _lblSalary.text = [NSString stringWithFormat:@"%@",employee.employee_salary];
    _lblId.text = [NSString stringWithFormat:@"%@",employee.id];

}
@end

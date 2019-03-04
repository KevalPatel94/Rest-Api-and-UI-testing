//
//  EmployeeCell.h
//  ObjC
//
//  Created by Patel, Keval Tulsibhai on 3/3/19.
//  Copyright © 2019 Patel, Keval Tulsibhai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EmployeeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblSalary;

@end

NS_ASSUME_NONNULL_END

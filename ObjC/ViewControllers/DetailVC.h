//
//  DetailVC.h
//  ObjC
//
//  Created by Patel, Keval Tulsibhai on 3/3/19.
//  Copyright © 2019 Patel, Keval Tulsibhai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmployeeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface DetailVC : UIViewController
@property (nonatomic,weak) EmployeeModel *employee;
@end

NS_ASSUME_NONNULL_END

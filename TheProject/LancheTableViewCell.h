//
//  LancheTableViewCell.h
//  TheProject
//
//  Created by Mac Mini on 21/07/14.
//  Copyright (c) 2014 Dextra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LancheTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *price;

- (void)lanche:(NSDictionary*)lanche;
@end

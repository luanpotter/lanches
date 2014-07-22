//
//  LancheTableViewCell.m
//  TheProject
//
//  Created by Mac Mini on 21/07/14.
//  Copyright (c) 2014 Dextra. All rights reserved.
//

#import "LancheTableViewCell.h"

@implementation LancheTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)lanche:(NSDictionary *)lanche{
    [_name setText: [lanche valueForKey:@"nome"]];
    NSString *rawPrice = [lanche valueForKey:@"preco"];
    [_price setText: [NSString stringWithFormat:@"R$ %.2f", [rawPrice floatValue]]];

    NSData* imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[lanche valueForKeyPath:@"imagem"]]];
    UIImage *img = [UIImage imageWithData:imageData];
    [_image setImage: img];
}

@end

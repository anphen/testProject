//
//  ZXWaterFallCell.h
//  testWaterFall
//
//  Created by xu zhao on 2018/8/13.
//  Copyright © 2018年 xu zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface dataModel : NSObject

@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *title1;
@property (nonatomic, copy) NSString *title2;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *count;

@end


@interface ZXWaterFallCell : UICollectionViewCell

@property (nonatomic, strong) dataModel *data;

@end
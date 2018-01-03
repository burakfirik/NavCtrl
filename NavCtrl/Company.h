//
//  Company.h
//  NavCtrl
//
//  Created by Burak Firik on 1/3/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Company : NSObject

@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) UIImage* logo;
@property (nonatomic, retain) NSMutableArray * products;

- (instancetype) initName: (NSString*) name
                     logo: (NSString*) logo
                 products: (NSMutableArray*) products;


-(instancetype) initName: (NSString*) name
            downloadLogo: logo;

@end

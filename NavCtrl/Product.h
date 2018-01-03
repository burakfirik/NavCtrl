//
//  Product.h
//  NavCtrl
//
//  Created by Burak Firik on 1/3/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (nonatomic, retain) NSString* productName;
@property (nonatomic, retain) NSString* productURL;
@property (nonatomic, retain) UIImage* productImage;

-(instancetype) initName: (NSString*) givenName
              productURL: (NSString*) givenURL
            productImage: (NSString*) imageInput;

- (instancetype) initName: (NSString*) givenName
                     logo: (UIImage*) productLogo;

@end

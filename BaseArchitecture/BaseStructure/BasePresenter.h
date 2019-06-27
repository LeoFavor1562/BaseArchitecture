//
//  BasePst.h
//  MVPDemo
//
//  Created by coder on 2019/3/4.
//  Copyright © 2019年 coder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
#import "BaseVC.h"

@interface BasePresenter : NSObject <BaseVCProtocol>

//基本模型
@property (nonatomic, strong) BaseModel *baseModel;
//基本数组
@property (nonatomic, strong) NSArray *baseArray;
//基本字符串
@property (nonatomic, strong) NSString *baseString;

/**
 初始化
 @param VC 持有该Pst的VC
 @return self
 */
- (instancetype)initWithVC:(BaseVC *)VC;
/**
 返回持有的VC
 @return 持有的VC
 */
- (BaseVC *)currentVC;
/**
 注册模型类型
 
 @param tag 标记，默认使用URL
 @return 模型类型
 */
- (Class<BaseModelProtocol>)modelClassForURLTag:(NSString *)tag;

//请求回调
- (void)success:(id)obj tag:(NSString *)tag;
- (void)fail:(NSString *)tag;
- (void)empty:(NSString *)tag;
- (void)error:(NSString *)tag;

//列表行数
- (NSInteger)listCount;
//设置cell
- (void)setCell:(UITableViewCell *)cell ForIndex:(NSIndexPath *)indexPath;

@end

